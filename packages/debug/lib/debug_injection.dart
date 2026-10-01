import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Local access to the shared container initialized by the application.
final getIt = GetIt.instance;

@InjectableInit.microPackage()
void initDebug() {}
