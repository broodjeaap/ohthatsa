import 'package:test/test.dart';
import 'package:ohthatsa/DayCalculator.dart';

void main() {
  group("DayCalculator getYearValue() ", () {
    test("1897", () {
      expect(DayCalculator.getYearValue(1897), equals(2));
    });
  });
}
