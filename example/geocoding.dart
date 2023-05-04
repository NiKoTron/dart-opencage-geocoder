import 'package:opencage_geocoder/opencage_geocoder.dart';
import 'dump.dart';

Future<void> main(List<String> arguments) async {
  final apiKey = arguments[0];
  var geocoder = Geocoder(apiKey);

  print(
      'GEOCODING -------------------------------------------------------------------------------------');
  var response = await geocoder.geocode("rennes", limit: 1, countryCode: "fr");
  Dumper.dump(response);

  print(
      'REVERSE GEOCODING -----------------------------------------------------------------------------');
  response = await geocoder.reverseGeocode(-1.6800198, 48.1113387, limit: 1);
  Dumper.dump(response);
}
