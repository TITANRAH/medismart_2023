import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/domain/entities/especialitie/especialitie.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';
import 'package:medismart_2023/presentation/providers/providers.dart';
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

    ref.read(medicalDirectoryDoctorsProvider.notifier).getMedicalDirectory(
        user.userId,
        user.idCliente,
        widget.tipoServicio != '' ? widget.tipoServicio : 'S');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final especialities = ref.watch(especialitiesProvider);
    final textStyleEspecialitie = Theme.of(context).textTheme.titleSmall;
    final textStyleNameDoctor = Theme.of(context).textTheme.titleMedium;
    final textStyleDate = Theme.of(context).textTheme.titleLarge;
    final user = ref.watch(userActiveProvider);
    final medicalDirectory = ref.watch(medicalDirectoryDoctorsProvider);

    void selectService(String serviceType) {
      ref
          .read(especialitiesProvider.notifier)
          .getEspecialities(user.userId, user.idCliente, serviceType);

      widget.tipoServicio = serviceType;

      ref
          .read(medicalDirectoryDoctorsProvider.notifier)
          .getCurrentEspecialitie('Selecciona una especialidad');

      ref
          .read(medicalDirectoryDoctorsProvider.notifier)
          .getMedicalDirectory(user.userId, user.idCliente, serviceType);
    }

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        backgroundColor: colors.onPrimary,
        iconColor: colors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    height: 10,
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
              _CustomDropdown(
                  especialities: especialities,
                  typeService: widget.tipoServicio!),
              const SizedBox(
                height: 10,
              ),
              !ref.read(medicalDirectoryDoctorsProvider.notifier).isLoading
                  ? _BoxDoctor(
                      medicalDirectory: medicalDirectory,
                      textStyleNameDoctor: textStyleNameDoctor,
                      textStyleEspecialitie: textStyleEspecialitie,
                      colors: colors,
                      textStyleDate: textStyleDate)
                  : const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator()),
                    ),
              const SizedBox(
                height: 20,
              ),
              _SwiperCustom()
            ],
          ),
        ),
      ),
    );
  }
}

class _BoxDoctor extends StatelessWidget {
  _BoxDoctor({
    required this.medicalDirectory,
    required this.textStyleNameDoctor,
    required this.textStyleEspecialitie,
    required this.colors,
    required this.textStyleDate,
  });

  final List<MedicalDirectory> medicalDirectory;
  final TextStyle? textStyleNameDoctor;
  final TextStyle? textStyleEspecialitie;
  final ColorScheme colors;
  final TextStyle? textStyleDate;
  final urlPhoto = Environments.urlServicios;

  @override
  Widget build(BuildContext context) {
    return medicalDirectory.isNotEmpty
        ? SizedBox(
            height: 700,
            child: ListView.builder(
              itemCount: medicalDirectory.length,
              itemBuilder: (context, index) {
                final doctor = medicalDirectory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Establece el radio del borde en cero
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    backgroundColor: Colors
                                        .transparent, // Fondo transparente para que el círculo no tenga un fondo de color
                                    child: ClipOval(
                                        child: doctor.fotoPerfil != null
                                            ? Image.network(
                                                urlPhoto + doctor.fotoPerfil!,
                                                fit: BoxFit
                                                    .cover, // Puedes ajustar la forma en que la imagen se ajusta dentro del círculo
                                                width:
                                                    100, // Ancho de la imagen dentro del círculo
                                                height:
                                                    100, // Altura de la imagen dentro del círculo
                                              )
                                            : Image.asset(
                                                './assets/img/loading.gif',
                                                fit: BoxFit
                                                    .cover, // Puedes ajustar la forma en que la imagen se ajusta dentro del círculo
                                                width:
                                                    100, // Ancho de la imagen dentro del círculo
                                                height:
                                                    100, // Altura de la imagen dentro del círculo
                                              )))),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor.nombreMedico!.toUpperCase(),
                                  style: textStyleNameDoctor!.copyWith(
                                      color: const Color.fromARGB(
                                          255, 138, 143, 168),
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  doctor.especialidad!,
                                  style: textStyleEspecialitie!.copyWith(
                                      color: const Color.fromARGB(
                                          255, 138, 143, 168),
                                      fontWeight: FontWeight.w900),
                                ),
                                Text('Atención más cercana'.toUpperCase(),
                                    style: textStyleEspecialitie!.copyWith(
                                        color: colors.inversePrimary)),
                                Text(
                                  '${doctor.fechaText} - ${doctor.horadesDeText}',
                                  style: textStyleDate!.copyWith(
                                      color: colors.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Establece el radio del borde en cero
                                ),
                              ),
                              onPressed: () {
                                context.push('/scheduling', extra: doctor.idMedico);
                              },
                              child: const Text('AGENDAR')),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: Text(
            'SIN PROFESIONALES PARA ESTA ESPECIALIDAD',
            style: textStyleEspecialitie!.copyWith(color: colors.primary),
          ));
  }
}

class _CustomDropdown extends ConsumerWidget {
  final List<Especialitie> especialities;
  final String typeService;
  const _CustomDropdown({
    required this.typeService,
    required this.especialities,
  });

  @override
  Widget build(BuildContext context, ref) {
    // var currentValue = 'Selecciona una especialidad';
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.labelLarge;
    final currentValue = ref
        .read(medicalDirectoryDoctorsProvider.notifier)
        .currentValueEspecialitie;
    final user = ref.watch(userActiveProvider);

    return especialities.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colors.inversePrimary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField<String>(
              key: UniqueKey(),
              value: currentValue,
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
                  color: colors.inversePrimary, // Color del ícono
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
                            .filteredDoctors(currentValue, item.code!,
                                user.userId!, typeService, user.idCliente!);
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
                ref
                    .read(medicalDirectoryDoctorsProvider.notifier)
                    .getCurrentEspecialitie(item!);
              },
            ))
        : Container();
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
    final textStyle = Theme.of(context).textTheme.bodySmall;

    final Color isActive = Colors.amber.shade600;
    final Color colorBox = Colors.blue.shade300;

    return SizedBox(
      width: 160,
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
                textAlign: TextAlign.center,
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

class _SwiperCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Establece una altura fija
      child: Swiper(
        autoplay: true,
        autoplayDelay: 4000,
        itemCount: 2,
        viewportFraction: 1,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          // Aquí puedes cargar las imágenes desde tu lista de imágenes
          // Por ejemplo, puedes usar NetworkImage o AssetImage para cargar imágenes desde una URL o un archivo local.
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              index == 0
                  ? './assets/img/325x130-1.png'
                  : './assets/img/325x130.png',
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
