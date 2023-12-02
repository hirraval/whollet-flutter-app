import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:whollet_flutter_app/app/dependency.dart';

import 'user_state.dart';

export 'user_state.dart';

class UserCubit extends BaseCubit<UserState> with HydratedMixin {
  UserCubit(super.context, super.initialState);

  static UserCubit of(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<UserCubit>(context, listen: listen);
  }

  final DependencyHelper _dependencyHelper = DependencyHelper.getInstance();
  late final AppPreference _preference = _dependencyHelper<AppPreference>();
  // late final UserRepository _userRepository = RepositoryProvider.of<UserRepository>(context);
  // late final AuthRepository _authRepository = RepositoryProvider.of<AuthRepository>(context);

  @override
  void onCreate() {
    super.onCreate();
    if (_preference.isLogin) getProfile();
  }

  void updateUser(User user) {
    _preference.user = user;
    emit(state.copyWith(user: user, isLogin: _preference.isLogin));
    getProfile();
  }

  Future<void> getProfile() async {
    /*return processData<User>(
      _userRepository.getProfile(),
      onLoading: (isLoading) => emit(state.copyWith(isLoading: isLoading)),
      onSuccess: (data) {
        _preference.user = data;
        emit(state.copyWith(user: data));
      },
    ).asFuture();*/
  }

  Future<void> userUnauthorized() async {
    await _clearUserData();
  }

  Future<void> logout() async {
    /*return processData(
      _authRepository.logout(),
      handleLoading: false,
      onSuccess: (data) => _clearUserData(),
    ).asFuture();*/
  }

  Future<void> _clearUserData() async {
    emit(const UserState());
    await _dependencyHelper<CacheService>().clear();
    await Future.wait([
      _preference.clear(),
      HydratedBloc.storage.clear(),
    ]);
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState(
        isLogin: json["is_login"] ?? false,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );
    } catch (error, stackTrace) {
      Log.error(error);
      Log.error(stackTrace);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return {
      "is_login": state.isLogin,
      "user": state.user?.toJson(),
    };
  }
}
