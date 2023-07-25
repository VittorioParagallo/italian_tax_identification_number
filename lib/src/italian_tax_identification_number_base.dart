import 'package:dartz/dartz.dart';

import 'codici_catastali.dart';

class ItalianTaxIdentificationNumber {
  late Option<String> firstName;
  late Option<String> lastName;
  late Option<String> gender;
  late Option<DateTime> birthDate;
  late Option<String> birthTown;
  late Option<String> birthZone;
  late Option<String> birthRegion;
  late Option<String> birthProvince;
  late Option<String> birthProvinceCode;
  late Option<List<String>> possiblePostalCodes;
  late Option<String> birthCountry;
  late Option<String> ssn;

  ItalianTaxIdentificationNumber({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    // These fields are not retrievable in case of foreign state
    required this.birthTown,
    required this.birthZone,
    required this.birthRegion,
    required this.birthProvince,
    required this.birthProvinceCode,
    required this.possiblePostalCodes,
    // Up to this point
    required this.birthCountry,
    required this.ssn,
  });
  ItalianTaxIdentificationNumber.fromTaxNumber(String ssn) {
    String? gender;
    String? firstName;
    String? lastName;
    DateTime? birthDate;
    String? birthTown;
    String? birthZone;
    String? birthRegion;
    String? birthProvince;
    String? birthProvinceCode;
    List<String>? possiblePostalCodes;
    String? birthCountry;

    ssn = ssn.toUpperCase();
    if (ssn.length > 2) {
      firstName = ssn.substring(0, 3);

      if (ssn.length > 5) {
        lastName = ssn.substring(3, 6);

        if (ssn.length > 7) {
          int? birthYear = int.tryParse(ssn.substring(6, 8));
          if (birthYear != null) birthYear += birthYear > 44 ? 1900 : 2000;

          if (ssn.length > 8) {
            int? birthMonth = [
              "-",
              "A",
              "B",
              "C",
              "D",
              "E",
              "H",
              "L",
              "M",
              "P",
              "R",
              "S",
              "T"
            ].indexOf(ssn.substring(8, 9));

            if (ssn.length > 11) {
              gender = 'M';
              int? birthDay = int.tryParse(ssn.substring(9, 11));
              if (birthDay != null) {
                if (birthDay > 40) {
                  gender = 'F';
                  birthDay -= 40;
                }
              }

              if (birthYear != null && birthMonth >0 && birthDay != null) {
                birthDate = DateTime(birthYear, birthMonth, birthDay);
              }

              if (ssn.length > 14) {
                List<Map<String, String>> townDetails =
                    getCatastalDataFromId(ssn.substring(11, 15)) ?? [];
                if (townDetails.isNotEmpty) {
                  birthTown = townDetails[0]['comune'];
                  birthZone = townDetails[0]['zona'];
                  birthRegion = townDetails[0]['regione'];
                  birthProvince = townDetails[0]['provincia'];
                  birthProvinceCode = townDetails[0]['provincia_sigla'];
                  possiblePostalCodes = townDetails
                      .where((record) =>
                          record['cap'] != null &&
                          record['cap']!.isNotEmpty)
                      .map((record) => record['cap']!)
                      .toList();
                  birthCountry = townDetails[0]['stato'];
                }
              }
            }
          }
        }
      }
    }
      this.firstName= optionOf(firstName);
      this.lastName= optionOf(lastName);
      this.gender= optionOf(gender);
      this.birthDate= optionOf(birthDate);
      this.birthTown= optionOf(birthTown);
      this.birthZone= optionOf(birthZone);
      this.birthRegion= optionOf(birthRegion);
      this.birthProvince= optionOf(birthProvince);
      this.birthProvinceCode= optionOf(birthProvinceCode);
      this.possiblePostalCodes= optionOf(possiblePostalCodes);
      this.birthCountry= optionOf(birthCountry);
      this.ssn= optionOf(ssn);
  }

  @override
  String toString() {
    return '''
      firstName: ${firstName.getOrElse(() => '')},
      lastName: ${lastName.getOrElse(() => '')},
      gender: ${gender.getOrElse(() => '')},
      birthDate: ${birthDate.getOrElse(() => DateTime(1870))},
      birthTown: ${birthTown.getOrElse(() => '')},
      birthZone: ${birthZone.getOrElse(() => '')},
      birthRegion: ${birthRegion.getOrElse(() => '')},
      birthProvince: ${birthProvince.getOrElse(() => '')},
      birthProvinceCode: ${birthProvinceCode.getOrElse(() => '')},
      possiblePostalCodes: ${possiblePostalCodes.getOrElse(() => [])},
      birthCountry: ${birthCountry.getOrElse(() => '')},
      ssn: ${ssn.getOrElse(() => '')}
    ''';
  }

  bool isFormatValid() => RegExp(r'^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$').hasMatch(ssn.getOrElse(() => ''));
}


