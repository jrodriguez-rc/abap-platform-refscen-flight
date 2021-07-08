@AbapCatalog.sqlViewName: '/DMO/ICUSTOMDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Dimension'

@Analytics.dataCategory: #DIMENSION

@ObjectModel.representativeKey: 'CustomerID'

define view /DMO/I_CustomerDimension
  as select from /DMO/I_Customer
{

      @ObjectModel.text.element: [ 'Name' ]
  key CustomerID,

      @Semantics.name.givenName: true
      FirstName,

      @Semantics.name.familyName: true
      LastName,

      @Semantics.text: true
      @Semantics.name.fullName: true
      concat(LastName, FirstName) as Name,

      @Semantics.name.prefix: true
      Title,

      @Semantics.address.street: true
      Street,

      @Semantics.address.zipCode: true
      PostalCode,

      @Semantics.address.city: true
      City,

      @Semantics.address.country: true
      CountryCode,

      @Semantics.telephone.type: [#PREF,#WORK]
      PhoneNumber,

      @Semantics.eMail.type: [#PREF,#WORK]
      EMailAddress,

      /* Associations */
      _Country

}
