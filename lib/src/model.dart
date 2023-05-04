library opencage_geocoder_model;

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Coordinates {
  @JsonKey(name: 'lat')
  final double latitude;
  @JsonKey(name: 'lng')
  final double longitude;

  const Coordinates(
    this.latitude,
    this.longitude,
  );

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  String toString() => "{$latitude,$longitude}";

  Map<String, dynamic> tojson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Point {
  final double x;
  final double y;

  const Point(
    this.x,
    this.y,
  );

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  String toString() => "{$x,$y}";

  Map<String, dynamic> tojson() => _$PointToJson(this);
}

@JsonSerializable()
class Bounds {
  final Coordinates northeast;
  final Coordinates southwest;

  const Bounds(
    this.northeast,
    this.southwest,
  );

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  String toString() => "{ne:$northeast,sw:$southwest}";

  Map<String, dynamic> tojson() => _$BoundsToJson(this);
}

@JsonSerializable()
class Timestamp {
  @JsonKey(name: 'created_http')
  final String createdHttp;
  @JsonKey(name: 'created_unix')
  final double createdUnix;

  const Timestamp(
    this.createdHttp,
    this.createdUnix,
  );

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);

  String toString() => "{http:$createdHttp,unix:$createdUnix}";

  Map<String, dynamic> tojson() => _$TimestampToJson(this);
}

@JsonSerializable()
class StayInformed {
  final String blog;
  final String twitter;

  const StayInformed(
    this.blog,
    this.twitter,
  );

  factory StayInformed.fromJson(Map<String, dynamic> json) =>
      _$StayInformedFromJson(json);

  Map<String, dynamic> tojson() => _$StayInformedToJson(this);
}

@JsonSerializable()
class Status {
  final int code;
  final String message;

  const Status(
    this.code,
    this.message,
  );

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> tojson() => _$StatusToJson(this);
}

@JsonSerializable()
class What3words {
  final String words;

  const What3words(this.words);

  factory What3words.fromJson(Map<String, dynamic> json) =>
      _$What3wordsFromJson(json);

  Map<String, dynamic> tojson() => _$What3wordsToJson(this);
}

@JsonSerializable()
class Timezone {
  final String name;
  @JsonKey(
    name: 'short_name',
    fromJson: _shortNameFromJson,
    toJson: _shortNameToJson,
  )
  final String shortName;
  @JsonKey(name: 'now_in_dst')
  final double nowInDst;
  @JsonKey(name: 'offset_sec')
  final double offsetSec;
  @JsonKey(name: 'offset_string')
  final String offsetString;

  const Timezone(
    this.name,
    this.shortName,
    this.nowInDst,
    this.offsetSec,
    this.offsetString,
  );

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);

  static _shortNameToJson(String value) => value;
  static String _shortNameFromJson(dynamic value) => '$value';

  Map<String, dynamic> tojson() => _$TimezoneToJson(this);
}

@JsonSerializable()
class Rise {
  final double nautical;
  final double apparent;
  final double astronomical;
  final double civil;

  const Rise(
    this.nautical,
    this.apparent,
    this.astronomical,
    this.civil,
  );

  factory Rise.fromJson(Map<String, dynamic> json) => _$RiseFromJson(json);

  String toString() =>
      "{nautical:$nautical, apparent:$apparent, astronomical:$astronomical, civil:$civil}";

  Map<String, dynamic> tojson() => _$RiseToJson(this);
}

@JsonSerializable()
class Sun {
  final Rise rise;
  final Rise set;

  const Sun(
    this.rise,
    this.set,
  );

  factory Sun.fromJson(Map<String, dynamic> json) => _$SunFromJson(json);

  String toString() => "{rise:$rise, set:$set}";

  Map<String, dynamic> tojson() => _$SunToJson(this);
}

@JsonSerializable()
class OSM {
  final String? url;
  @JsonKey(name: 'edit_url')
  final String? editUrl;
  @JsonKey(name: 'note_url')
  final String? noteUrl;

  const OSM(
    this.url,
    this.editUrl,
    this.noteUrl,
  );

  factory OSM.fromJson(Map<String, dynamic> json) => _$OSMFromJson(json);

  String toString() => "{url:$url, edit:$editUrl}";

  Map<String, dynamic> tojson() => _$OSMToJson(this);
}

@JsonSerializable()
class Rate {
  final int limit;
  final int remaining;
  final int reset;

  const Rate(
    this.limit,
    this.remaining,
    this.reset,
  );

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  Map<String, dynamic> tojson() => _$RateToJson(this);
}

@JsonSerializable()
class Licence {
  final String name;
  final String url;

  const Licence(
    this.name,
    this.url,
  );

  factory Licence.fromJson(Map<String, dynamic> json) =>
      _$LicenceFromJson(json);

  String toString() => "{$name:$url}";
  Map<String, dynamic> tojson() => _$LicenceToJson(this);
}

@JsonSerializable()
class Annotations {
  final Currency? currency;
  final String? flag;
  final String? geohash;
  final double? qibla;
  final Sun? sun;
  final Timezone? timezone;
  final What3words? what3words;
  @JsonKey(name: 'Maidenhead')
  final String? maidenhead;
  @JsonKey(name: 'Mercator')
  final Point? mercator;
  @JsonKey(name: 'callingcode')
  final int? callingCode;
  @JsonKey(name: 'DMS')
  final DMS? dms;
  @JsonKey(name: 'MGRS')
  final String? mgrs;
  @JsonKey(name: 'OSM')
  final OSM? osm;

  const Annotations(
    this.dms,
    this.mgrs,
    this.maidenhead,
    this.mercator,
    this.osm,
    this.callingCode,
    this.currency,
    this.flag,
    this.geohash,
    this.qibla,
    this.sun,
    this.timezone,
    this.what3words,
  );

  factory Annotations.fromJson(Map<String, dynamic> json) =>
      _$AnnotationsFromJson(json);
  Map<String, dynamic> tojson() => _$AnnotationsToJson(this);
}

@JsonSerializable()
class DMS {
  @JsonKey(name: 'lat')
  final String latitude;
  @JsonKey(name: 'lng')
  final String longitude;

  const DMS(
    this.latitude,
    this.longitude,
  );

  factory DMS.fromJson(Map<String, dynamic> json) => _$DMSFromJson(json);

  String toString() => "{$latitude,$longitude}";

  Map<String, dynamic> tojson() => _$DMSToJson(this);
}

@JsonSerializable()
class Currency {
  final String name;
  final String symbol;
  @JsonKey(name: 'decimal_mark')
  final String decimalMark;
  @JsonKey(name: 'html_entity')
  final String htmlEntity;
  @JsonKey(name: 'iso_code')
  final String isoCode;
  @JsonKey(name: 'iso_numeric')
  final String isoNumeric;
  @JsonKey(name: 'smallest_denomination')
  final int smallestDenomination;
  final String subunit;
  @JsonKey(name: 'subunit_to_unit')
  final int subunitToUnit;
  @JsonKey(name: 'symbol_first')
  final int symbolFirst;
  @JsonKey(name: 'thousands_separator')
  final String thousandsSeparator;

  const Currency(
    this.name,
    this.decimalMark,
    this.htmlEntity,
    this.isoCode,
    this.isoNumeric,
    this.smallestDenomination,
    this.subunit,
    this.subunitToUnit,
    this.symbol,
    this.symbolFirst,
    this.thousandsSeparator,
  );

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
  Map<String, dynamic> tojson() => _$CurrencyToJson(this);
}

@JsonSerializable()
class Components {
  @JsonKey(name: 'ISO_3166-1_alpha-2')
  final String? ISO_3166_1_alpha_2;
  @JsonKey(name: 'ISO_3166-1_alpha-3')
  final String? ISO_3166_1_alpha_3;
  @JsonKey(name: 'ISO_3166-2')
  final List<String>? ISO_3166_2;
  @JsonKey(name: '_type')
  final String? type;
  @JsonKey(name: '_category')
  final String? category;
  final String? city;
  final String? state;
  final String? country;
  final String? county;
  final String? road;
  final String? suburb;
  final String? continent;
  final String? postcode;
  final String? restaurant;
  @JsonKey(name: 'house_number')
  final String? houseNumber;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'city_district')
  final String? cityDistrict;
  @JsonKey(name: 'state_district')
  final String? stateDistrict;
  @JsonKey(name: 'political_union')
  final String? politicalUnion;

  const Components(
    this.type,
    this.country,
    this.countryCode,
    this.state,
    this.stateDistrict,
    this.county,
    this.city,
    this.cityDistrict,
    this.suburb,
    this.road,
    this.houseNumber,
    this.politicalUnion,
    this.continent,
    this.ISO_3166_1_alpha_2,
    this.ISO_3166_1_alpha_3,
    this.ISO_3166_2,
    this.postcode,
    this.restaurant,
    this.category,
  );

  factory Components.fromJson(Map<String, dynamic> json) =>
      _$ComponentsFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsToJson(this);
}

@JsonSerializable()
class Result {
  final Annotations? annotations;
  final Components components;
  final int confidence;
  final String formatted;
  final Bounds bounds;
  final Coordinates geometry;

  const Result(
    this.annotations,
    this.components,
    this.bounds,
    this.confidence,
    this.formatted,
    this.geometry,
  );

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class GeocoderResponse {
  final List<Licence> licenses;
  final String documentation;
  final Rate? rate;
  final Status status;
  final List<Result> results;
  final String thanks;
  final Timestamp timestamp;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'stay_informed')
  final StayInformed stayInformed;

  const GeocoderResponse(
    this.licenses,
    this.documentation,
    this.rate,
    this.status,
    this.stayInformed,
    this.thanks,
    this.timestamp,
    this.results,
    this.totalResults,
  );

  factory GeocoderResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocoderResponseFromJson(json);
  Map<String, dynamic> tojson() => _$GeocoderResponseToJson(this);
}
