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

// period in creating schedule
enum PeriodEnum {
  start("Start"),
  end("End");

  const PeriodEnum(this.value);

  final String value;
}

//relation with other user
enum AppFriendRelation {
  self("self"),
  friend("friend"),
  received("received"),
  sent("sent"),
  blocked("blocked"),
  non("non");

  const AppFriendRelation(this.value);

  final String value;
}
