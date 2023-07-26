import 'package:italian_tax_identification_number/italian_tax_identification_number_base.dart';

void main() {
  ItalianTaxIdentificationNumber result =
      ItalianTaxIdentificationNumber.fromTaxNumber('GSP MTA 98L25 E625O');

  print(result.birthCountry);
  print(result.birthDate);
  print(result.birthProvince);
  print(result.birthProvinceCode);
  print(result.birthRegion);
  print(result.birthTown);
  print(result.birthZone);
  print(result.firstName);
  print(result.gender);
  print(result.lastName);
  print(result.gender);
  print(result.possiblePostalCodes);
  print(result.ssn);
  print(result.isFormatValid());


}
