class TextMaterialsModel {
  String? textMaterialKey;
  String? courseKey;
  String? languageKey;
  String? topicKey;
  String? chapterKey;
  String? textMaterialName;
  String? textMaterialDecription;
  String? textMaterialFile;
  String? textMaterialIcon;
  String? textMaterialCreatedAt;
  String? textMaterialUpdatedAt;
  String? textMaterialStatus;
  String? textMaterialFileUrl;

  TextMaterialsModel(
      {this.textMaterialKey,
        this.courseKey,
        this.languageKey,
        this.topicKey,
        this.chapterKey,
        this.textMaterialName,
        this.textMaterialDecription,
        this.textMaterialFile,
        this.textMaterialIcon,
        this.textMaterialCreatedAt,
        this.textMaterialUpdatedAt,
        this.textMaterialStatus,
        this.textMaterialFileUrl});

  TextMaterialsModel.fromJson(Map<String, dynamic> json) {
    textMaterialKey = json['textMaterialKey'];
    courseKey = json['courseKey'];
    languageKey = json['languageKey'];
    topicKey = json['topicKey'];
    chapterKey = json['chapterKey'];
    textMaterialName = json['textMaterialName'];
    textMaterialDecription = json['textMaterialDecription'];
    textMaterialFile = json['textMaterialFile'];
    textMaterialIcon = json['textMaterialIcon'];
    textMaterialCreatedAt = json['textMaterialCreatedAt'];
    textMaterialUpdatedAt = json['textMaterialUpdatedAt'];
    textMaterialStatus = json['textMaterialStatus'];
    textMaterialFileUrl = json['textMaterialFileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['textMaterialKey'] = this.textMaterialKey;
    data['courseKey'] = this.courseKey;
    data['languageKey'] = this.languageKey;
    data['topicKey'] = this.topicKey;
    data['chapterKey'] = this.chapterKey;
    data['textMaterialName'] = this.textMaterialName;
    data['textMaterialDecription'] = this.textMaterialDecription;
    data['textMaterialFile'] = this.textMaterialFile;
    data['textMaterialIcon'] = this.textMaterialIcon;
    data['textMaterialCreatedAt'] = this.textMaterialCreatedAt;
    data['textMaterialUpdatedAt'] = this.textMaterialUpdatedAt;
    data['textMaterialStatus'] = this.textMaterialStatus;
    data['textMaterialFileUrl'] = this.textMaterialFileUrl;
    return data;
  }
}
