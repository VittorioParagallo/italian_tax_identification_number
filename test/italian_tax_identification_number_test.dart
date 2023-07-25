import 'package:italian_tax_identification_number/italian_tax_identification_number_base.dart';
import 'package:test/test.dart';

void main() {
  group('Italian tax individual number', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      //Giuseppe Amato 25/07/98 Livorno=> GSP MTA 98L25 E625O
      ItalianTaxIdentificationNumber result =
          ItalianTaxIdentificationNumber.fromTaxNumber('GSP MTA 98L25 E625O');
      print(result.isFormatValid()); //prints true
      print(result); 
      /* prints     
      firstName: GSP,
      lastName: MTA,
      gender: M,
      birthDate: 1998-07-25 00:00:00.000,
      birthTown: Livorno,
      birthZone: Centro,
      birthRegion: Toscana,
      birthProvince: Livorno,
      birthProvinceCode: LI,
      possiblePostalCodes: [57121, 57122, 57123, 57124, 57125, 57126, 57127, 57128],
      birthCountry: Italia,
      ssn: GSPMTA98L25E625O
      */ 
      
    });
  });
}
