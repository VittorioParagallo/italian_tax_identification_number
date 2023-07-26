This package provides a class to manage italian tax identification numbers by:
- validating (only the format)
- encoding (upcoming)
- decoding 

the mapping codes->towns is hardcoded, so no internet connection is needed to use it

Be aware there are several names use for this Tax Identification Number:
 - The formal one used by public institution is Tax Identificazion number <https://www.agenziaentrate.gov.it/portale/web/english/nse/individuals/tax-identification-number-for-foreign-citizens>
 - It is commonly called by people Fiscal Code (Codice Fiscale) or Health Card (Tessera sanitaria)
 - it is like an SSN (Social Security Number)

## Features

It is a code generated from anafraphic details of a person.
With this library is possible to check if the format of a fiscal code is valid and decode (often also said reverse or retrieve) the generating anagraphic data.
At the moment the package doesn't calculate a Tax number starting from anagraphic data, nor verify if a code is correct.

## Getting started

- it is pure dart, makes use of dartz library

## Usage

      At the moment the package doesn't verify if the 
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


## Additional information

- 
