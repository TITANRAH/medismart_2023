
import 'package:medismart_2023/domain/entities/especialitie/especialitie.dart';

import '../models/especialities/especialities_response.dart';



class EspecialitiesMapper {
  static Especialitie especialitieResponsetoEntity(EspecialitiesResponse especialitie) => Especialitie(
  code: especialitie.codigo, 
  detail: especialitie.detalle,
  
 );
}
