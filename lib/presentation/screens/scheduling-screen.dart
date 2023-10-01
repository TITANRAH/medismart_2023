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
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      backgroundColor: colors.onPrimary,
      appBar: CustomAppBar(
        iconColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text('MAÑANA'),
                    )),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(
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
            SfDateRangePicker(
              
              selectionMode: DateRangePickerSelectionMode.single,
              view: DateRangePickerView.month,
              
              minDate: DateTime.now(),
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(
                    
                    firstDayOfWeek: 1
                    
                    ),
              headerStyle: DateRangePickerHeaderStyle(
                
                  backgroundColor: colors.primary,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    letterSpacing: 5,
                    color: colors.onPrimary,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
