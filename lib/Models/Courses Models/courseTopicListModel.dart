class CourseTopicListModel {
  String? topicKey;
  String? courseKey;
  String? languageKey;
  String? topicName;
  String? topicDecription;
  String? topicIcon;
  String? topicLogo;
  String? topicCreatedAt;
  String? topicUpdatedAt;
  String? topicStatus;
  String? categoryKey;
  String? subCategoryKey;
  String? courseName;
  String? courseDescription;
  String? courseFees;
  String? courseValidity;
  String? courseLanguage;
  String? courseThumbnail;
  String? courseCreatedAt;
  String? courseUpdatedAt;
  String? courseStatus;
  String? languageName;
  String? languageDescription;
  String? languageIcon;
  String? languageLogo;
  String? languageCreatedAt;
  String? languageUpdatedAt;
  String? languageStatus;

  CourseTopicListModel(
      {this.topicKey,
        this.courseKey,
        this.languageKey,
        this.topicName,
        this.topicDecription,
        this.topicIcon,
        this.topicLogo,
        this.topicCreatedAt,
        this.topicUpdatedAt,
        this.topicStatus,
        this.categoryKey,
        this.subCategoryKey,
        this.courseName,
        this.courseDescription,
        this.courseFees,
        this.courseValidity,
        this.courseLanguage,
        this.courseThumbnail,
        this.courseCreatedAt,
        this.courseUpdatedAt,
        this.courseStatus,
        this.languageName,
        this.languageDescription,
        this.languageIcon,
        this.languageLogo,
        this.languageCreatedAt,
        this.languageUpdatedAt,
        this.languageStatus});

  CourseTopicListModel.fromJson(Map<String, dynamic> json) {
    topicKey = json['topicKey'];
    courseKey = json['courseKey'];
    languageKey = json['languageKey'];
    topicName = json['topicName'];
    topicDecription = json['topicDecription'];
    topicIcon = json['topicIcon'];
    topicLogo = json['topicLogo'];
    topicCreatedAt = json['topicCreatedAt'];
    topicUpdatedAt = json['topicUpdatedAt'];
    topicStatus = json['topicStatus'];
    categoryKey = json['categoryKey'];
    subCategoryKey = json['subCategoryKey'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    courseFees = json['courseFees'];
    courseValidity = json['courseValidity'];
    courseLanguage = json['courseLanguage'];
    courseThumbnail = json['courseThumbnail'];
    courseCreatedAt = json['courseCreatedAt'];
    courseUpdatedAt = json['courseUpdatedAt'];
    courseStatus = json['courseStatus'];
    languageName = json['languageName'];
    languageDescription = json['languageDescription'];
    languageIcon = json['languageIcon'];
    languageLogo = json['languageLogo'];
    languageCreatedAt = json['languageCreatedAt'];
    languageUpdatedAt = json['languageUpdatedAt'];
    languageStatus = json['languageStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topicKey'] = this.topicKey;
    data['courseKey'] = this.courseKey;
    data['languageKey'] = this.languageKey;
    data['topicName'] = this.topicName;
    data['topicDecription'] = this.topicDecription;
    data['topicIcon'] = this.topicIcon;
    data['topicLogo'] = this.topicLogo;
    data['topicCreatedAt'] = this.topicCreatedAt;
    data['topicUpdatedAt'] = this.topicUpdatedAt;
    data['topicStatus'] = this.topicStatus;
    data['categoryKey'] = this.categoryKey;
    data['subCategoryKey'] = this.subCategoryKey;
    data['courseName'] = this.courseName;
    data['courseDescription'] = this.courseDescription;
    data['courseFees'] = this.courseFees;
    data['courseValidity'] = this.courseValidity;
    data['courseLanguage'] = this.courseLanguage;
    data['courseThumbnail'] = this.courseThumbnail;
    data['courseCreatedAt'] = this.courseCreatedAt;
    data['courseUpdatedAt'] = this.courseUpdatedAt;
    data['courseStatus'] = this.courseStatus;
    data['languageName'] = this.languageName;
    data['languageDescription'] = this.languageDescription;
    data['languageIcon'] = this.languageIcon;
    data['languageLogo'] = this.languageLogo;
    data['languageCreatedAt'] = this.languageCreatedAt;
    data['languageUpdatedAt'] = this.languageUpdatedAt;
    data['languageStatus'] = this.languageStatus;
    return data;
  }
}
