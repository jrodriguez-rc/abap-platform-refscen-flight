@AbapCatalog.sqlViewName: '/DMO/ICONNECTDIM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Connection Dimension'

@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #DIMENSION

@ObjectModel.representativeKey: 'ConnectionID'

define view /DMO/I_ConnectionDimension
  as select from /DMO/I_Connection
  association [1..1] to /DMO/I_CarrierDimension as _Airline on $projection.AirlineID = _Airline.AirlineID
{

      @ObjectModel.foreignKey.association: '_Airline'
  key AirlineID,

      @ObjectModel.text.element: [ 'Destination' ]
  key ConnectionID,

      DepartureAirport,

      DestinationAirport,

      @Semantics.text: true
      concat(DepartureAirport, concat(' -> ', DestinationAirport)) as Destination,

      DepartureTime,

      ArrivalTime,

      Distance,

      DistanceUnit,

      _Airline

}
