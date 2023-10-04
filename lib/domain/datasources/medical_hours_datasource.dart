import 'package:dio/dio.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical-hours-entity.dart';
import 'package:medismart_2023/domain/infrastructure/datasources/medical_hours_response.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/medical_hours_mappers.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-directory/medical_directory_response.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-hours-model/medical_hours_model.dart';

import '../infrastructure/mappers/medical_directory_mappers.dart';

class MedicalHoursDatasource extends MedicalHoursDataSourceResponse {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Environments.baseApiUrl,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  @override
  Future<List<MedicalHours>> getMedicalHours(
      int idMedico, String fechaSeleccion, int idConvenio, String fechaSeleccionEstatica, int idPaciente) async {
    try {
      final response = await dio.get(
        'GetMedicalHours',
        queryParameters: {
          'idMedico': idMedico,
          'fechaSeleccion': fechaSeleccion,
          'idConvenio': idConvenio,
          'fechaSeleccionEstatica': fechaSeleccionEstatica,
          'idPaciente':idPaciente
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> medicHours = response.data; // Asumiendo que response.data es una lista de especialidades.
        final List<MedicalHoursModel> directory = medicHours
            .map((data) => MedicalHoursModel.fromJson(data))
            .toList();

        final List<MedicalHours> doctorHours = directory
            .map((e) =>
                MedicalHoursMapper.medicalHoursResponsetoEntity(e))
            .toList();

        return doctorHours;
      } else {
        throw Error();
      }
    } catch (e) {
      // Maneja errores de solicitud aquí.
      rethrow;
    }
  }
}
