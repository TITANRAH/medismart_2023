
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical-hours-entity.dart';

abstract class MedicalHoursDataSourceResponse {
  Future<List<MedicalHours>> getMedicalHours(int idMedico, String fechaSeleccion, int idConvenio, String fechaSeleccionEstatica, int idPaciente);
}


