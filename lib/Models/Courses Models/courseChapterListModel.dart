class CourseChapterListModel {
  String? chapterKey;
  String? courseKey;
  String? languageKey;
  String? topicKey;
  String? chapterName;
  String? chapterDecription;
  String? chapterIcon;
  String? chapterLogo;
  String? chapterCreatedAt;
  String? chapterUpdatedAt;
  String? chapterStatus;
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
  String? topicName;
  String? topicDecription;
  String? topicIcon;
  String? topicLogo;
  String? topicCreatedAt;
  String? topicUpdatedAt;
  String? topicStatus;

  CourseChapterListModel(
      {this.chapterKey,
        this.courseKey,
        this.languageKey,
        this.topicKey,
        this.chapterName,
        this.chapterDecription,
        this.chapterIcon,
        this.chapterLogo,
        this.chapterCreatedAt,
        this.chapterUpdatedAt,
        this.chapterStatus,
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
        this.languageStatus,
        this.topicName,
        this.topicDecription,
        this.topicIcon,
        this.topicLogo,
        this.topicCreatedAt,
        this.topicUpdatedAt,
        this.topicStatus});

  CourseChapterListModel.fromJson(Map<String, dynamic> json) {
    chapterKey = json['chapterKey'];
    courseKey = json['courseKey'];
    languageKey = json['languageKey'];
    topicKey = json['topicKey'];
    chapterName = json['chapterName'];
    chapterDecription = json['chapterDecription'];
    chapterIcon = json['chapterIcon'];
    chapterLogo = json['chapterLogo'];
    chapterCreatedAt = json['chapterCreatedAt'];
    chapterUpdatedAt = json['chapterUpdatedAt'];
    chapterStatus = json['chapterStatus'];
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
    topicName = json['topicName'];
    topicDecription = json['topicDecription'];
    topicIcon = json['topicIcon'];
    topicLogo = json['topicLogo'];
    topicCreatedAt = json['topicCreatedAt'];
    topicUpdatedAt = json['topicUpdatedAt'];
    topicStatus = json['topicStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapterKey'] = this.chapterKey;
    data['courseKey'] = this.courseKey;
    data['languageKey'] = this.languageKey;
    data['topicKey'] = this.topicKey;
    data['chapterName'] = this.chapterName;
    data['chapterDecription'] = this.chapterDecription;
    data['chapterIcon'] = this.chapterIcon;
    data['chapterLogo'] = this.chapterLogo;
    data['chapterCreatedAt'] = this.chapterCreatedAt;
    data['chapterUpdatedAt'] = this.chapterUpdatedAt;
    data['chapterStatus'] = this.chapterStatus;
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
    data['topicName'] = this.topicName;
    data['topicDecription'] = this.topicDecription;
    data['topicIcon'] = this.topicIcon;
    data['topicLogo'] = this.topicLogo;
    data['topicCreatedAt'] = this.topicCreatedAt;
    data['topicUpdatedAt'] = this.topicUpdatedAt;
    data['topicStatus'] = this.topicStatus;
    return data;
  }
}
