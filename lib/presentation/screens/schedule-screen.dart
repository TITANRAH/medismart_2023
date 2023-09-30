import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medismart_2023/domain/entities/especialitie/especialitie.dart';
import 'package:medismart_2023/presentation/providers/especialities/especialities_provider.dart';
import 'package:medismart_2023/presentation/providers/medical_directory/medical_directory_provider.dart';
import 'package:medismart_2023/presentation/providers/user/user_provider.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  static const name = 'schedule';

  String? tipoServicio;

  ScheduleScreen({
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

    ref.read(especialitiesProvider.notifier).getEspecialities(user.userId,
        user.idCliente, widget.tipoServicio != '' ? widget.tipoServicio : 'S');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final especialities = ref.watch(especialitiesProvider);
    const bool isDirectory = false;

    final user = ref.watch(userActiveProvider);
    final medicalDirectory = ref.watch(medicalDirectoryDoctorsProvider);

    void selectService(String serviceType) {
      ref
          .read(especialitiesProvider.notifier)
          .getEspecialities(user.userId, user.idCliente, serviceType);

      widget.tipoServicio = serviceType;
    }

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        backgroundColor: colors.onPrimary,
        iconColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
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
                        onTap: () {
                          selectService('S');
                        },
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
                        onTap: () {
                          selectService('O');
                        },
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
                      selectService('V');
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
              const SizedBox(
                height: 40,
              ),
              _CustomDropdown(especialities: especialities, typeService: 'O'),
              medicalDirectory.isNotEmpty
                  ? SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: medicalDirectory.length,
                        itemBuilder: (context, index) {
                          final doctor = medicalDirectory[index];
                          return Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: doctor.fotoPerfil != ''
                                          ? Image.network('https://services.medismart.live${doctor.fotoPerfil!}'.replaceAll('/', '//'))
                                          : const Text('Sin Foto'), 
                                    ),
                                    Column(
                                      children: [
                                        Text(doctor.nombreMedico!),
                                        Text(doctor.especialidad!),
                                        const Text('Atención más cercana'),
                                        Text(
                                            '${doctor.fechaText} - ${doctor.horadesDeText}'),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(child: Text('SELECCIONA UNA ESPECIALIDAD')),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomDropdown extends ConsumerWidget {
  final List<Especialitie> especialities;
  final String? typeService;

  const _CustomDropdown({
    this.typeService,
    required this.especialities,
  });

  @override
  Widget build(BuildContext context, ref) {
    var currentValue = 'Selecciona una especialidad';
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.labelLarge;
    final user = ref.watch(userActiveProvider);

    return especialities.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colors.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField<String>(
              key: UniqueKey(),
              value: currentValue == ''
                  ? especialities.firstWhere(
                          (e) => e.detail == 'Selecciona una especialidad')
                      as String
                  : currentValue,
              isExpanded: true,
              itemHeight: 50,
              menuMaxHeight: 400,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: colors.primary, // Color del ícono
                  size: 40,
                ),
              ),
              items: especialities
                  .toSet()
                  .map(
                    (item) => DropdownMenuItem<String>(
                      onTap: (() {
                        ref
                            .read(medicalDirectoryDoctorsProvider.notifier)
                            .getMedicalDirectory(
                                user.userId, user.idCliente, typeService);
                      }),
                      value: item.detail,
                      child: Center(
                        child: Text(
                          item.detail!.toUpperCase(),
                          style: textStyle!.copyWith(color: colors.primary),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                currentValue = item!;
              },
            ))
        : const Center(child: CircularProgressIndicator());
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
              blurRadius: 5.0,
              spreadRadius: 0.1,
              offset: const Offset(0, 5),
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
