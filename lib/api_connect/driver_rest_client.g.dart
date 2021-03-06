// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DriverRestApi implements DriverRestApi {
  _DriverRestApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:2434/api/drivers';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<void>> createDriver(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final httpResponse = HttpResponse(null, _result);
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
