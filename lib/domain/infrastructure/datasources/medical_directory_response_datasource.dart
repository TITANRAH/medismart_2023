
import 'package:medismart_2023/domain/entities/medical-directory/medical-directory.dart';

abstract class MedicalDirectoryDataSource {
  Future<List<MedicalDirectory>> getUser(String userName, String password);
}


