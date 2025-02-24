class HijriModel {
  String numberDay;
  String nameDay;
  String month;
  String year;

  HijriModel(
      this.numberDay,
      this.nameDay,
      this.month,
      this.year,
      );

  HijriModel.fromJson(Map<String, dynamic> json)
      : this(
      replaceNumbersWithArabic( json['day']),
    json['weekday']['ar'],
    json['month']['ar'],
    replaceNumbersWithArabic( json['year']),
  );



static  String replaceNumbersWithArabic(String input) {
    const Map<String, String> numbersMap = {
      "0": "٠",
      "1": "١",
      "2": "٢",
      "3": "٣",
      "4": "٤",
      "5": "٥",
      "6": "٦",
      "7": "٧",
      "8": "٨",
      "9": "٩"
    };

    return input.split('').map((char) => numbersMap[char] ?? char).join();
  }
}
