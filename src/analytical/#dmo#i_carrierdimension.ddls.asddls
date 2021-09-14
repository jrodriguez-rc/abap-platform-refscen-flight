@AbapCatalog.sqlViewName: '/DMO/ICARRIERDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier Dimension'

@Analytics.dataCategory: #DIMENSION
@Search.searchable: true

define view /DMO/I_CarrierDimension
  as select from /DMO/I_Carrier
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
  key AirlineID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text: true
      Name,

      @Semantics.currencyCode: true
      CurrencyCode,

      /* Associations */
      _Currency

}
