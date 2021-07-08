@AbapCatalog.sqlViewName: '/DMO/IAIRPORTDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airport Dimension'

@Analytics.dataCategory: #DIMENSION

define view /DMO/I_AirportDimension
  as select from /DMO/I_Airport
{

      @ObjectModel.text.element: [ 'Name' ]
  key AirportID,

      @Semantics.text: true
      Name,

      @Semantics.address.city: true
      City,

      @Semantics.address.country: true
      CountryCode,

      /* Associations */
      _Country

}
