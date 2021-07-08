@EndUserText.label: 'Dimension Airline'
@AccessControl.authorizationCheck: #CHECK
@AbapCatalog.sqlViewName: '/DMO/IAGENCYDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true

@Analytics.dataCategory: #DIMENSION

define view /DMO/I_AgencyDimension
  as select from /DMO/I_Agency
{

      @ObjectModel.text.element: [ 'Agency' ]
  key AgencyID,

      @Semantics.text: true
      Name,

      Street,

      PostalCode,

      City,

      CountryCode,

      PhoneNumber,

      /* Associations */
      _Country

}
