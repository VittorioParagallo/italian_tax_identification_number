This package provides a class to manage italian tax identification numbers by:
- validating (only the format)
- encoding (upcoming)
- decoding 

the mapping codes->towns is hardcoded, so no internet connection is needed to use it

## Features

- Create and object with the id string parameters and the sub fields will be populated with available data

## Getting started

- it is pure dart, makes use of dartz library

## Usage

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


## Additional information

- in the next version
