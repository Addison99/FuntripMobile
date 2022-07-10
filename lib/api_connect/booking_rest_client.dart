import 'package:dio/dio.dart';
import 'package:fun_trip_v2/model/booking_model.dart';
import 'package:retrofit/retrofit.dart';
part 'booking_rest_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:2434')
abstract class BookRestApi {
  factory BookRestApi(Dio dio, {String baseUrl}) = _BookRestApi;

  @GET('/api/orders/lists')
  Future<HttpResponse<List<BookingModel>>> getAllBooking();
}
