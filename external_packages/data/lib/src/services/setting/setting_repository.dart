import 'package:cross_file/cross_file.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;

@lazySingleton
class SettingRepository extends BaseRepository {
  SettingRepository({required super.dio});

  Stream<DataEvent<List<TechnicalGuides>>> getTechnicalGuidesList() async* {
    final request = ApiRequest<List<TechnicalGuides>>(RequestType.get, "common/listTechnicalGuides")
      ..responseParser = (value) => (value as List).map((e) => TechnicalGuides.fromJson(e)).toList();
    yield* processApi(request);
  }

  Stream<DataEvent<List<MaintenanceNewRequestModel>>> getMaintenanceRequestList() async* {
    final request = ApiRequest<List<MaintenanceNewRequestModel>>(RequestType.get, "user/listMaintenanceRequest")
      ..responseParser = (value) => (value as List).map((e) => MaintenanceNewRequestModel.fromJson(e)).toList();
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> sendMaintenanceRequest({
    required String location,
    required String date,
    required String time,
    required String message,
    required int currentStatus,
    List<String>? attachments,
  }) async* {
    final request = ApiRequest<dynamic>(RequestType.post, "user/sendMaintenanceRequest")
      ..data = {
        "location": location,
        "date": date,
        "time": time,
        "message": message,
        "currentStatus": currentStatus,
        if (attachments != null) "attachments": attachments,
      };
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> updateMaintenanceRequest({
    required String requestId,
    required String date,
    required String time,
  }) async* {
    final request = ApiRequest<dynamic>(RequestType.put, "user/editMaintenanceRequest")
      ..data = {
        "date": date,
        "time": time,
        "requestId": requestId,
      };
    yield* processApi(request);
  }

  Stream<DataEvent<dynamic>> cancelMaintenanceRequest({
    required String requestId,
  }) async* {
    final request = ApiRequest<dynamic>(RequestType.post, "user/cancelRequest")
      ..data = {
        "requestId": requestId,
      };
    yield* processApi(request);
  }

  Stream<DataEvent<MultipleImageVideoResponse>> uploadMultipleImageVideo({required List<XFile> imageFileList}) async* {
    List<MultipartFile> imagePart = [];

    for (var imageFile in imageFileList) {
      final bytesContent = await imageFile.readAsBytes();
      var mimeType = mime.lookupMimeType(imageFile.path);
      var multipartFile = MultipartFile.fromBytes(
        bytesContent,
        filename:imageFile.name,
        contentType: mimeType == null ? null : MediaType.parse(mimeType),
      );
      imagePart.add(multipartFile);
    }

    var request = ApiRequest<MultipleImageVideoResponse>(RequestType.post, "common/upload/media")
      ..data = FormData.fromMap({"images": imagePart})
      ..responseParser = (value) => MultipleImageVideoResponse.fromJson(value);
    yield* processApi(request);
  }
}
