class CourseDetailsSelectionModel {
  Data? data;

  CourseDetailsSelectionModel({this.data});

  CourseDetailsSelectionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? courseKey;
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
  String? categoryName;
  String? categoryDecription;
  String? categoryIcon;
  String? categoryLogo;
  String? categoryCreatedAt;
  String? categoryUpdatedAt;
  String? categoryStatus;
  String? subCategoryName;
  String? subCategoryDecription;
  String? subCategoryIcon;
  String? subCategoryLogo;
  String? subCategoryCreatedAt;
  String? subCategoryUpdatedAt;
  String? subCategoryStatus;
  String? courseThumbnailUrl;
  String? languagesString;
  List<LanguagesArray>? languagesArray;

  Data(
      {this.courseKey,
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
        this.categoryName,
        this.categoryDecription,
        this.categoryIcon,
        this.categoryLogo,
        this.categoryCreatedAt,
        this.categoryUpdatedAt,
        this.categoryStatus,
        this.subCategoryName,
        this.subCategoryDecription,
        this.subCategoryIcon,
        this.subCategoryLogo,
        this.subCategoryCreatedAt,
        this.subCategoryUpdatedAt,
        this.subCategoryStatus,
        this.courseThumbnailUrl,
        this.languagesString,
        this.languagesArray});

  Data.fromJson(Map<String, dynamic> json) {
    courseKey = json['courseKey'];
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
    categoryName = json['categoryName'];
    categoryDecription = json['categoryDecription'];
    categoryIcon = json['categoryIcon'];
    categoryLogo = json['categoryLogo'];
    categoryCreatedAt = json['categoryCreatedAt'];
    categoryUpdatedAt = json['categoryUpdatedAt'];
    categoryStatus = json['categoryStatus'];
    subCategoryName = json['subCategoryName'];
    subCategoryDecription = json['subCategoryDecription'];
    subCategoryIcon = json['subCategoryIcon'];
    subCategoryLogo = json['subCategoryLogo'];
    subCategoryCreatedAt = json['subCategoryCreatedAt'];
    subCategoryUpdatedAt = json['subCategoryUpdatedAt'];
    subCategoryStatus = json['subCategoryStatus'];
    courseThumbnailUrl = json['courseThumbnailUrl'];
    languagesString = json['languagesString'];
    if (json['languagesArray'] != null) {
      languagesArray = <LanguagesArray>[];
      json['languagesArray'].forEach((v) {
        languagesArray!.add(new LanguagesArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseKey'] = this.courseKey;
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
    data['categoryName'] = this.categoryName;
    data['categoryDecription'] = this.categoryDecription;
    data['categoryIcon'] = this.categoryIcon;
    data['categoryLogo'] = this.categoryLogo;
    data['categoryCreatedAt'] = this.categoryCreatedAt;
    data['categoryUpdatedAt'] = this.categoryUpdatedAt;
    data['categoryStatus'] = this.categoryStatus;
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryDecription'] = this.subCategoryDecription;
    data['subCategoryIcon'] = this.subCategoryIcon;
    data['subCategoryLogo'] = this.subCategoryLogo;
    data['subCategoryCreatedAt'] = this.subCategoryCreatedAt;
    data['subCategoryUpdatedAt'] = this.subCategoryUpdatedAt;
    data['subCategoryStatus'] = this.subCategoryStatus;
    data['courseThumbnailUrl'] = this.courseThumbnailUrl;
    data['languagesString'] = this.languagesString;
    if (this.languagesArray != null) {
      data['languagesArray'] =
          this.languagesArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguagesArray {
  String? languageKey;
  String? languageName;
  String? languageIcon;
  String? languageLogo;

  LanguagesArray(
      {this.languageKey,
        this.languageName,
        this.languageIcon,
        this.languageLogo});

  LanguagesArray.fromJson(Map<String, dynamic> json) {
    languageKey = json['languageKey'];
    languageName = json['languageName'];
    languageIcon = json['languageIcon'];
    languageLogo = json['languageLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['languageKey'] = this.languageKey;
    data['languageName'] = this.languageName;
    data['languageIcon'] = this.languageIcon;
    data['languageLogo'] = this.languageLogo;
    return data;
  }
}
