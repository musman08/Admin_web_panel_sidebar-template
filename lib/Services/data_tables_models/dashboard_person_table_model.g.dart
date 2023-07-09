// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_person_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      totalPassengers: json['totalPassengers'] as int,
      totalPages: json['totalPages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => PersonData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'totalPassengers': instance.totalPassengers,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

PersonData _$PersonDataFromJson(Map<String, dynamic> json) => PersonData(
      name: json['name'] as String,
      trips: json['trips'] as int,
      airline: (json['airline'] as List<dynamic>)
          .map((e) => AirlineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonDataToJson(PersonData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'trips': instance.trips,
      'airline': instance.airline,
    };

AirlineData _$AirlineDataFromJson(Map<String, dynamic> json) => AirlineData(
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AirlineDataToJson(AirlineData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DashboardApiService implements DashboardApiService {
  _DashboardApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.instantwebtools.net/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Data> getData(
    int page,
    int size,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'size': size,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Data>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/passenger',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Data.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
