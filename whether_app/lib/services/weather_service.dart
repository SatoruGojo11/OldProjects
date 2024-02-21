import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:whether_app/model/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apikey;
  final String BASE_URL =
      'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=81ac28d1c59b0f58d4476f8788d712df';

  WeatherService(this.apikey);

  Future<Weather> getWeather(String cityname) async {
    final response = await http.get(Uri.parse('$BASE_URL'));

    if (response.statusCode == 200) {
      return Weather.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  Future<String> getCurrentCity() async {
    // get Permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch the Current Location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert the location into a list of Placement objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // extract the city name from the first placemark
    String? city = placemarks[0].locality;

    return city ?? '';
  }
}
