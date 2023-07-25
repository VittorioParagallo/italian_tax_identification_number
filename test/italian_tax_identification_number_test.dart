import 'package:italian_tax_identification_number/src/italian_tax_identification_number_base.dart';
import 'package:test/test.dart';

void main() {
  group('Italian tax individual number', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      ItalianTaxIdentificationNumber result =
          ItalianTaxIdentificationNumber.fromTaxNumber('kljòkj');
      print(result.isFormatValid());
      print(result);
    });
  });
}
