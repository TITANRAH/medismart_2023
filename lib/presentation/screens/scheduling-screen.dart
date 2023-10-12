import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/config/utils/utils.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';
import 'package:medismart_2023/domain/entities/user-entity/user.dart';
import 'package:medismart_2023/presentation/providers/checkbox_provider/checkbox_provider.dart';
import 'package:medismart_2023/presentation/providers/providers.dart';
import 'package:medismart_2023/presentation/providers/toast_provider/toast_provider.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulingScreen extends ConsumerStatefulWidget {
  static const name = 'scheduling';
  late User user;
  final int idDoctor;
  final bool isEdit;
  MedicalDirectory? doctor;

  SchedulingScreen({
    super.key,
    this.doctor,
    required this.isEdit,
    required this.idDoctor,
  });

  @override
  SchedulingScreenState createState() => SchedulingScreenState();
}

class SchedulingScreenState extends ConsumerState<SchedulingScreen> {
  // late List<MedicalHours> hours = [];
  late User user;

  @override
  void initState() {
    super.initState();

    user = ref.read(userActiveProvider.notifier).returnUser();

    widget.doctor = ref.read(medicalDirectoryDoctorsProvider.notifier).filteredUniqueDoc(widget.idDoctor);

    print(' doctor ${widget.doctor!.idMedico}');

    ref
        .read(medicalHoursDoctorProvider.notifier)
        .getMedicalHours(widget.idDoctor, widget.doctor!.fechaText, 26, widget.doctor!.fechaText, user.idCliente);

    ref
        .read(avalaibleMedicalHoursProvider.notifier)
        .getAvalaibleHours(formatedFechaForAvalaiblesHoursInit(widget.doctor!.fechaText!), widget.idDoctor, 26, user.userId!);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyleM = Theme.of(context).textTheme.bodyLarge;
    final titleStyleS = Theme.of(context).textTheme.bodyMedium;
    final urlPhoto = Environments.urlServicios;
    final textStyleEspecialitie = Theme.of(context).textTheme.titleSmall;
    final textStyleNameDoctor = Theme.of(context).textTheme.titleMedium;
    final hours = ref.watch(medicalHoursDoctorProvider);
    final medicalHours = ref.watch(avalaibleMedicalHoursProvider);
    final String hourSelected = ref.read(avalaibleMedicalHoursProvider.notifier).hourSelected;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        iconColor: colors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: colors.primary,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reservar Hora',
                          textAlign: TextAlign.left,
                          style: titleStyleM!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colors.onTertiaryContainer,
                          ),
                        ),
                        Text(
                          // widget.doctor!.nombreMedico!,
                          'Selecciona si deseas en la mañana o en la tarde',
                          textAlign: TextAlign.left,
                          style: titleStyleS!.copyWith(color: colors.onTertiaryContainer),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeIn(
                              duration: const Duration(milliseconds: 2000),
                              child: FilledButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(colors.inversePrimary),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text('MAÑANA'),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FadeIn(
                              duration: const Duration(milliseconds: 2000),
                              child: FilledButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('TARDE'),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        hours.isNotEmpty
                            ? FadeInDown(
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: hours.isNotEmpty ? Border.all(color: colors.primary) : null,
                                    ),
                                    child: SfDateRangePicker(
                                      initialSelectedDate: hours[0].fecha,
                                      backgroundColor: colors.onPrimary,
                                      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                                        ref
                                            .read(avalaibleMedicalHoursProvider.notifier)
                                            .onSelectionChanged(dateRangePickerSelectionChangedArgs, widget.idDoctor, 26, user.userId!);
                                      },
                                      selectionTextStyle: const TextStyle(fontSize: 20),
                                      selectionMode: DateRangePickerSelectionMode.single,
                                      view: DateRangePickerView.month,
                                      selectionShape: DateRangePickerSelectionShape.rectangle,
                                      selectionColor: Colors.green, // Color de fondo de las fechas seleccionadas
                                      selectableDayPredicate:
                                          // esto necesita estado y no lo esta teniendo
                                          (date) {
                                        if (!ref.read(medicalHoursDoctorProvider.notifier).selectedPredicatedMedicalHours(date, hours)) {
                                          return false;
                                        }
                                        return true;
                                      },

                                      todayHighlightColor: colors.inversePrimary,
                                      monthViewSettings: const DateRangePickerMonthViewSettings(
                                        firstDayOfWeek: 1,
                                      ),
                                      headerStyle: DateRangePickerHeaderStyle(
                                        backgroundColor: colors.primary,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                          letterSpacing: 5,
                                          color: colors.onPrimary,
                                        ),
                                      ),
                                    )),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(110),
                                child: SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Si quieres agendar para un día siguiente selecciona la fecha en el calendario',
                          textAlign: TextAlign.left,
                          style: titleStyleS.copyWith(color: colors.onTertiaryContainer),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _InfoSelect(
                              color: colors.inversePrimary,
                              info: ' Día actual',
                            ),
                            const _InfoSelect(
                              color: Colors.green,
                              info: ' Día seleccionado',
                            ),
                            _InfoSelect(
                              color: colors.primary,
                              info: ' Horas disponibles',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ref.read(avalaibleMedicalHoursProvider.notifier).getRangeHurs() != ''
                                    ? FadeInLeft(
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Agenda',
                                              style: TextStyle(color: Colors.orange),
                                            ),
                                            Text(
                                              ref.read(avalaibleMedicalHoursProvider.notifier).getRangeHurs(),
                                              style: const TextStyle(color: Colors.orange),
                                            )
                                          ],
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 61, vertical: 2.3),
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                          strokeWidth: 2,
                                        ),
                                      )),
                            FadeInRight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      color: colors.inversePrimary,
                                      iconSize: 30,
                                      onPressed: () {
                                        ref.read(avalaibleMedicalHoursProvider.notifier).showPrevious();
                                      },
                                      icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                                  ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours().isNotEmpty
                                      ? SizedBox(
                                          height: 45,
                                          width: 80,
                                          child: ListView.builder(
                                            itemCount: ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours().length > 1
                                                ? 1
                                                : ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours().length,
                                            itemBuilder: (context, index) {
                                              final hour = ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours()[index];

                                              final hourBlock = '${hour.horaDesdeText.split(':')[0]}:00';

                                              return Text(hourBlock,
                                                  style: textStyleNameDoctor!.copyWith(color: colors.inversePrimary, fontSize: 30));
                                            },
                                          ),
                                        )
                                      : CircularProgressIndicator(
                                          color: colors.inversePrimary,
                                          strokeWidth: 2,
                                        ),
                                  IconButton(
                                      color: colors.inversePrimary,
                                      iconSize: 30,
                                      onPressed: () {
                                        ref.read(avalaibleMedicalHoursProvider.notifier).showNext();
                                      },
                                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 100, // Establece la altura máxima deseada
                          maxWidth: double.infinity),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours().length,
                        itemBuilder: (context, index) {
                          final AvalaibleMedicalHoursEntity item = ref.read(avalaibleMedicalHoursProvider.notifier).visibleHours()[index];

                          return SizedBox(
                            width: 98, // Establece el ancho deseado
                            child: TextButton(
                                onPressed: item.nombrePaciente == 'Ocupado'
                                    ? null
                                    : () {
                                        ref.read(avalaibleMedicalHoursProvider.notifier).selectedHourScheduling(item.horaDesdeText);

                                        // print('idBloque hora desde List:  ${item.idBloqueHora}');
                                        // print('idMedicoHora   desde List:  ${item.idMedicoHora}');
                                        // print('idMedico desde List:  ${item.idMedico}');
                                        // print('idMedico desde List:  ${item.fechaText}');

                                        print('idMedicoHora desde List: ${item.idMedicoHora}');
                                        print('id bloque hora desde List: ${item.idBloqueHora}');
                                        print('fecha desde List:${item.fechaText}');
                                        print('idProfesional: desde List${item.idMedico}');
                                        print('nombre medico: desde List${item.nombreMedico}');
                                        print('valor atencion:desde List ${item.valorAtencion}');
                                        print('especialidad:desde List ${item.especialidad}');
                                        print('token:desde List ${user.token}');
                                        print('id usuario: ${user.userId}');
                                        print('cantidad de horas desde List${medicalHours.length}');
                                        setState(() {});
                                      },
                                child: hours.isNotEmpty
                                    ? FadeInUp(
                                        duration: const Duration(milliseconds: 1400),
                                        child: Text(
                                          item.horaDesdeText,
                                          style: textStyleNameDoctor!.copyWith(
                                              color: item.nombrePaciente == 'Ocupado'
                                                  ? Colors.grey
                                                  : item.horaDesdeText == hourSelected
                                                      ? Colors.orange
                                                      : item.nombrePaciente == 'Ocupado'
                                                          ? Colors.grey
                                                          : colors.primary,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : const CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (widget.doctor != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _BoxCheckDoctor(
                  colors: colors,
                  doctor: widget.doctor!,
                  urlPhoto: urlPhoto,
                  textStyleNameDoctor: textStyleNameDoctor,
                  textStyleEspecialitie: textStyleEspecialitie,
                  isEdit: widget.isEdit,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Establece el radio del borde en cero
                  ),
                ),
                onPressed: () {
                  context.pop();
                },
                child: const Text('Volver'),
              ),
            ),
            Powered(
              color: colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _BoxCheckDoctor extends ConsumerWidget {
  final ColorScheme colors;
  final String urlPhoto;
  final TextStyle? textStyleNameDoctor;
  final TextStyle? textStyleEspecialitie;
  final MedicalDirectory doctor;
  final bool isEdit;

  const _BoxCheckDoctor({
    required this.colors,
    required this.urlPhoto,
    required this.doctor,
    required this.textStyleNameDoctor,
    required this.textStyleEspecialitie,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context, ref) {
    final textCheck = Theme.of(context).textTheme.labelMedium;
    final bool checkOne = ref.watch(checkOneProvider);
    final bool checkTwo = ref.watch(checkTwoProvider);
    final bool checkThree = ref.watch(checkThreeProvider);
    final bool checkAll = ref.watch(checkAllProvider);

    // void onChangedChedkOne(bool value) {
    //   ref.watch(avalaibleMedicalHoursProvider.notifier).changeCheckBoolOne();
    // }

    return Builder(builder: (context) {
      return Column(
        // Wrap the Expanded in a Column
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: colors.primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: doctor.fotoPerfil != null
                              ? Image.network(
                                  urlPhoto + doctor.fotoPerfil!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100, // Establece solo la altura aquí
                                )
                              : Image.asset(
                                  './assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                  height: 100, // Establece solo la altura aquí
                                  width: 100,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.nombreMedico!.toUpperCase(),
                          style: textStyleNameDoctor!.copyWith(
                            color: const Color.fromARGB(255, 138, 143, 168),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          doctor.especialidad!,
                          style: textStyleEspecialitie!.copyWith(
                            color: const Color.fromARGB(255, 138, 143, 168),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: checkAll,
                          onChanged: (value) {
                            ref.read(checkAllProvider.notifier).changeCheckBoolAll();
                          },
                        ),
                        Text(
                          'Aceptar Todo',
                          style: textCheck,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          // key: UniqueKey(),
                          value: checkOne,
                          onChanged: (value) {
                            ref.read(checkOneProvider.notifier).changeCheckBoolOne();
                          },
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            '''

*Acepto los términos y condiciones en el servicio de consultas Tele-medica de Medismart.live.
Declaro haber leído y aceptado a mi entera conformidad.
AVISO: El servicio de consulta Tele-medica online es proporcionado por el médico y 
facilitado por la plataforma Medismart.live.

Conoce tus derechos y deberes para la consulta Tele-medica.
''',
                            textAlign: TextAlign.start,
                            style: textCheck,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: checkTwo,
                          onChanged: (value) {
                            ref.read(checkTwoProvider.notifier).changeCheckBoolTwo();
                          },
                        ),
                        Text(
                          '''

He leído y acepto el consentimiento informado
''',
                          textAlign: TextAlign.start,
                          style: textCheck,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: checkThree,
                          onChanged: (value) {
                            ref.read(checkThreeProvider.notifier).changeCheckBoolThree();
                          },
                        ),
                        Text(
                          '''

Declaro que reconozco que la cuenta es 
personal e intransferible,que los datos 
contenidos son personales y sensibles, 
por lo que no podrán ser utilizados por 
otra persona que no sea el titular
''',
                          textAlign: TextAlign.start,
                          style: textCheck,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (!checkOne || !checkTwo || !checkThree) {
                            ref.read(toastCustomProvider.notifier).showToastMessage(
                                  'Debes aceptar términos y condiciones',
                                  Colors.red.shade500,
                                  context,
                                  Icons.warning_amber_rounded,
                                  Colors.white,
                                  ToastGravity.BOTTOM,
                                );
                          } else {
                            return;
                          }
                        },
                        child: Text(isEdit ? 'Editar' : 'Aceptar'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _InfoSelect extends StatelessWidget {
  final Color color;
  final String info;

  const _InfoSelect({
    required this.color,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            Text(
              info,
              style: const TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
