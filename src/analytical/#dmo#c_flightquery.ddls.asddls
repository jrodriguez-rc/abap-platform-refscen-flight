@AbapCatalog.sqlViewName: '/DMO/CFLIGHTQUER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight View - Query'
@Metadata.allowExtensions: true

@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Search.searchable: true

@UI: {
  headerInfo: {
    typeName: 'Flight',
    typeNamePlural: 'Flights',
    title: {
        type: #STANDARD,
        label: 'Airline',
        targetElement: '_Airline'
    },
    description: {
        type: #STANDARD,
        label: 'Description',
        targetElement: '_Connection'
    }
  }
}

@UI.chart: [{
    qualifier: 'ChartAirline',
    chartType: #DONUT,
    description: 'By Airline',
    dimensions: ['AirlineID'],
    measures: ['TotalOfFlights'],
    dimensionAttributes: [{
        dimension: 'AirlineID',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'TotalOfFlights',
        role: #AXIS_1,
        asDataPoint: true
    }]
},{
    qualifier: 'ChartConnection',
    chartType: #DONUT,
    description: 'By Connection',
    dimensions: ['ConnectionID'],
    measures: ['TotalOfFlights'],
    dimensionAttributes: [{
        dimension: 'ConnectionID',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'TotalOfFlights',
        role: #AXIS_1,
        asDataPoint: true
    }]
},{
    qualifier: 'ChartByAirlineTravelers',
    chartType: #COLUMN,
    description: 'By Airline Travelers',
    dimensions: ['AirlineID','FlightDate'],
    measures: ['TotalOfContracts'],
    dimensionAttributes: [{
        dimension: 'AirlineID',
        role: #CATEGORY
    },{
        dimension: 'FlightDate',
        role: #SERIES
    }],
    measureAttributes: [{
        measure: 'TotalOfFlights',
        role: #AXIS_1,
        asDataPoint: true
    }]
}]

@UI.presentationVariant:[{
    qualifier: 'KPIAirline',
    sortOrder: [{
        by: 'AirlineID',
        direction: #ASC
    }],
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartAirline'
    }]
},{
    qualifier: 'KPIConnection',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartConnection'
    }]
},{
    qualifier: 'KPIByAirlineTravelers',
    sortOrder: [{
        by: 'FlightDate',
        direction: #DESC
    },{
        by: 'AirlineID',
        direction: #ASC
    }],
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartByAirlineTravelers'
    }]
}]

@UI.selectionVariant: [{
    qualifier: 'KPIAirline',
    text: 'KPI Airline'
},{
    qualifier: 'KPIConnection',
    text: 'KPI Connection'
},{
    qualifier: 'KPIByAirlineTravelers',
    text: 'KPI By Airline Travelers'
}]


@UI.selectionPresentationVariant: [{
    qualifier: 'KPIAirline',
    presentationVariantQualifier: 'KPIAirline',
    selectionVariantQualifier: 'KPIAirline'
},{
    qualifier: 'KPIConnection',
    presentationVariantQualifier: 'KPIConnection',
    selectionVariantQualifier: 'KPIConnection'
},{
    qualifier: 'KPIByAirlineTravelers',
    presentationVariantQualifier: 'KPIByAirlineTravelers',
    selectionVariantQualifier: 'KPIByAirlineTravelers'
}]

define view /DMO/C_FlightQuery
  as select from /DMO/I_FlightCube
{

      @UI: {
          identification: [{ position: 10 }],
          lineItem: [{ position: 10 }],
          selectionField:[{position: 10}]
      }
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      @Search.defaultSearchElement: true
  key AirlineID,

      @UI: {
          identification: [{ position: 20 }],
          lineItem: [{ position: 20 }],
          selectionField:[{position: 20}]
      }
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      @Search.defaultSearchElement: true
  key ConnectionID,

      @UI: {
          identification: [{ position: 30 }],
          lineItem: [{ position: 30 }],
          selectionField:[{position: 30}]
      }
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      @Search.defaultSearchElement: true
  key FlightDate,

      @UI: {
          identification: [{ position: 40 }],
          lineItem: [{ position: 40 }],
          selectionField:[{position: 40}]
      }
      Price,

      @UI: {
          identification: [{ position: 50 }],
          lineItem: [{ position: 50 }],
          selectionField:[{position: 50}]
      }
      CurrencyCode,

      @UI: {
          identification: [{ position: 60 }],
          lineItem: [{ position: 60 }],
          selectionField:[{position: 60}]
      }
      PlaneType,

      @UI: {
          identification: [{ position: 70 }],
          lineItem: [{ position: 70 }],
          selectionField:[{position: 70}]
      }
      MaximumSeats,

      @UI: {
          identification: [{ position: 80 }],
          lineItem: [{ position: 80 }],
          selectionField:[{position: 80}]
      }
      OccupiedSeats,

      TotalOfFlights

}
