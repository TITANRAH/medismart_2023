import 'package:dio/dio.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/domain/infrastructure/mappers/especialities_mappers.dart';
import 'package:medismart_2023/domain/infrastructure/models/especialities/especialities_response.dart';

import '../entities/especialitie/especialitie.dart';
import '../infrastructure/datasources/especialities_response.dart';

class EspecialitiesResp extends EspecialitiesResponseDataSource {

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
      throw e;
    }
  }
}
