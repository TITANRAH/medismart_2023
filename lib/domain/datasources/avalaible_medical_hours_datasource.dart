import 'package:dio/dio.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/datasources/avalaible_medical_hours_response.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/avalaible_medical_hours_mappers.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/especialities_mappers.dart';
import 'package:medismart_2023/domain/infrastructure/models/avalaible-medical-hours/avalaible_medical_hours_model.dart';
import 'package:medismart_2023/domain/infrastructure/models/especialities/especialities_response.dart';

import '../entities/especialitie/especialitie.dart';

class AvalaibleMedicalHoursDatasource
    extends AvalaibleMedicalHoursDatasourceResponse {
  final baseUrl = Environments.baseApiUrl;
  final Dio dio = Dio(BaseOptions(
    baseUrl: Environments.baseApiUrl,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  @override
  Future<List<Especialitie>> getEspecialities(
      int idUsuario, int idCliente, String tipo) async {
    try {
      final response = await dio.get(
        'GetSpecialities',
        queryParameters: {
          'idUsuario': idUsuario,
          'idCliente': idCliente,
          'tipo': tipo,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> especialitiesData = response
            .data; // Asumiendo que response.data es una lista de especialidades.
        final List<EspecialitiesResponse> especialitiesList = especialitiesData
            .map((data) => EspecialitiesResponse.fromJson(data))
            .toList();

        final List<Especialitie> especialities = especialitiesList
            .map((e) => EspecialitiesMapper.especialitieResponsetoEntity(e))
            .toList();

        return especialities;
      } else {
        throw Error();
      }
    } catch (e) {
      // Maneja errores de solicitud aquí.
      rethrow;
    }
  }

  @override
  Future<List<AvalaibleMedicalHoursEntity>> getAvalaibleMedicalHours(
      String fecha,
      int idMedico,
      bool maniana,
      bool inicial,
      int idConvenio,
      int idPaciente,
      int tipoHorario) async {
    try {
      final response = await dio.get(
        'GetCalendarStatus',
        queryParameters: {
          'fecha': fecha,
          'idMedico': idMedico,
          'maniana': maniana,
          'inicial': inicial,
          'idConvenio': idConvenio,
          'idPaciente': idPaciente,
          'tipoHorario': tipoHorario
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> avalaibles = response.data;
        final List<AvalaibleMedicalHoursResponse> avalaiblesHours = avalaibles
            .map((data) => AvalaibleMedicalHoursResponse.fromJson(data))
            .toList();

        final List<AvalaibleMedicalHoursEntity> avalaiblesMedicalHours =
            avalaiblesHours
                .map((a) => AvalaibleMedicalHoursMapper
                    .AvalableMedicalDirectoryResponsetoEntity(a))
                .toList();

        print('avalaiblesMedicalHours $avalaiblesMedicalHours');

        return avalaiblesMedicalHours;
      } else {
        throw Error();
      }
    } catch (e) {
      // Maneja errores de solicitud aquí.
      rethrow;
    }
  }
}
