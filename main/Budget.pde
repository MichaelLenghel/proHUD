class Budget
{
   String country;
    String currency;
    int year;
    float amount;
    
    Budget(String line)
    {
      String[] fields = line.split(",");
      country = fields[0];
      currency = fields[1];
      year = Integer.parseInt(fields[3]);
      amount = Float.parseFloat(fields[4]);
    }
    
    Budget(TableRow row)
    {
      country = row.getString(0);
      currency = row.getString(1);
      year = row.getInt(3);
      amount = row.getFloat(4);    
    }
}