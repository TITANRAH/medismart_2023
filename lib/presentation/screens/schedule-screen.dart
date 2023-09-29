import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medismart_2023/presentation/providers/especialities/especialities_provider.dart';
import 'package:medismart_2023/presentation/providers/user/user_provider.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  static const name = 'schedule';

  final String? tipoServicio;

  const ScheduleScreen({
    super.key,
    this.tipoServicio,
  });

  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  @override
  void didChangeDependencies() {
    final user = ref.watch(userActiveProvider);

    ref
        .read(especialitiesProvider.notifier)
        .getEspecialities(user.userId, user.idCliente, widget.tipoServicio);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final especialities = ref.watch(especialitiesProvider);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        backgroundColor: colors.onPrimary,
        iconColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Stepers(
              isActiveOne: true,
              isActiveTwo: false,
              isActiveThree: false,
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: _BoxService(
                        iconBox: './assets/svg/icon_tuplanempresa_g.svg',
                        textService: 'TU PLAN EMPRESA',
                        isActiveBox:
                            widget.tipoServicio == 'S' ? true : false,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: _BoxService(
                        iconBox: './assets/svg/medicina-especialista.svg',
                        textService: 'MEDICINA ESPECIALISTA',
                        isActiveBox:
                            widget.tipoServicio == 'O' ? true : false,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    print('lifestyle');
                  },
                  child: _BoxService(
                    iconBox: './assets/svg/wellnes-b.svg',
                    textService: 'LIFESTYLE & WELLNES',
                    isActiveBox: widget.tipoServicio == 'V' ? true : false,
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: especialities.length,
                    itemBuilder: (context, index) {
                      final especialitie = especialities[index];
                      return SizedBox(
                        height: 200, // Restringe la altura del widget interno
                        child: Text(especialitie.detail!),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BoxService extends StatelessWidget {
  final String iconBox;
  final String textService;
  final bool isActiveBox;
  final double height;
  final double width;

  const _BoxService({
    required this.iconBox,
    required this.textService,
    required this.isActiveBox,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    final Color isActive = Colors.amber.shade600;
    final Color colorBox = Colors.blue.shade300;

    return SizedBox(
      width: 190,
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: isActiveBox ? isActive : colorBox,
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconBox,
                height: height,
                width: width,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textService,
                style: textStyle!.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
