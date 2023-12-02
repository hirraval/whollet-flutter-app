import 'package:cross_file/cross_file.dart';
import 'package:data/src/model/model.dart';
import 'package:data/src/preference/app_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:mime/mime.dart' as mime;

@lazySingleton
class UserRepository extends BaseRepository {
  final AppPreference preference;

  UserRepository({
    required super.dio,
    required super.cacheService,
    required this.preference,
  });

  final String _pathPrefix = "user/";

  Stream<DataEvent<User>> getProfile() async* {
    var request = ApiRequest<User>(RequestType.get, "${_pathPrefix}profile")
      ..responseParser = (value) => User.fromJson(value);
    yield* processApi(request);
  }

  Stream<DataEvent<User?>> searchUser({required String userEmail}) async* {
    var request = ApiRequest<User?>(RequestType.get, "${_pathPrefix}userData")
      ..queryParams = {"email": userEmail}
      ..responseParser = (value) => value == null ? null : User.fromJson(value);
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> changePassword({required String oldPassword, required String newPassword}) async* {
    var request = ApiRequest<dynamic>(RequestType.post, "${_pathPrefix}password/change")
      ..data = {"oldPassword": oldPassword, "newPassword": newPassword};
    yield* processApi(request);
  }

  Stream<DataEvent<String>> uploadImage({required XFile imageFile}) async* {
    final bytesContent = await imageFile.readAsBytes();
    var multipartFile = MultipartFile.fromBytes(
      bytesContent,
      filename: imageFile.name,
      contentType: MediaType.parse(imageFile.mimeType ?? "image/*"),
    );
    var request = ApiRequest<String>(RequestType.post, "${_pathPrefix}upload/image")
      ..data = FormData.fromMap({"image": multipartFile})
      ..responseParser = (value) => value["image_path"];
    yield* processApi(request);
  }

  Stream<DataEvent<String>> uploadCommonImage({required XFile imageFile}) async* {
    final bytesContent = await imageFile.readAsBytes();
    var mimeType = mime.lookupMimeType(imageFile.path);
    var multipartFile = MultipartFile.fromBytes(
      bytesContent,
      filename: imageFile.name,
      contentType: mimeType == null ? null : MediaType.parse(mimeType),
    );
    var request = ApiRequest<String>(RequestType.post, "common/upload/image")
      ..data = FormData.fromMap({"image": multipartFile})
      ..responseParser = (value) => value["image_path"];
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> authenticateNestService({
    required String authorizationCode,
  }) async* {
    var request = ApiRequest<dynamic>(
      RequestType.post,
      "${_pathPrefix}authenticateNestService",
      data: {"code": authorizationCode},
      responseParser: (responseData) => NestServiceAccessTokenResponse.fromJson(responseData),
    );
    yield* processApi(request);
  }
}
