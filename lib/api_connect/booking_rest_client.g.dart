// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BookRestApi implements BookRestApi {
  _BookRestApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:2434';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<BookingModel>>> getAllBooking() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<BookingModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/orders/lists',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => BookingModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
