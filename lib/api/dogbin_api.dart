import 'package:dogbin_mobile/models/document.dart';
import 'package:dogbin_mobile/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dogbin_api.g.dart';

@injectable
@RestApi(baseUrl: 'https://del.dog/api/v1')
abstract class DogbinApi {
  @factoryMethod
  factory DogbinApi(@factoryParam Dio dio, {@factoryParam String baseUrl}) =
      _DogbinApi;

  @POST('/auth/login')
  Future<User> logIn(
    @Field('username') String email,
    @Field('password') String password,
    @Field('permissions') List<String> permissions,
    @Field('application') String application,
  );

  @POST('/auth/logout')
  Future<void> logOut(@Field('key') String apiKey);

  @GET('/docs')
  Future<List<Document>> documents(@Header('X-Api-Key') String xApiKey);
}
