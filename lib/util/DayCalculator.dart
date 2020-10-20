// Based on this article:
// https://artofmemory.com/blog/how-to-calculate-the-day-of-the-week-4203.html

import 'Months.dart';

class DayCalculator {
  // Calculates (YY + floor(YY / 4)) % 7
  static int getYearValue(int year){
    var yy = year % 100;
    return (yy + (yy / 4).floor()) % 7;
  }

  static int getMonthValue(int month){
    // Returns the month value for input 0-11
    return Months.getFromInt(month).value;
  }

  static int getMonthValueByString(String month){
    switch(month){
      case "January":{
        return 0;
      }
      case "February":{
        return 3;
      }
      case "March":{
        return 3;
      }
      case "April":{
        return 6;
      }
      case "May":{
        return 1;
      }
      case "June":{
        return 4;
      }
      case "July":{
        return 6;
      }
      case "August":{
        return 2;
      }
      case "September":{
        return 5;
      }
      case "October":{
        return 0;
      }
      case "November":{
        return 3;
      }
      default:{
        return 5;
      }
    }
  }

  static int getCenturyValue(int year){
    // Returns the century code for the year
    // TODO: Implement Julian calendar?
    year = (year / 100).floor() * 100;
    switch(year){
      case 1700:{
        return 4;
      }
      case 1800:{
        return 2;
      }
      case 1900:{
        return 0;
      }
      case 2000:{
        return 6;
      }
      case 2100:{
        return 4;
      }
      case 2200:{
        return 2;
      }
      default:{ //2300
        return 0;
      }
    }
  }

  static bool isLeapYear(int year){
    if (year % 4 != 0) {
      return false;
    }
    if (year % 100 == 0 && year % 400 != 0){
      return false;
    }
    return true;
  }
}