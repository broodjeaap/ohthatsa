import 'package:test/test.dart';
import 'package:ohthatsa/DayCalculator.dart';

void main() {
  group("DayCalculator getYearValue() ", () {
    test("1897", () {
      expect(DayCalculator.getYearValue(1897), equals(2));
    });
    test("1954", () {
      expect(DayCalculator.getYearValue(1954), equals(4));
    });
    test("2013", () {
      expect(DayCalculator.getYearValue(2013), equals(2));
    });
    test("2132", () {
      expect(DayCalculator.getYearValue(2132), equals(5));
    });
  });
}
