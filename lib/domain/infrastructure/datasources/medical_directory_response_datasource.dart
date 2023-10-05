
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';

abstract class MedicalDirectoryDataSourceResponse {
  Future<List<MedicalDirectory>> getMedicalDirectory(int idUsuario, int idCliente, String tipo);
}


