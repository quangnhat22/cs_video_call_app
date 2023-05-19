// enum in app
enum AppGender {
  male("Male"),
  female("Female"),
  others("Others");

  const AppGender(this.value);

  final String value;
}

//theme in app
enum AppThemeEnum {
  light("Light"),
  dark("Dark"),
  system("System");

  const AppThemeEnum(this.value);

  final String value;
}

//langue in app
enum AppLangEnum {
  en("English"),
  vi("Vietnamese"),
  system("System");

  const AppLangEnum(this.value);

  final String value;
}
