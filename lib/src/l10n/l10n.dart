import 'package:flutter/widgets.dart';

import 'generated/l10n.dart';

export 'generated/l10n.dart';

extension LocalizationsExtension on BuildContext {
  WholletLocalization get l10n => WholletLocalization.of(this);
}
