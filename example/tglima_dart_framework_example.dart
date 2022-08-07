import 'package:tglima_dart_framework/tglima_dart_framework.dart';

void main() {
  print('ConstantUtil.Ok: ${ConstantUtil.ok}');
  CryptoUtil crypto = CryptoUtil();

  String txt = 'Example text';
  ResultDTO resultEncrypt = crypto.txtEncrypt(txt);

  if (!resultEncrypt.hasSuccess) {
    print('txtEncrypter => Error: ${resultEncrypt.resultMsg}');
    return;
  }

  String txtEncrypter = (resultEncrypt.object as String);
  print('txtEncrypter => After: $txt | Before: $txtEncrypter');

  ResultDTO resultDecrypt = crypto.txtDecrypt(txtEncrypter);
  print('resultMsg:  ${resultDecrypt.resultMsg}');
  String txtDecrypt = '';

  if (resultDecrypt.hasSuccess) {
    txtDecrypt = (resultDecrypt.object as String);
  }

  print('txtDecrypt => After: $txtDecrypt | Before: $txtDecrypt');
}
