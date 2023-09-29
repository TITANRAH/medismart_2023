
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';

abstract class MedicalDirectoryDataSource {
  Future<List<MedicalDirectory>> getDirectory(String userName, String password);
}


