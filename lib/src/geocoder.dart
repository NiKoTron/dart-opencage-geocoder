import 'dart:async';
import 'dart:io';

import 'package:opencage_geocoder/src/http_service/http_service.dart';

import 'model.dart';

/// A geocoder based on OpenCage api.
///
/// More details here : https://opencagedata.com/.
class Geocoder {
  static const String host = 'https://api.opencagedata.com/geocode/v1/json';

  late final HttpService _httpService;

  /// Create an OpenCage geocoder for the given [apiKey].
  Geocoder(String apiKey, [HttpClient? client]) {
    final baseUrl = '${host}?key=${apiKey}';

    _httpService = HttpService.http(baseUrl, client: client);
  }

  /// Get coordinates and data from a search [query].
  ///
  /// All optional parameters are described here : https://opencagedata.com/api#request.
  Future<GeocoderResponse> geocode(
    String query, {
    String language = "en",
    String? countryCode = null,
    Bounds? bounds = null,
    bool abbrv = false,
    int limit = 10,
    int minConfidence = 0,
    bool noAnnotations = false,
    bool noDedupe = false,
    bool noRecord = false,
    bool addRequest = false,
  }) {
    return _httpService.send({
      'q': query,
      'language': language,
      'countryCode': countryCode,
      'bounds': bounds,
      'limit': limit,
      'no_annotations': noAnnotations,
      'min_confidence': minConfidence,
      'add_request': addRequest,
      'no_dedupe': noDedupe,
      'no_record': noRecord,
      'abbrv': abbrv
    });
  }

  /// Get address detail from [latitude] and [longitude] coordinates.
  ///
  /// All optional parameters are described here : https://opencagedata.com/api#request.
  Future<GeocoderResponse> reverseGeocode(
    double latitude,
    double longitude, {
    String language = "en",
    String? countryCode = null,
    Bounds? bounds = null,
    bool abbrv = false,
    int limit = 10,
    int minConfidence = 0,
    bool noAnnotations = false,
    bool noDedupe = false,
    bool noRecord = false,
    bool addRequest = false,
  }) {
    return geocode(
      "${latitude}+${longitude}",
      language: language,
      countryCode: countryCode,
      bounds: bounds,
      abbrv: abbrv,
      limit: limit,
      minConfidence: minConfidence,
      noAnnotations: noAnnotations,
      noDedupe: noDedupe,
      noRecord: noRecord,
      addRequest: addRequest,
    );
  }
}
