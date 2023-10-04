import 'package:medismart_2023/domain/entities/medical-hours-entity/medical-hours-entity.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-hours-model/medical_hours_model.dart';

class MedicalHoursMapper {
  static MedicalHours medicalHoursResponsetoEntity(MedicalHoursModel hours) => MedicalHours(
    fecha: hours.fecha,
    info: hours.info,
 );
}
