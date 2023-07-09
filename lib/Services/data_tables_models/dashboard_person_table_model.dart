import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:untitled/Services/data_tables_models/general_model.dart';
part 'dashboard_person_table_model.g.dart';

// final client = Dio(BaseOptions());

@RestApi(baseUrl: "https://api.instantwebtools.net/")
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @GET("/v1/passenger")
  Future<Data> getData(@Query("page") int page, @Query("size") int size);
}

@JsonSerializable()
class Data{
  final int totalPassengers;
  final int totalPages;
  final List<PersonData> data;

  Data(
      {required this.totalPassengers,
        required this.totalPages,
        required this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class PersonData extends GeneralModel {
  final String name;
  final int trips;
  final List<AirlineData> airline;

  PersonData({required this.name, required this.trips, required this.airline});

  factory PersonData.fromJson(Map<String, dynamic> json) =>
      _$PersonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDataToJson(this);

  @override
  List<String> getAllValues() {
    return [name, trips.toString(), airline[0].name];
  }
}

@JsonSerializable()
class AirlineData {
  final String name;
  final String country;

  AirlineData({required this.name, required this.country});

  factory AirlineData.fromJson(Map<String, dynamic> json) =>
      _$AirlineDataFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineDataToJson(this);
}
