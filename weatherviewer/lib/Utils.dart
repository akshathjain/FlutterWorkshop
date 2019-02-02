/*
Name: Akshath Jain
Date: 2/2/19
Purpose: general utilitary functions
*/

class Utils{
  static double KtoF(double k){
    return (k - 273.15) * 9.0 / 5.0 + 32;
  }

  static String getDate(String s){
    DateTime dt = DateTime.parse(s);
    List months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
    return months.elementAt(dt.month - 1) + ", " + dt.day.toString();
  }

  static String getHour(String s){
    DateTime dt = DateTime.parse(s);
    String ampm = dt.hour > 12 ? "PM" : "AM";
    return (dt.hour % 12 + 1).toString() + ":00" + ampm;
  }
}