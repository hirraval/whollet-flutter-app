import 'dart:convert';

import 'package:hive/hive.dart';

import 'camera_activity_model.dart';

class CameraActivityDatabase {
  late final LazyBox<List<String>> _box;

  Future<void> init() async {
    _box = await Hive.openLazyBox("camera_activity_db");
  }

  Future<List<CameraActivity>> getActivities(String id) async {
    final data = await _box.get(id);
    return data?.map((element) => CameraActivity.fromJson(jsonDecode(element))).toList() ?? [];
  }

  void saveActivities(String id, List<CameraActivity> activities) {
    _box.put(id, activities.map((e) => jsonEncode(e.toJson())).toList());
  }
}
