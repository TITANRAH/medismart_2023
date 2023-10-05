import 'package:medismart_2023/domain/datasources/avalaible_medical_hours_datasource.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/repositories/avalaible_medical_hours_repository.dart';

class AvalaibleMedicalHoursRepositoryImpl extends AvalaibleMedicalHoursRepository {
  final AvalaibleMedicalHoursDatasource dataSource;

  AvalaibleMedicalHoursRepositoryImpl(this.dataSource);

  @override
  Future<List<AvalaibleMedicalHoursEntity>> getAvalaibleMedicalHours(
    String fecha,
    int idMedico,
    bool maniana,
    bool inicial,
    int idConvenio,
    int idPaciente,
    int tipoHorario,
  ) {
    return dataSource.getAvalaibleMedicalHours(
      fecha,
      idMedico,
      maniana,
      inicial,
      idConvenio,
      idPaciente,
      tipoHorario,
    );
  }
}
