class Budget
{
    String country;
    String currency;
    int year;
    float amount;
    //Reads values from list and inputs them into a variable
    Budget(TableRow row)
    {
      country = row.getString(0);
      currency = row.getString(1);
      year = row.getInt(3);
      amount = row.getFloat(4);    
    }
}