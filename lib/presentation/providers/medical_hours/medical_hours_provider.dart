import 'package:medismart_2023/domain/datasources/medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/repositories/medical_hours_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_hours_provider.g.dart';

@riverpod
class MedicalHoursDoctor extends _$MedicalHoursDoctor {
  final impl = MedicalHoursRepositoryImpl(MedicalHoursDatasource());

  @override
  List<MedicalHours> build() {
    return [];
  }

  Future<void> getMedicalHours(idMedico, fechaSeleccion, idConvenio, fechaSeleccionEstatica, idPaciente) async {
    final hours = await impl.getMedicalHours(idMedico, fechaSeleccion, idConvenio, fechaSeleccionEstatica, idPaciente);

    if (hours.isNotEmpty) {
      state = hours.toSet().toList();
    } else {
      state = [];
    }

    print('state de horas $state');
  }

  returnMedicalHours() {
    return state;
  }

  bool selectedPredicatedMedicalHours(DateTime date, List<MedicalHours> hours) {
    for (var h in hours) {
      if (date == h.fecha) {
        return true;
      }
    }
    return false;
  }
}
