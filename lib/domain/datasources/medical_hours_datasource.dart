import 'package:dio/dio.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/config/utils/utils.dart';
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/datasources/medical_hours_response.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/medical_hours_mappers.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-hours-model/medical_hours_model.dart';

class MedicalHoursDatasource extends MedicalHoursDataSourceResponse {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environments.baseApiUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  late String fechaFormateada = '';

  @override
  Future<List<MedicalHours>> getMedicalHours(
      int idMedico,
      String fechaSeleccion,
      int idConvenio,
      String fechaSeleccionEstatica,
      int idPaciente) async {
    if (fechaSeleccion != '') {
     
      fechaFormateada = formatedFechaForMedicalHours(fechaSeleccion);

      // print('fechaFormateada $fechaFormateada');
    }

    try {
      final response = await dio.get(
        'GetMedicalHours',
        queryParameters: {
          'idMedico': idMedico,
          'fechaSeleccion': fechaFormateada,
          'idConvenio': idConvenio,
          'fechaSeleccionEstatica': fechaFormateada,
          'idPaciente': idPaciente
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> medicHours = response.data; 
        final List<MedicalHoursModel> directory = medicHours.map((data) => 
        MedicalHoursModel.fromJson(data)).toList();

        final List<MedicalHours> doctorHours = directory
            .map((e) => MedicalHoursMapper.medicalHoursResponsetoEntity(e))
            .toList();

        return doctorHours;
      } else {
        throw Error();
      }
    } catch (e) {
 
      rethrow;
    }
  }
}
