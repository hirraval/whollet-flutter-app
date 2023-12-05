base class IntroImages {
  static String get _basePath => "assets/images/intro/";

  IntroImages();

  static String get firstIntro => "${_basePath}first_intro.svg";

  static String get secondIntro => "${_basePath}second_intro.svg";

  static String get thirdIntro => "${_basePath}third_intro.svg";

  static String get fourthIntro => "${_basePath}fourth_intro.svg";
}

base class AuthImages {
  static String get _basePath => "assets/images/auth/";

  AuthImages();

  static String get loginVector => "${_basePath}login_vector.svg";
}