import 'package:medismart_2023/domain/datasources/avalaible_medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/avalaible_medical_hours_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'avalaible_medical_hours_provider.g.dart';

@Riverpod(keepAlive: true)
class AvalaibleMedicalHours extends _$AvalaibleMedicalHours {
  final impl = AvalaibleMedicalHoursRepositoryImpl(AvalaibleMedicalHoursDatasource());
  String fechaSelect = '';

  int startIndex = 0;
  int endIndex = 3;

  List<AvalaibleMedicalHoursEntity> hoursItemCount = [];

  @override
  List<AvalaibleMedicalHoursEntity> build() {
    return [];
  }

  void onSelectionChanged(
    DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs,
    int idMedico,
    int idConvenio,
    int idPaciente,
  ) {
    fechaSelect = dateRangePickerSelectionChangedArgs.value.toString().split(' ')[0];

    print('enabledDatesBySelectedHour $fechaSelect');

    getAvalaibleHours(fechaSelect, idMedico, idConvenio, idPaciente);
  }

  Future<void> getAvalaibleHours(
    String fecha,
    int idMedico,
    int idConvenio,
    int idPaciente,
  ) async {
    print('fecha desde provider getAvalaibleHours $fecha');
    print('idMedico getAvalaibleHours $idMedico');
    print('idPaciente getAvalaibleHours $idPaciente');
    final availablesHours = await impl.getAvalaibleMedicalHours(
      fecha,
      idMedico,
      true,
      false,
      idConvenio,
      idPaciente,
      0,
    );

    if (availablesHours.isNotEmpty) {
      state = hoursSelectedDate(availablesHours.toSet().toList(), fecha);
    } else {
      state = [];
    }

    print('state de Avalaibles provider ${state.length} ');
  }

  hoursSelectedDate(List<AvalaibleMedicalHoursEntity> hours, String fechaSelected) {
    print('fechaSelected $fechaSelected');
    print('lista de horas ${hours[0].fechaHora}');

    List<AvalaibleMedicalHoursEntity> hoursDate = hours.where((h) => h.fechaHora.toString().split(' ')[0] == fechaSelected).toList();

    print('horas para esa la fecha $fechaSelected ${hoursDate.length}');

    return hoursDate;
  }

  visibleHours() {
    print('entrop al visible');
    final availableHours = state;

    if (availableHours.isEmpty) {
      return [];
    }

    startIndex = startIndex.clamp(0, availableHours.length - 1).toInt();

    final endIndex = (startIndex + 3).clamp(0, availableHours.length - 1).toInt();

    return availableHours.sublist(startIndex, endIndex + 1);
  }

  void showNext() {
    final availableHours = state;
    if (availableHours.isNotEmpty && startIndex + 4 < availableHours.length) {
      startIndex += 4;
    } else if (startIndex + 4 < availableHours.length) {
      startIndex = availableHours.length - 4;
    }

    state = [...state.toSet().toList()];
  }

  void showPrevious() {
    if (startIndex - 4 >= 0) {
      startIndex -= 4;
    } else {
      startIndex = 0;
    }

    state = [...state.toSet().toList()];
  }
}
