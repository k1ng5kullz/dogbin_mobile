import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dogbin_mobile/service_locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void locateServices() => $initGetIt(locator);