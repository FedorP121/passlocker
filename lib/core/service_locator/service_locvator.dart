import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/core/service_locator/service_locvator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

// flutter packages pub run build_runner build
