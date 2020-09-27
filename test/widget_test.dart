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
  group("DayCalculator getMonthValue()", () {
    test("January", () {
      expect(DayCalculator.getMonthValue(0), equals(0));
    });
    test("February", () {
      expect(DayCalculator.getMonthValue(1), equals(3));
    });
    test("March", () {
      expect(DayCalculator.getMonthValue(2), equals(3));
    });
    test("April", () {
      expect(DayCalculator.getMonthValue(3), equals(6));
    });
    test("May", () {
      expect(DayCalculator.getMonthValue(4), equals(1));
    });
    test("June", () {
      expect(DayCalculator.getMonthValue(5), equals(4));
    });
    test("July", () {
      expect(DayCalculator.getMonthValue(6), equals(6));
    });
    test("August", () {
      expect(DayCalculator.getMonthValue(7), equals(2));
    });
    test("September", () {
      expect(DayCalculator.getMonthValue(8), equals(5));
    });
    test("October", () {
      expect(DayCalculator.getMonthValue(9), equals(0));
    });
    test("November", () {
      expect(DayCalculator.getMonthValue(10), equals(3));
    });
    test("December", () {
      expect(DayCalculator.getMonthValue(11), equals(5));
    });
  });
}
