import 'package:equatable/equatable.dart';

enum AuthType {
  email(2),
  mobile(3);

  final int value;

  const AuthType(this.value);
}

enum TokenPurpose {
  verifyEmail(1),
  verifyMobile(2),
  forgotPassword(3),
  forgotPaymentPin(4);

  final int value;

  const TokenPurpose(this.value);
}

abstract class AuthData extends Equatable {
  final AuthType authType;

  String? get country => null;

  String? get mobileNumber => null;

  String? get email => null;

  const AuthData(this.authType);

  @override
  List<Object?> get props => [country, mobileNumber, email, authType];
}

class MobileAuthData extends AuthData {
  @override
  final String country;
  @override
  final String mobileNumber;

  const MobileAuthData({required this.country, required this.mobileNumber}) : super(AuthType.mobile);
}

class EmailAuthData extends AuthData {
  @override
  final String email;

  const EmailAuthData({required this.email}) : super(AuthType.email);
}
