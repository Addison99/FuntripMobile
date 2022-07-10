import 'package:dio/dio.dart';
import 'package:fun_trip_v2/model/driver_model.dart';
import 'package:fun_trip_v2/model/user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'driver_rest_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:2434/api/drivers')
abstract class DriverRestApi {
  factory DriverRestApi(Dio dio, {String baseUrl}) = _DriverRestApi;

  @POST('')
  Future<HttpResponse<void>> createDriver(@Body() UserModel user);
}
