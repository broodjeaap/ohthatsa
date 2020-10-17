class Months {
  static final Month january = new Month("january", 0, 0);
  static final Month february = new Month("february", 1, 3);
  static final Month march = new Month("march", 2, 3);
  static final Month april = new Month("april", 3, 6);
  static final Month may = new Month("may", 4, 1);
  static final Month june = new Month("june", 5, 4);
  static final Month july = new Month("july", 6, 6);
  static final Month august = new Month("august", 7, 2);
  static final Month september = new Month("september", 8, 5);
  static final Month october = new Month("october", 9, 0);
  static final Month november = new Month("november", 10, 3);
  static final Month december = new Month("december", 11, 5);

  static final List<Month> _list = List.unmodifiable([
    january,
    february,
    march,
    april,
    may,
    june,
    july,
    august,
    september,
    october,
    november,
    december
  ]);
  static final Map<String, Month> _map = Map.unmodifiable({
    january.string: january,
    february.string: february,
    march.string: march,
    april.string: april,
    may.string: may,
    june.string: june,
    july.string: july,
    august.string: august,
    september.string: september,
    october.string: october,
    november.string: november,
    december.string: december
  });

  static List<String> _stringList = List.unmodifiable(
    _list.map((month) => month.string)
  );
  static List<int> _indexList = List.unmodifiable(
    _list.map((month) => month.i)
  );
  static List<int> _valueList = List.unmodifiable(
      _list.map((month) => month.value)
  );
  static List<Month> asList(){
    return _list;
  }
  static List<String> asStringList(){
    return _stringList;
  }
  static List<int> asIndexList(){
    return _indexList;
  }
  static List<int> asValueList(){
    return _valueList;
  }
  static Month getFromString(String month){
    return _map[month.toLowerCase()];
  }
}

class Month {
  final String string;
  final int i;
  final int value;
  Month(this.string, this.i, this.value);
  
  @override
  String toString() {
    return this.string;
  }
  @override
  bool operator == (Object other){
    return other is Month &&
      this.string == other.string &&
      this.i == other.i &&
      this.value == other.value;
  }
}