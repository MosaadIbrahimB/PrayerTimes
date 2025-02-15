//https://api.aladhan.com/v1/
// timings/01-01-2025?latitude=51.5194682&longitude=-0.1360365&method=3&shafaq=general&tune=5%2C3%2C5%2C7%2C9%2C-1%2C0%2C8%2C-6&timezonestring=UTC&calendarMethod=UAQ
class ApiConstant {
  final String baseUrl = 'https://api.aladhan.com/v1/';
  final String endPoint1 = 'timings/';
  final String method = '&method=3&shafaq=general';
  final String tune = '&tune=5%2C3%2C5%2C7%2C9%2C-1%2C0%2C8%2C-6';
  final String timezone = '&timezonestring=Africa/Cairo'; // ضبط التوقيت لمصر
  final String calendarMethod = '&calendarMethod=UAQ';

  String getFullUrl(String date, String latitude, String longitude) {
    return '$baseUrl$endPoint1$date?latitude=$latitude&longitude=$longitude$method$tune$timezone$calendarMethod';
  }
}
