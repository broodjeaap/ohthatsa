import 'package:ohthatsa/util/Months.dart';
import 'package:test/test.dart';
import 'package:ohthatsa/util/DayCalculator.dart';

void main() {
  group("DayCalculator", () {
    group("getYearValue() ", () {
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
    group("getMonthValue() raw int", () {
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
    group("getMonthValue() Month.i", () {
      test("January", () {
        expect(DayCalculator.getMonthValue(Months.january.i), equals(0));
      });
      test("February", () {
        expect(DayCalculator.getMonthValue(Months.february.i), equals(3));
      });
      test("March", () {
        expect(DayCalculator.getMonthValue(Months.march.i), equals(3));
      });
      test("April", () {
        expect(DayCalculator.getMonthValue(Months.april.i), equals(6));
      });
      test("May", () {
        expect(DayCalculator.getMonthValue(Months.may.i), equals(1));
      });
      test("June", () {
        expect(DayCalculator.getMonthValue(Months.june.i), equals(4));
      });
      test("July", () {
        expect(DayCalculator.getMonthValue(Months.july.i), equals(6));
      });
      test("August", () {
        expect(DayCalculator.getMonthValue(Months.august.i), equals(2));
      });
      test("September", () {
        expect(DayCalculator.getMonthValue(Months.september.i), equals(5));
      });
      test("October", () {
        expect(DayCalculator.getMonthValue(Months.october.i), equals(0));
      });
      test("November", () {
        expect(DayCalculator.getMonthValue(Months.november.i), equals(3));
      });
      test("December", () {
        expect(DayCalculator.getMonthValue(Months.december.i), equals(5));
      });
    });
    group("getMonthValueByString()", () {
      test("January", () {
        expect(DayCalculator.getMonthValueByString("January"), equals(0));
      });
      test("February", () {
        expect(DayCalculator.getMonthValueByString("February"), equals(3));
      });
      test("March", () {
        expect(DayCalculator.getMonthValueByString("March"), equals(3));
      });
      test("April", () {
        expect(DayCalculator.getMonthValueByString("April"), equals(6));
      });
      test("May", () {
        expect(DayCalculator.getMonthValueByString("May"), equals(1));
      });
      test("June", () {
        expect(DayCalculator.getMonthValueByString("June"), equals(4));
      });
      test("July", () {
        expect(DayCalculator.getMonthValueByString("July"), equals(6));
      });
      test("August", () {
        expect(DayCalculator.getMonthValueByString("August"), equals(2));
      });
      test("September", () {
        expect(DayCalculator.getMonthValueByString("September"), equals(5));
      });
      test("October", () {
        expect(DayCalculator.getMonthValueByString("October"), equals(0));
      });
      test("November", () {
        expect(DayCalculator.getMonthValueByString("November"), equals(3));
      });
      test("December", () {
        expect(DayCalculator.getMonthValueByString("December"), equals(5));
      });
    });
    group("getMonthValueByString()", () {
      test("January", () {
        expect(DayCalculator.getMonthValueByString(Months.january.string), equals(0));
      });
      test("February", () {
        expect(DayCalculator.getMonthValueByString(Months.february.string), equals(3));
      });
      test("March", () {
        expect(DayCalculator.getMonthValueByString(Months.march.string), equals(3));
      });
      test("April", () {
        expect(DayCalculator.getMonthValueByString(Months.april.string), equals(6));
      });
      test("May", () {
        expect(DayCalculator.getMonthValueByString(Months.may.string), equals(1));
      });
      test("June", () {
        expect(DayCalculator.getMonthValueByString(Months.june.string), equals(4));
      });
      test("July", () {
        expect(DayCalculator.getMonthValueByString(Months.july.string), equals(6));
      });
      test("August", () {
        expect(DayCalculator.getMonthValueByString(Months.august.string), equals(2));
      });
      test("September", () {
        expect(DayCalculator.getMonthValueByString(Months.september.string), equals(5));
      });
      test("October", () {
        expect(DayCalculator.getMonthValueByString(Months.october.string), equals(0));
      });
      test("November", () {
        expect(DayCalculator.getMonthValueByString(Months.november.string), equals(3));
      });
      test("December", () {
        expect(DayCalculator.getMonthValueByString(Months.december.string), equals(5));
      });
    });
    group("getCenturyValue()", () {
      group("1700s", () {
        test("1700", () {
          expect(DayCalculator.getCenturyValue(1700), equals(4));
        });
        test("1799", () {
          expect(DayCalculator.getCenturyValue(1799), equals(4));
        });
        test("1777", () {
          expect(DayCalculator.getCenturyValue(1777), equals(4));
        });
      });
      group("1800s", () {
        test("1800", () {
          expect(DayCalculator.getCenturyValue(1800), equals(2));
        });
        test("1899", () {
          expect(DayCalculator.getCenturyValue(1899), equals(2));
        });
        test("1843", () {
          expect(DayCalculator.getCenturyValue(1843), equals(2));
        });
      });
      group("1900s", () {
        test("1900", () {
          expect(DayCalculator.getCenturyValue(1900), equals(0));
        });
        test("1999", () {
          expect(DayCalculator.getCenturyValue(1999), equals(0));
        });
        test("1938", () {
          expect(DayCalculator.getCenturyValue(1943), equals(0));
        });
      });
      group("2000s", () {
        test("2000", () {
          expect(DayCalculator.getCenturyValue(2000), equals(6));
        });
        test("2099", () {
          expect(DayCalculator.getCenturyValue(2099), equals(6));
        });
        test("2064", () {
          expect(DayCalculator.getCenturyValue(2064), equals(6));
        });
      });
      group("2100s", () {
        test("2100", () {
          expect(DayCalculator.getCenturyValue(2100), equals(4));
        });
        test("2199", () {
          expect(DayCalculator.getCenturyValue(2199), equals(4));
        });
        test("2158", () {
          expect(DayCalculator.getCenturyValue(2158), equals(4));
        });
      });
      group("2200s", () {
        test("2200", () {
          expect(DayCalculator.getCenturyValue(2200), equals(2));
        });
        test("2299", () {
          expect(DayCalculator.getCenturyValue(2299), equals(2));
        });
        test("2249", () {
          expect(DayCalculator.getCenturyValue(2249), equals(2));
        });
      });
      group("2300s", () {
        test("2300", () {
          expect(DayCalculator.getCenturyValue(2300), equals(0));
        });
        test("2399", () {
          expect(DayCalculator.getCenturyValue(2399), equals(0));
        });
        test("2304", () {
          expect(DayCalculator.getCenturyValue(23049), equals(0));
        });
      });
    });
    group("isLeapYear()", () {
      test("1800", () {
        expect(DayCalculator.isLeapYear(1800), equals(false));
      });
      test("1835", () {
        expect(DayCalculator.isLeapYear(1835), equals(false));
      });
      test("1836", () {
        expect(DayCalculator.isLeapYear(1836), equals(true));
      });
      test("1880", () {
        expect(DayCalculator.isLeapYear(1880), equals(true));
      });
      test("1900", () {
        expect(DayCalculator.isLeapYear(1900), equals(false));
      });
      test("1904", () {
        expect(DayCalculator.isLeapYear(1904), equals(true));
      });
      test("1906", () {
        expect(DayCalculator.isLeapYear(1906), equals(false));
      });
      test("1924", () {
        expect(DayCalculator.isLeapYear(1924), equals(true));
      });
      test("2000", () {
        expect(DayCalculator.isLeapYear(2000), equals(true));
      });
      test("2012", () {
        expect(DayCalculator.isLeapYear(2012), equals(true));
      });
      test("2048", () {
        expect(DayCalculator.isLeapYear(2048), equals(true));
      });
      test("2064", () {
        expect(DayCalculator.isLeapYear(2064), equals(true));
      });
      test("2100", () {
        expect(DayCalculator.isLeapYear(2100), equals(false));
      });
      test("2172", () {
        expect(DayCalculator.isLeapYear(2172), equals(true));
      });
      test("2139", () {
        expect(DayCalculator.isLeapYear(2139), equals(false));
      });
      test("2199", () {
        expect(DayCalculator.isLeapYear(2199), equals(false));
      });
      test("2200", () {
        expect(DayCalculator.isLeapYear(2200), equals(false));
      });
      test("2250", () {
        expect(DayCalculator.isLeapYear(2250), equals(false));
      });
      test("2292", () {
        expect(DayCalculator.isLeapYear(2292), equals(true));
      });
      test("2300", () {
        expect(DayCalculator.isLeapYear(2300), equals(false));
      });
      test("2323", () {
        expect(DayCalculator.isLeapYear(2323), equals(false));
      });
      test("2400", () {
        expect(DayCalculator.isLeapYear(2400), equals(true));
      });
    });
  });
  group("Months", () {
    test("toString", () {
      expect("${Months.january}" == "january", equals(true));
    });
    test("==", () {
      expect(Months.january == Month("january", 0, 0), equals(true));
    });
    test("!=", () {
      expect(Months.january == Month("february", 0, 0), equals(false));
    });
  });
}
