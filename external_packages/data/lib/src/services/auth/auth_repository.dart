import 'dart:io';

import 'package:data/src/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

@lazySingleton
class AuthRepository extends BaseRepository {
  AuthRepository({required super.dio});

  final String _pathPrefix = "user/";

  int get currentDeviceType {
    if (kIsWeb) return 3;
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    } else {
      throw UnsupportedError("Unsupported DeviceType");
    }
  }

  Stream<DataEvent<String>> register({
    required String email,
    required String fullName,
    required String countryCode,
    required String mobile,
    required String password,
    required String securityQuestion,
    String? customQuestion,
    required String answer,
    String? deviceToken,
  }) async* {
    final request = ApiRequest<String>(RequestType.post, "${_pathPrefix}register/mobile")
      ..data = {
        "email": email,
        "fullName": fullName,
        "countryCode": countryCode,
        "mobile": mobile,
        "device": currentDeviceType,
        "password": password,
        "repeatPassword": password,
        "securityQuestion": securityQuestion,
        if (customQuestion != null) "yourQuestion": customQuestion,
        "answer": answer,
        if (deviceToken != null) "pushToken": deviceToken,
      }
      ..responseParser = (value) => value["registrationToken"];
    yield* processApi(request);
  }

  Stream<DataEvent<String>> resendRegisterOtp({
    required String registrationToken,
    required TokenPurpose purpose,
  }) async* {
    final request = ApiRequest<String>(RequestType.post, "${_pathPrefix}otp/resend/registration")
      ..data = {
        "registrationToken": registrationToken,
        "purpose": purpose.value,
      }
      ..responseParser = (value) => value["registrationToken"];
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> verifyRegisterOtp({
    required String registrationToken,
    required String emailOtp,
    required String mobileOtp,
  }) async* {
    final request = ApiRequest<dynamic>(RequestType.post, "${_pathPrefix}otp/verify/registration")
      ..data = {
        "registrationToken": registrationToken,
        "emailOtp": emailOtp,
        "mobileOtp": mobileOtp,
      };
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> forgetPassword({required AuthData authData}) async* {
    final request = ApiRequest<dynamic>(RequestType.post, "${_pathPrefix}password/forgot/otp")
      ..data = {
        if (authData.authType == AuthType.email) "email": authData.email,
        if (authData.authType == AuthType.mobile) ...{
          "mobile": authData.mobileNumber,
          "countryCode": authData.country,
        }
      };
    yield* processApi(request);
  }

  Stream<DataEvent<String>> verifyForgetPasswordOtp({
    required AuthData authData,
    required String otp,
  }) async* {
    final request = ApiRequest<String>(RequestType.post, "${_pathPrefix}password/forgot/verify")
      ..data = {
        if (authData.authType == AuthType.email) ...{
          "email": authData.email,
          "emailOtp": otp,
        },
        if (authData.authType == AuthType.mobile) ...{
          "mobile": authData.mobileNumber,
          "countryCode": authData.country,
          "mobileOtp": otp,
        },
      }
      ..responseParser = (value) => value["token"].toString();
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> resetPassword({
    required String password,
    required String token,
  }) async* {
    final request = ApiRequest<dynamic>(RequestType.post, "${_pathPrefix}password/forgot/set")
      ..data = {
        "token": token,
        "password": password,
      };
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> logout() async* {
    final request = ApiRequest(RequestType.put, "${_pathPrefix}logout");
    yield* processApi(request);
  }
}
