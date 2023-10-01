import 'package:dio/dio.dart';
import 'package:medismart_2023/config/constants/env.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';
import 'package:medismart_2023/domain/infrastructure/datasources/medical_directory_response_datasource.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-directory/medical_directory_response.dart';

import '../infrastructure/mappers/medical_directory_mappers.dart';

class MedicalDirectoryDatasource extends MedicalDirectoryDataSourceResponse {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Environments.baseApiUrl,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  @override
  Future<List<MedicalDirectory>> getMedicalDirectory(
      int idUsuario, int idCliente, String tipo) async {
    try {
      final response = await dio.get(
        'GetDirectory',
        queryParameters: {
          'userId': idUsuario,
          'idCliente': idCliente,
          'tipoServicio': tipo,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> directoryData = response
            .data; // Asumiendo que response.data es una lista de especialidades.
        final List<MedicalDirectoryResponse> directory = directoryData
            .map((data) => MedicalDirectoryResponse.fromJson(data))
            .toList();

        final List<MedicalDirectory> medicDirectory = directory
            .map((e) =>
                MedicalDirectoryMapper.medicalDirectoryResponsetoEntity(e))
            .toList();

        return medicDirectory;
      } else {
        throw Error();
      }
    } catch (e) {
      // Maneja errores de solicitud aquí.
      rethrow;
    }
  }
}
