import 'package:core/core.dart';
import 'package:data/data.dart';

class UserState extends LoadingState {
  final User? user;
  final bool isLogin;

  const UserState({
    this.user,
    this.isLogin = false,
    super.isLoading,
  });

  @override
  List<Object?> get props => super.props..addAll([user, isLogin]);

  @override
  UserState copyWith({
    User? user,
    bool? isLogin,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
