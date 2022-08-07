import 'package:tglima_dart_framework/src/dto/result_dto.dart';

abstract class CryptoAbstract {
  ResultDTO txtEncrypt(String txt);
  ResultDTO txtDecrypt(String txt);

  CryptoAbstract([String? keyCryptUser]);
}
