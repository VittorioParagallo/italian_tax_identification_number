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
Consider this fake code GSP MTA 98L25 E625O for a persone named "Giuseppe Amato" born on 25/07/98 in Livorno.
Codes can be calculated with any library or online free tool.

```
talianTaxIdentificationNumber result = ItalianTaxIdentificationNumber.fromTaxNumber('GSP MTA 98L25 E625O');
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
```
## How the place is retrieved?
The 3 char from 12 to 15 contain the catastal code.
For example from this code GSPMTA98L25E625O the catastal code is E625.
In the package there is an hardcoded database in the the file codici_catastali.dart. It provides a list of map rapresenting a table that can be filtered with catastal code. It is used to fill in 'ItalianTaxIdentificationNumber' object all the birth places informations. 

The field possiblePostalCodes is a list because that level of detail is not coded in the fiscal code, but can be restricted to a range of values and can be usable to form fill suggestions or dropdowns.

In the case you discover a mistake or a new data need, fork from github and i'll immediatly merge to keep the database updated.

## Additional information

This code has several  limitations by it's nature, consequently the package as well:
- it follows the common rules with which a code is generated, but in case of duplicate codes the public authority brake the common rules and issue a code with some other rules (theese are changing during time).
- This means that the best way to use this package is in case a user has to fullfill a form. By starting inserting the fiscal code some fields can be prefilled suggested. But be aware not verified against it.

When i started to write this package i wanted to implement the creation and validation functions as well. Now I'm not sure anymore because at the end the only entity who can validate the correcness and existence of a fiscal code is "Italian Revenue Agency" ("Agenzia delle entrate"). 

At the time of writing july 2023 th Revenue Agency is starting to provide an API service on this topic. 

So i think that in futere releases i'll try to integrate a rest client communicating with this service.
