// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class WholletLocalization {
  WholletLocalization();

  static WholletLocalization? _current;

  static WholletLocalization get current {
    assert(_current != null,
        'No instance of WholletLocalization was loaded. Try to initialize the WholletLocalization delegate before accessing WholletLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<WholletLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = WholletLocalization();
      WholletLocalization._current = instance;

      return instance;
    });
  }

  static WholletLocalization of(BuildContext context) {
    final instance = WholletLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of WholletLocalization present in the widget tree. Did you add WholletLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static WholletLocalization? maybeOf(BuildContext context) {
    return Localizations.of<WholletLocalization>(context, WholletLocalization);
  }

  /// `Whollet`
  String get appName {
    return Intl.message(
      'Whollet',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Oops`
  String get errorTitle {
    return Intl.message(
      'Oops',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Timeout! Please try again.`
  String get timeoutErrorMessage {
    return Intl.message(
      'Timeout! Please try again.',
      name: 'timeoutErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unable to connect to network! Please check your network connection and try again.`
  String get noInternetErrorMessage {
    return Intl.message(
      'Unable to connect to network! Please check your network connection and try again.',
      name: 'noInternetErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `User unauthorized!`
  String get userUnauthorizedErrorTitle {
    return Intl.message(
      'User unauthorized!',
      name: 'userUnauthorizedErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your session has been expired! Please login again to continue using app.`
  String get userUnauthorizedErrorMessage {
    return Intl.message(
      'Your session has been expired! Please login again to continue using app.',
      name: 'userUnauthorizedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! Please try after sometime.`
  String get somethingWentWrongErrorMessage {
    return Intl.message(
      'Something went wrong! Please try after sometime.',
      name: 'somethingWentWrongErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backButtonLabel {
    return Intl.message(
      'Back',
      name: 'backButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'cancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okayButtonLabel {
    return Intl.message(
      'Okay',
      name: 'okayButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveButtonLabel {
    return Intl.message(
      'Save',
      name: 'saveButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButtonLabel {
    return Intl.message(
      'Skip',
      name: 'skipButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Whollet`
  String get firstIntroTitle {
    return Intl.message(
      'Welcome to Whollet',
      name: 'firstIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nice and Tidy Crypto Portfolio!`
  String get secondIntroTitle {
    return Intl.message(
      'Nice and Tidy Crypto Portfolio!',
      name: 'secondIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Receive and Send Money to Friends!`
  String get thirdIntroTitle {
    return Intl.message(
      'Receive and Send Money to Friends!',
      name: 'thirdIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Safety is Our Top Priority`
  String get fourthIntroTitle {
    return Intl.message(
      'Your Safety is Our Top Priority',
      name: 'fourthIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage all your crypto assets! It’s simple and easy!`
  String get firstIntroDescription {
    return Intl.message(
      'Manage all your crypto assets! It’s simple and easy!',
      name: 'firstIntroDescription',
      desc: '',
      args: [],
    );
  }

  /// `Keep BTC, ETH, XRP, and many other ERC-20 based tokens.`
  String get secondIntroDescription {
    return Intl.message(
      'Keep BTC, ETH, XRP, and many other ERC-20 based tokens.',
      name: 'secondIntroDescription',
      desc: '',
      args: [],
    );
  }

  /// `Send crypto to your friends with a personal message attached.`
  String get thirdIntroDescription {
    return Intl.message(
      'Send crypto to your friends with a personal message attached.',
      name: 'thirdIntroDescription',
      desc: '',
      args: [],
    );
  }

  /// `Our top-notch security features will keep you completely safe.`
  String get fourthIntroDescription {
    return Intl.message(
      'Our top-notch security features will keep you completely safe.',
      name: 'fourthIntroDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next Step`
  String get nextStepButtonLabel {
    return Intl.message(
      'Next Step',
      name: 'nextStepButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get letsGetStartedButtonLabel {
    return Intl.message(
      'Let\'s Get Started',
      name: 'letsGetStartedButtonLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<WholletLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<WholletLocalization> load(Locale locale) =>
      WholletLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
