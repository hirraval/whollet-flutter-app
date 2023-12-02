import 'package:data/src/preference/app_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PreferenceModule {
  @singleton
  @preResolve
  Future<AppPreference> providesAppPreference() => SharedPreferences.getInstance().then(AppPreference.new);
}
