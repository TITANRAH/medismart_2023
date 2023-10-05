import 'package:medismart_2023/domain/datasources/avalaible_medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/avalaible_medical_hours_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'avalaible_medical_hours_provider.g.dart';

@riverpod
class AvalaibleMedicalHours extends _$AvalaibleMedicalHours {
  final impl = AvalaibleMedicalHoursRepositoryImpl(AvalaibleMedicalHoursDatasource());
  String fechaSelect = '';

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
      state = availablesHours.toSet().toList();
    } else {
      state = [];
    }

    print('state de Avalaibles provider ${state.length} ');
  }
}
