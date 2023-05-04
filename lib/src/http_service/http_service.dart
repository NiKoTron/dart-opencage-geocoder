import 'dart:convert';
import 'dart:io';

import 'package:opencage_geocoder/src/model.dart';

abstract class HttpService {
  String get baseUrl;

  HttpService._();

  Uri createUrl(Map queryArgs) {
    var result = new StringBuffer(this.baseUrl);
    queryArgs.forEach((key, value) {
      if (value != null && value != false) {
        var formattedValue = _formatQueryArgValue(value);
        result.write("&${key}=${formattedValue}");
      }
    });
    return Uri.parse(result.toString());
  }

  String _formatQueryArgValue(Object value) {
    if (value is bool) {
      return value ? "1" : "0";
    }
    if (value is Bounds) {
      return "${value.northeast.longitude}%2C${value.northeast.latitude}%2C${value.southwest.longitude}%2C${value.southwest.latitude}";
    }
    if (value is int || value is double) {
      return value.toString();
    }
    return Uri.encodeComponent(value.toString());
  }

  Future<GeocoderResponse> send(Map args);

  factory HttpService.http(String baseUrl, {HttpClient? client}) =>
      _HttpServiceImpl(
        baseUrl: baseUrl,
        client: client ?? HttpClient(),
      );
}

class _HttpServiceImpl extends HttpService {
  HttpClient client;

  @override
  final String baseUrl;

  _HttpServiceImpl({
    required this.baseUrl,
    required this.client,
  }) : super._();

  @override
  Future<GeocoderResponse> send(Map args) async {
    var url = this.createUrl(args);
    var request = await client.getUrl(url);
    var response = await request.close();
    var jsonString = await utf8.decoder.bind(response).join();
    var data = json.decode(jsonString);
    return new GeocoderResponse.fromJson(data);
  }
}
