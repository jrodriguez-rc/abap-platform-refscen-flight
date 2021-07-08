@AbapCatalog.sqlViewName: '/DMO/ICARRIERDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier Dimension'

@Analytics.dataCategory: #DIMENSION

define view /DMO/I_CarrierDimension
  as select from /DMO/I_Carrier
{

      @ObjectModel.text.element: [ 'Name' ]
  key AirlineID,

      @Semantics.text: true
      Name,

      @Semantics.currencyCode: true
      CurrencyCode,

      /* Associations */
      _Currency

}
