@EndUserText.label: 'Custom entity for unmanaged travel query'
@ObjectModel.query.implementedBy:'ABAP:/dmo/cl_travel_uq' 

define custom entity /DMO/I_TRAVEL_UQ 
{
  key Travel_ID     : abap.numc( 8 );
      Agency_ID     : abap.numc( 6 );
      Customer_ID   : abap.numc( 6 );
      Begin_Date    : abap.dats;
      End_Date      : abap.dats;
      Booking_Fee   : abap.dec( 17, 3 );
      Total_Price   : abap.dec( 17, 3 );
      Currency_Code : abap.cuky;
      Status        : abap.char( 1 );
      LastChangedAt : timestampl;
}
