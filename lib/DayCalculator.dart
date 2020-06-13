// Based on this article:
// https://artofmemory.com/blog/how-to-calculate-the-day-of-the-week-4203.html

class DayCalculator {
  // Calculates (YY + floor(YY / 4)) % 7
  static int getYearValue(int year){
    var yy = year % 100;
    return (yy + (yy / 4).floor()) % 7;
  }
}