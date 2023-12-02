import 'package:permission_handler/permission_handler.dart';

import 'permission_helper_io.dart' if (dart.library.html) 'permission_helper_web.dart' as impl;
import 'permission_result.dart';

abstract class PermissionHelper {
  final Permission permission;

  PermissionHelper(this.permission);

  static const PermissionHelper notification = impl.PermissionHelperImpl(Permission.notification);
  static const PermissionHelper camera = impl.PermissionHelperImpl(Permission.camera);
  static const PermissionHelper location = impl.PermissionHelperImpl(Permission.location);
  static const PermissionHelper photos = impl.PermissionHelperImpl(Permission.photos);
  static const PermissionHelper storage = impl.PermissionHelperImpl(Permission.storage);
  static const PermissionHelper contacts = impl.PermissionHelperImpl(Permission.contacts);

  Future<PermissionResult> requestPermission();

  Future<PermissionResult> checkPermission();

  Future<ServiceResult> checkService();

  Future<bool> openAppSettings();
}
