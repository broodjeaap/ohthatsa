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
  group("DayCalculator getCenturyValue()", () {
    group("1700s", () {
      test("1700", (){
        expect(DayCalculator.getCenturyValue(1700), equals(4));
      });
      test("1799", (){
        expect(DayCalculator.getCenturyValue(1799), equals(4));
      });
      test("1777", (){
        expect(DayCalculator.getCenturyValue(1777), equals(4));
      });
    });
    group("1800s", () {
      test("1800", (){
        expect(DayCalculator.getCenturyValue(1800), equals(2));
      });
      test("1899", (){
        expect(DayCalculator.getCenturyValue(1899), equals(2));
      });
      test("1843", (){
        expect(DayCalculator.getCenturyValue(1843), equals(2));
      });
    });
    group("1900s", () {
      test("1900", (){
        expect(DayCalculator.getCenturyValue(1900), equals(0));
      });
      test("1999", (){
        expect(DayCalculator.getCenturyValue(1999), equals(0));
      });
      test("1938", (){
        expect(DayCalculator.getCenturyValue(1943), equals(0));
      });
    });
    group("2000s", () {
      test("2000", (){
        expect(DayCalculator.getCenturyValue(2000), equals(6));
      });
      test("2099", (){
        expect(DayCalculator.getCenturyValue(2099), equals(6));
      });
      test("2064", (){
        expect(DayCalculator.getCenturyValue(2064), equals(6));
      });
    });
    group("2100s", () {
      test("2100", (){
        expect(DayCalculator.getCenturyValue(2100), equals(4));
      });
      test("2199", (){
        expect(DayCalculator.getCenturyValue(2199), equals(4));
      });
      test("2158", (){
        expect(DayCalculator.getCenturyValue(2158), equals(4));
      });
    });
    group("2200s", () {
      test("2200", (){
        expect(DayCalculator.getCenturyValue(2200), equals(2));
      });
      test("2299", (){
        expect(DayCalculator.getCenturyValue(2299), equals(2));
      });
      test("2249", (){
        expect(DayCalculator.getCenturyValue(2249), equals(2));
      });
    });
    group("2300s", () {
      test("2300", (){
        expect(DayCalculator.getCenturyValue(2300), equals(0));
      });
      test("2399", (){
        expect(DayCalculator.getCenturyValue(2399), equals(0));
      });
      test("2304", (){
        expect(DayCalculator.getCenturyValue(23049), equals(0));
      });
    });
  });
}
