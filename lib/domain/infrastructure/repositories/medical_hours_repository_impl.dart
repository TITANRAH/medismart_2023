import 'package:medismart_2023/domain/datasources/medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical-hours-entity.dart';
import 'package:medismart_2023/domain/repositories/medical_hours_repository.dart';

class MedicalHoursRepositoryImpl extends MedicalHoursRepository {
  final MedicalHoursDatasource dataSource;

  MedicalHoursRepositoryImpl(this.dataSource);
  @override
  Future<List<MedicalHours>> getMedicalHours(
      int idMedico,
      String fechaSeleccion,
      int idConvenio,
      String fechaSeleccionEstatica,
      int idPaciente) {
  return  dataSource.getMedicalHours(idMedico, fechaSeleccion, idConvenio,
        fechaSeleccionEstatica, idPaciente);
  }
}
