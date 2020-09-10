// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogbin_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DogbinApi implements DogbinApi {
  _DogbinApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://del.dog/api/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  logIn(email, password, permissions, application) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(permissions, 'permissions');
    ArgumentError.checkNotNull(application, 'application');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'username': email,
      'password': password,
      'permissions': permissions,
      'application': application
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/auth/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  logOut(apiKey) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'key': apiKey};
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/auth/logout',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  documents(xApiKey) async {
    ArgumentError.checkNotNull(xApiKey, 'xApiKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/docs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'X-Api-Key': xApiKey},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Document.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
