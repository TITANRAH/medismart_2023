import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';
import 'package:medismart_2023/presentation/widgets/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulingScreen extends ConsumerStatefulWidget {
  static const name = 'scheduling';

  final MedicalDirectory docSelected;
  const SchedulingScreen({
    super.key,
    required this.docSelected,
  });

  @override
  SchedulingScreenState createState() => SchedulingScreenState();
}

class SchedulingScreenState extends ConsumerState<SchedulingScreen> {
  @override
  void initState() {
    super.initState();

    print('widget.docSelected ${widget.docSelected.nombreMedico}');
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              Column(children: [
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
                    minDate: DateTime.now(),
                    monthViewSettings: const DateRangePickerMonthViewSettings(
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
                Text(
                  'Si quieres agendar para un día siguiente selecciona la fecha en el calendario',
                  textAlign: TextAlign.left,
                  style:
                      titleStyleS.copyWith(color: colors.onTertiaryContainer),
                ),
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
                  info: ' Día actual',
                ),
              ]),
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
            Text(info)
          ],
        )
      ],
    );
  }
}
