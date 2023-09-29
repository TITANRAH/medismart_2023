import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medismart_2023/config/utils/utils.dart';
import 'package:medismart_2023/presentation/providers/user/user_provider.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
          backgroundColor: colors.primary, iconColor: colors.onPrimary),
      // bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.primary,
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              _Saludo(
                saludo: '¡Hola, ',
                segundoSaludo: '¿En qué te podemos ayudar?',
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 750,
                child: _ServicesList(),
              ),
              Powered()
            ],
          ),
        ),
      ),
    );
  }
}

class _ServicesList extends ConsumerStatefulWidget {
  const _ServicesList();

  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends ConsumerState<_ServicesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final userServices = ref.watch(servicesProvider);

    return userServices.when(
      data: (services) {
        return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final servicio = services[index];
              return _CardService(
                text: servicio.texto,
                subText: servicio.subTexto,
                route: servicesRoutes[servicio.cod],
                icon: iconsServices[servicio.cod],
                typeService: servicio.tipoServicio,
              );
            });
      },
      loading: () => Center(
        child: CircularProgressIndicator(
          color: colors.onBackground,
          strokeWidth: 50,
          backgroundColor: colors.secondary,
        ),
      ), // Otra acción cuando está cargando.
      error: (error, stackTrace) => Text('Error: $error'), // Manejo de errores
    );
  }
}

class _CardService extends StatelessWidget {
  final String? icon;
  final String? text;
  final String? subText;
  final String? route;
  final String? typeService;

  const _CardService({
    this.icon,
    this.text,
    this.subText,
    this.route,
    this.typeService,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.push(route!),
      child: Card(
        color: colors.onSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 40, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                icon!,
                width: 60,
                height: 60,
              ),
              Text(
                text!.toUpperCase(),
                style: titleStyle!.copyWith(color: colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Saludo extends ConsumerWidget {
  final String saludo;
  final String segundoSaludo;

  const _Saludo({
    required this.segundoSaludo,
    required this.saludo,
  });

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userActiveProvider);
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(left: 20, right: 10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: colors.onSecondary,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: colors.onPrimary,
            child: const Image(
              image: AssetImage('./assets/img/doctor-circle.png'),
            ),
          ),
        ),
        if (user.name != null)
          Expanded(
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: saludo,
                style: titleStyle!.copyWith(color: colors.onSecondary),
                children: [
                  TextSpan(
                      text: user.name,
                      style: titleStyle.copyWith(color: Colors.amber.shade800)),
                  TextSpan(
                    text: '\n $segundoSaludo',
                    style: titleStyle.copyWith(color: colors.onPrimary),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
