// enum in app
enum AppGender {
  male("Male"),
  female("Female"),
  others("Other");

  const AppGender(this.value);

  static AppGender checkGenderEnum(String? value) {
    if (value == AppGender.male.value.toLowerCase() ||
        value == AppGender.male.value) {
      return AppGender.male;
    } else if (value == AppGender.female.value.toLowerCase() ||
        value == AppGender.female.value) {
      return AppGender.female;
    } else {
      return AppGender.others;
    }
  }

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

enum AppMeetingStatus {
  onGoing("on-going"),
  ended("ended");

  const AppMeetingStatus(this.value);

  final String value;
}

enum AppCallStatus {
  ended("Ended"),
  onGoing("On-going"),
  missed("Missed"),
  reject("Reject");

  const AppCallStatus(this.value);

  final String value;
}

enum AppGroupFormMode { create, edit }
