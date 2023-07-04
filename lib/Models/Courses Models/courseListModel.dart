class CourseListModel {
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

  CourseListModel(
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
        this.categoryDecription});

  CourseListModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
