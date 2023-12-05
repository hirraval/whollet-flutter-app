import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
import 'breakpoints.dart';
import 'size.dart';

interface class AppTheme {
  static const defaultFontFamily = "Titillium";

  static const AppColor _appColor = AppColor(
    failure: Color(0xFFE56060),
    onFailure: Color(0xFFFFFFFF),
    success: Color(0xFF65CA8C),
    onSuccess: Color(0xFFFFFFFF),
    pending: Color(0xFFED7A2C),
  );

  static ThemeData get lightTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF347AF0),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFC5D6F1),
      onSecondary: Color(0xFFFFFFFF),
      tertiary: Color(0xFFEDF1F9),
      onTertiary: Color(0xFF000000),
      error: Color(0xFFE56060),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF000000),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF27272B),
      surfaceVariant: Color(0xFFB5BBC9),
      onSurfaceVariant: Color(0xFFCFD2D8),
      surfaceTint: Color(0xFFFFFFFF),
      outline: Color(0xFFD8D8D8),
      shadow: Color(0x336A6A6A),
      primaryContainer: Color(0xFF3D4C63),
      onSecondaryContainer: Color(0xFF9EA5B1),
      onPrimaryContainer: Color(0xFF003282),
    );

    return generateThemeData(colorScheme);
  }

  static ThemeData generateThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorDark: colorScheme.primary,
      primaryColorLight: colorScheme.primary,
      indicatorColor: colorScheme.primary,
      disabledColor: colorScheme.onSurfaceVariant,
      shadowColor: colorScheme.shadow,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
      fontFamily: defaultFontFamily,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        displayMedium: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        displaySmall: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        headlineLarge: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
        headlineMedium: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        headlineSmall: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
        bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
        labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
      ),
      bottomSheetTheme: bottomSheetTheme(colorScheme),
      dialogTheme: dialogTheme(colorScheme),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
        margin: EdgeInsets.zero,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
      ),
      appBarTheme: appBarTheme(colorScheme),
      elevatedButtonTheme: elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: outlinedButtonTheme(colorScheme),
      textButtonTheme: textButtonTheme(colorScheme),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.secondary,
        selectionColor: colorScheme.secondary.withOpacity(0.3),
        selectionHandleColor: colorScheme.secondary,
      ),
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(color: colorScheme.outline, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(colorScheme.primary),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.primary,
        contentTextStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
        actionTextColor: colorScheme.secondary,
        disabledActionTextColor: colorScheme.onSurfaceVariant,
      ),
      tabBarTheme: tabBarTheme(colorScheme),
      dividerTheme: DividerThemeData(color: colorScheme.outline, thickness: 1, space: 1),
      popupMenuTheme: popupMenuTheme(colorScheme),
      bottomAppBarTheme: const BottomAppBarTheme(padding: EdgeInsets.zero, elevation: 8),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
        sizeConstraints: BoxConstraints.tight(const Size(48, 48)),
        elevation: 8,
      ),
      listTileTheme: ListTileThemeData(
        textColor: colorScheme.onSurface,
        selectedTileColor: colorScheme.surfaceVariant,
        horizontalTitleGap: Spacing.normal,
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
      ),
      extensions: const [_appColor],
      scrollbarTheme: const ScrollbarThemeData(
        thickness: MaterialStatePropertyAll(4),
        radius: ShapeRadius.small,
      ),
      sliderTheme: SliderThemeData(
        thumbShape: _SliderThumbShape(
          fillColor: colorScheme.surface,
          strokeColor: colorScheme.primary,
        ),
      ),
    );
  }

  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: ThemeData.estimateBrightnessForColor(colorScheme.surface),
        statusBarIconBrightness: ThemeData.estimateBrightnessForColor(colorScheme.onSurface),
      ),
    );
  }

  static DialogTheme dialogTheme(ColorScheme colorScheme) {
    return DialogTheme(
      shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
      elevation: 8,
      titleTextStyle: TextStyle(fontSize: 16, color: colorScheme.onBackground, fontWeight: FontWeight.w600),
      contentTextStyle: TextStyle(fontSize: 14, color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400),
    );
  }

  static BottomSheetThemeData bottomSheetTheme(ColorScheme colorScheme) {
    return const BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: ShapeRadius.normal)),
      elevation: 4,
      modalElevation: 8,
      clipBehavior: Clip.hardEdge,
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
        padding: const EdgeInsetsDirectional.symmetric(vertical: Spacing.large, horizontal: Spacing.xxLarge),
        minimumSize: const Size(48, 32),
        maximumSize: LayoutConstraints.buttonSize,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.xLarge),
        padding: const EdgeInsetsDirectional.symmetric(vertical: Spacing.medium, horizontal: Spacing.xxLarge),
        side: BorderSide(color: colorScheme.primary),
      ),
    );
  }

  static TextButtonThemeData textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        splashFactory: InkSplash.splashFactory,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      labelStyle: TextStyle(fontWeight: FontWeight.w400,color: colorScheme.surfaceVariant),
      floatingLabelStyle: TextStyle(fontWeight: FontWeight.w400, color: colorScheme.surfaceVariant),
      hintStyle: TextStyle(fontWeight: FontWeight.w400,color: colorScheme.primaryContainer,fontSize: 19),
      errorStyle: const TextStyle(fontWeight: FontWeight.w500),
      errorMaxLines: 3,
      constraints: LayoutConstraints.textField,
      border: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.onSurfaceVariant)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.onSurfaceVariant)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.onSurfaceVariant)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.primary,width: 2)),
      focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.onSurfaceVariant)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.onSurfaceVariant)),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    );
  }

  static TabBarTheme tabBarTheme(ColorScheme colorScheme) {
    return TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(color: colorScheme.surface, borderRadius: ShapeBorderRadius.small),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      labelColor: colorScheme.onSurface,
      unselectedLabelColor: colorScheme.onSurface,
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  static PopupMenuThemeData popupMenuTheme(ColorScheme colorScheme) {
    return PopupMenuThemeData(
      color: colorScheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.small),
      elevation: 4,
      shadowColor: colorScheme.shadow,
      position: PopupMenuPosition.under,
      textStyle: TextStyle(color: colorScheme.onBackground, fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}

class _InputBorder extends OutlineInputBorder {
  const _InputBorder({
    super.borderSide = BorderSide.none,
  });

  @override
  BorderRadius get borderRadius => ShapeBorderRadius.small;

  @override
  bool get isOutline => false;

  @override
  double get gapPadding => 0;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);
  }
}

class _SliderThumbShape extends SliderComponentShape {
  final Color fillColor;
  final Color strokeColor;

  const _SliderThumbShape({
    required this.fillColor,
    required this.strokeColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size.square(16);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    context.canvas.drawCircle(center, 12, fillPaint);
    context.canvas.drawCircle(center, 10, strokePaint);
  }
}
