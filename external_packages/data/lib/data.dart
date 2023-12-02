library data;

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:whollet_environment/whollet_environment.dart';

import 'data.config.dart';

export 'package:network/network.dart';

export 'socket/socket.dart';
export 'src/model/model.dart';
export 'src/preference/app_preference.dart';
export 'src/services/services.dart';

@InjectableInit(
  initializerName: r'$initializeDataLayer',
  ignoreUnregisteredTypes: [WholletEnvironment],
  asExtension: true,
)
FutureOr<GetIt> initializeDataLayer(GetIt getInstance) => getInstance.$initializeDataLayer();
