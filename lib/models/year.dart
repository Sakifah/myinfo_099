class Year {
  String? yearId;
  String? yearName;
  String? yearvalue;

  Year(this.yearId, this.yearName, this.yearvalue);

  get yearclassValue => null;

  static List<Year> getYear() {
    return[
      Year('1', 'ปี1','year1'),
      Year('2', 'ปี2','year2'),
      Year('3', 'ปี3','year3'),
      Year('4', 'ปี4','year4'),
    ];
  }
}