// Based on this article:
// https://artofmemory.com/blog/how-to-calculate-the-day-of-the-week-4203.html

class DayCalculator {
  // Calculates (YY + floor(YY / 4)) % 7
  static int getYearValue(int year){
    var yy = year % 100;
    return (yy + (yy / 4).floor()) % 7;
  }

  static int getMonthValue(int month){
    // Returns the month value for input 0-11
    switch(month){
      case 0:{
        return 0;
      }
      case 1:{
        return 3;
      }
      case 2:{
        return 3;
      }
      case 3:{
        return 6;
      }
      case 4:{
        return 1;
      }
      case 5:{
        return 4;
      }
      case 6:{
        return 6;
      }
      case 7:{
        return 2;
      }
      case 8:{
        return 5;
      }
      case 9:{
        return 0;
      }
      case 10:{
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
}