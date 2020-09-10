// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'api/dogbin_api.dart';
import 'providers/dogbin_documents_provider.dart';
import 'providers/dogbin_login_provider.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factoryParam<DogbinApi, Dio, String>(
      (dio, baseUrl) => DogbinApi(dio, baseUrl: baseUrl));

  // Eager singletons must be registered in the right order
  gh.singleton<DogbinDocuments>(DogbinDocuments());
  gh.singleton<DogbinLogin>(DogbinLogin());
  return get;
}
