@AbapCatalog.sqlViewName: '/DMO/IFLIGHTCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight View - Cube'

@Search.searchable: true
@Analytics.dataExtraction.enabled: true
@Analytics.dataCategory: #CUBE

define view /DMO/I_FlightCube
  as select from /DMO/I_Flight
  association [1]    to /DMO/I_CarrierDimension    as _AirlineDim    on  $projection.AirlineID = _AirlineDim.AirlineID
  association [1]    to /DMO/I_ConnectionDimension as _ConnectionDim on  $projection.ConnectionID = _ConnectionDim.ConnectionID
                                                                     and $projection.AirlineID    = _ConnectionDim.AirlineID
  association [0..1] to I_Currency                 as _Currency      on  $projection.CurrencyCode = _Currency.Currency
{

      @ObjectModel.foreignKey.association: '_AirlineDim'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier' , element: 'AirlineID'} }]
  key AirlineID,

      @ObjectModel.foreignKey.association: '_ConnectionDim'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection', element: 'ConnectionID'},
                     additionalBinding: [{ element: 'AirlineID', localElement: 'AirlineID' }] }]
  key ConnectionID,

  key FlightDate,

      Price,

      CurrencyCode,

      PlaneType,

      MaximumSeats,

      /* MEASURES */
      @DefaultAggregation: #SUM
      OccupiedSeats,

      @EndUserText.label: 'Total of Contracts'
      @DefaultAggregation: #SUM
      1 as TotalOfFlights,

      /* Associations */
      _Airline,
      _Connection,
      _AirlineDim,
      _ConnectionDim,
      _Currency

}
