import 'package:test/test.dart';
import 'package:tglima_dart_framework/tglima_dart_framework.dart';

void main() {
  test('checkDefEncrptText', () {
    expect(checkDefEncrptText(), 'DdLoOW07M32S8+J3JLFC4w==');
  });

  test('checkDefDecryptText', () {
    expect(checkDefDecryptText(), 'Example text');
  });

  test('checkPersonEncrptText', () {
    expect(checkPersonEncrptText(), 'ecBcAT+0P7eYCBh7tA02qw==');
  });

  test('checkPersonDecryptText', () {
    expect(checkPersonDecryptText(), 'Example text');
  });

  test('checkDefValidateKeyCrypt', () {
    expect(checkDefValidateKeyCrypt(), true);
  });

  test('checkPersonInvalidKeyCrypt', () {
    expect(checkPersonInvalidKeyCrypt(), false);
  });

  test('checkPersonValidKeyCrypt', () {
    expect(checkPersonValidKeyCrypt(), true);
  });
}

String checkDefEncrptText() {
  CryptoUtil crypto = CryptoUtil();
  return crypto.txtEncrypt('Example text').object as String;
}

String checkDefDecryptText() {
  CryptoUtil crypto = CryptoUtil();
  return crypto.txtDecrypt('DdLoOW07M32S8+J3JLFC4w==').object as String;
}

String checkPersonEncrptText() {
  CryptoUtil crypto = CryptoUtil('G8XWURhSU1g=');
  return crypto.txtEncrypt('Example text').object as String;
}

String checkPersonDecryptText() {
  CryptoUtil crypto = CryptoUtil('G8XWURhSU1g=');
  return crypto.txtDecrypt('ecBcAT+0P7eYCBh7tA02qw==').object as String;
}

bool checkDefValidateKeyCrypt() {
  CryptoUtil crypto = CryptoUtil();
  return crypto.validateKeyCrypt();
}

bool checkPersonInvalidKeyCrypt() {
  CryptoUtil crypto = CryptoUtil('ecBcAT+0P7eYCBh7tA02qw==');
  return crypto.validateKeyCrypt();
}

bool checkPersonValidKeyCrypt() {
  CryptoUtil crypto = CryptoUtil('G8XWURhSU1g=');
  return crypto.validateKeyCrypt();
}
