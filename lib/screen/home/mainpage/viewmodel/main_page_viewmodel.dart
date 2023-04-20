//[1] Imported Http
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_weather/screen/home/mainpage/model/weather.dart';

class MainViewModal {
  //[2] Created a future method to fetch data from our server. used wheaterapi. Making user to choose which city to recieve data from by using parameter city.
  //[tr][2]İnternetten datamızı çekebilmek için bir future metod oluşturuyoruz. Bu metodda city parametresi kullanarak, hangi şehrin verisini istediğini kullanıcıya seçtiriyoruz.
  Future<Weather?> getWeather(String? city) async {
    //! your own api key. U can get it from weatherapi.com.
    String apikey = "";
    //[3] defining our url.
    //[tr][3] urlmizi tanımlıyoruz.
    String url =
        "https://api.weatherapi.com/v1/current.json?key=$apikey&q=$city&aqi=no";

    //[4] defining async http.get as response and parsing our url by it.
    //[tr][4] http.get tanimlamasi yaparak urlmizi uri ile parse ediyoruz.
    final response = await http.get(Uri.parse(url));

    //[5] If response is OK. It will decode our response's body to json which is defined in our Weather model.
    //[tr][5] Cevap değeri 200 ise (httpstatus ok), response bodysini Weather modelimizin içindeki tanımlı olan metod ile json a decode ediyoruz.
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Weather');
    }
  }
}
