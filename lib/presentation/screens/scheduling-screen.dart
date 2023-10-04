import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';
import 'package:medismart_2023/presentation/providers/providers.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulingScreen extends ConsumerStatefulWidget {
  static const name = 'scheduling';

  final int idDoctor;
  MedicalDirectory? doctor;

  SchedulingScreen({
    super.key,
    this.doctor,
    required this.idDoctor,
  });

  @override
  SchedulingScreenState createState() => SchedulingScreenState();
}

class SchedulingScreenState extends ConsumerState<SchedulingScreen> {
  @override
  void initState() {
    super.initState();
    widget.doctor = ref
        .read(medicalDirectoryDoctorsProvider.notifier)
        .filteredUniqueDoc(widget.idDoctor);

    print('widget.docSelected ${widget.idDoctor.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyleM = Theme.of(context).textTheme.bodyLarge;
    final titleStyleS = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        iconColor: colors.primary,
      ),
      body: Padding(
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
                    style: titleStyleS!
                        .copyWith(color: colors.onTertiaryContainer),
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
                      FilledButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(colors.inversePrimary),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text('MAÑANA'),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      FilledButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('TARDE'),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.primary),
                    ),
                    child: SfDateRangePicker(
                      selectionMode: DateRangePickerSelectionMode.single,
                      view: DateRangePickerView.month,
                      selectionShape: DateRangePickerSelectionShape.rectangle,
                      selectionColor: Colors.green,
                      // selectableDayPredicate: (date) {
                      //   return Text(12);
                      // },
                      // minDate: DateTime.now(),
                      todayHighlightColor: colors.inversePrimary,
                      monthViewSettings: DateRangePickerMonthViewSettings(
                          weekNumberStyle: DateRangePickerWeekNumberStyle(
                              backgroundColor: colors.inversePrimary),
                          firstDayOfWeek: 1),
                      headerStyle: DateRangePickerHeaderStyle(
                          backgroundColor: colors.primary,
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            letterSpacing: 5,
                            color: colors.onPrimary,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Si quieres agendar para un día siguiente selecciona la fecha en el calendario',
                    textAlign: TextAlign.left,
                    style:
                        titleStyleS.copyWith(color: colors.onTertiaryContainer),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoSelect(
                        color: colors.inversePrimary,
                        info: ' Día actual',
                      ),
                      const InfoSelect(
                        color: Colors.green,
                        info: ' Día seleccionado',
                      ),
                      InfoSelect(
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
                            borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                          children: [
                            Text(
                              'Agenda',
                              style: TextStyle(color: Colors.orange),
                            ),
                            Text(
                              'De 19hrs. a 20hrs.',
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              color: colors.inversePrimary,
                              iconSize: 30,
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_circle_left_rounded)),
                          Text(
                            '19:00',
                            style: titleStyleM.copyWith(
                              color: colors.inversePrimary,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              color: colors.inversePrimary,
                              iconSize: 30,
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_circle_right_rounded)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoSelect extends StatelessWidget {
  final Color color;
  final String info;

  const InfoSelect({
    super.key,
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
