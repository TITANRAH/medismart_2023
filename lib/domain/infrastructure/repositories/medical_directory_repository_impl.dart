import 'package:medismart_2023/domain/datasources/medical_directory_datasource.dart';
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';
import 'package:medismart_2023/domain/repositories/medical_directory_repository.dart';

class MedicalDirectoryRepositoryImpl extends MedicalDirectoryRepository {
  final MedicalDirectoryDatasource dataSource;

  MedicalDirectoryRepositoryImpl(this.dataSource);

  @override
  Future<List<MedicalDirectory>> getMedicalDirectory(
      int idUsuario, int idCliente, String tipo) {
    return dataSource.getMedicalDirectory(idUsuario, idCliente, tipo);
  }
}
