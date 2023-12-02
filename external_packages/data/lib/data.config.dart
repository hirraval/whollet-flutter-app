// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:az_security_environment/az_security_environment.dart' as _i6;
import 'package:data/socket/socket.dart' as _i11;
import 'package:data/src/module/network_module.dart' as _i21;
import 'package:data/src/module/preference_module.dart' as _i20;
import 'package:data/src/preference/app_preference.dart' as _i3;
import 'package:data/src/services/ajax/ajax_camera_repository.dart' as _i12;
import 'package:data/src/services/ajax/ajax_device_repository.dart' as _i13;
import 'package:data/src/services/ajax/ajax_group_repository.dart' as _i14;
import 'package:data/src/services/ajax/ajax_hub_repository.dart' as _i15;
import 'package:data/src/services/ajax/ajax_room_repository.dart' as _i16;
import 'package:data/src/services/ajax/ajax_user_repository.dart' as _i17;
import 'package:data/src/services/auth/auth_repository.dart' as _i18;
import 'package:data/src/services/common/common_repository.dart' as _i19;
import 'package:data/src/services/google/google_sdm_repository.dart' as _i7;
import 'package:data/src/services/setting/setting_repository.dart' as _i8;
import 'package:data/src/services/tracking/tracking_repository.dart' as _i9;
import 'package:data/src/services/user/user_repository.dart' as _i10;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:network/network.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> $initializeDataLayer({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final preferenceModule = _$PreferenceModule();
    final networkModule = _$NetworkModule();
    await gh.singletonAsync<_i3.AppPreference>(
      () => preferenceModule.providesAppPreference(),
      preResolve: true,
    );
    await gh.singletonAsync<_i4.CacheService>(
      () => networkModule.providesCacheService(),
      preResolve: true,
    );
    gh.singleton<_i5.Dio>(networkModule.providesDioInstance(
      preference: gh<_i3.AppPreference>(),
      environment: gh<_i6.AzscoAppEnvironment>(),
    ));
    gh.singleton<_i5.Dio>(
      networkModule.providesAjaxDioInstance(
        preference: gh<_i3.AppPreference>(),
        environment: gh<_i6.AzscoAppEnvironment>(),
      ),
      instanceName: 'ajax_dio',
    );
    gh.lazySingleton<_i5.Dio>(
      () => networkModule.providesGoogleSdmDioInstance(
        environment: gh<_i6.AzscoAppEnvironment>(),
        preference: gh<_i3.AppPreference>(),
        dio: gh<_i5.Dio>(),
      ),
      instanceName: 'google_sdm_dio',
    );
    gh.lazySingleton<_i7.GoogleSdmRepository>(() => _i7.GoogleSdmRepository(
          dio: gh<_i5.Dio>(instanceName: 'google_sdm_dio'),
          cacheService: gh<_i4.CacheService>(),
        ));
    gh.lazySingleton<_i8.SettingRepository>(
        () => _i8.SettingRepository(dio: gh<_i5.Dio>()));
    gh.lazySingleton<_i9.TrackingRepository>(
        () => _i9.TrackingRepository(dio: gh<_i5.Dio>()));
    gh.lazySingleton<_i10.UserRepository>(() => _i10.UserRepository(
          dio: gh<_i5.Dio>(),
          cacheService: gh<_i4.CacheService>(),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.singleton<_i11.WebSocket>(networkModule.getSocketInstance(
        environment: gh<_i6.AzscoAppEnvironment>()));
    gh.lazySingleton<_i12.AjaxCameraRepository>(() => _i12.AjaxCameraRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i13.AjaxDeviceRepository>(() => _i13.AjaxDeviceRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i14.AjaxGroupRepository>(() => _i14.AjaxGroupRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i15.AjaxHubRepository>(() => _i15.AjaxHubRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i16.AjaxRoomRepository>(() => _i16.AjaxRoomRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i17.AjaxUserRepository>(() => _i17.AjaxUserRepository(
          dio: gh<_i5.Dio>(instanceName: 'ajax_dio'),
          preference: gh<_i3.AppPreference>(),
        ));
    gh.lazySingleton<_i18.AuthRepository>(
        () => _i18.AuthRepository(dio: gh<_i5.Dio>()));
    gh.lazySingleton<_i19.CommonRepository>(() => _i19.CommonRepository(
          dio: gh<_i5.Dio>(),
          cacheService: gh<_i4.CacheService>(),
        ));
    return this;
  }
}

class _$PreferenceModule extends _i20.PreferenceModule {}

class _$NetworkModule extends _i21.NetworkModule {}
