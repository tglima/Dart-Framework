import 'package:encrypt/encrypt.dart';
import 'package:tglima_dart_framework/src/dto/result_dto.dart';
import 'package:tglima_dart_framework/src/util/constant_util.dart';
import 'package:tglima_dart_framework/src/interface/crypto_interface.dart';

class CryptoUtil implements CryptoAbstract {
  final iv = IV.fromBase64('AAAAAAAAAAAAAAAAAAAAAA==');
  String _keyCrypt = '';
  final String endKeyCrypt = '__JesusS4lv@';
  dynamic _encrypter;

  CryptoUtil([String? keyCryptUser]) {
    _keyCrypt = keyCryptUser == null
        ? 'Sl15:2AqItCoPraJuCor$endKeyCrypt'
        : '$keyCryptUser$endKeyCrypt';
    _encrypter =
        Encrypter(AES(Key.fromUtf8(_keyCrypt), mode: AESMode.ofb64Gctr));
  }

  bool validateKeyCrypt() {
    Key key = Key.fromUtf8(_keyCrypt);

    if (key.length < 16 || key.length > 32 || (key.length & 7) != 0) {
      return false;
    }
    return true;
  }

  @override
  ResultDTO txtEncrypt(String txt) {
    if (!validateKeyCrypt()) {
      return ResultDTO(false, ConstantUtil.invalidKeyCrypt);
    }

    try {
      return ResultDTO(
          true, ConstantUtil.ok, _encrypter.encrypt(txt, iv: iv).base64);
    } catch (ex) {
      return ResultDTO(false, ConstantUtil.msgError);
    }
  }

  @override
  ResultDTO txtDecrypt(String txt) {
    if (!validateKeyCrypt()) {
      return ResultDTO(false, ConstantUtil.invalidKeyCrypt);
    }

    try {
      return ResultDTO(true, ConstantUtil.ok,
          _encrypter.decrypt(Encrypted.from64(txt), iv: iv));
    } catch (ex) {
      return ResultDTO(false, ConstantUtil.msgError);
    }
  }
}
