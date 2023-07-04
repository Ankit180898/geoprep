class VideoMaterialsModel {
  String? videoMaterialKey;
  String? courseKey;
  String? languageKey;
  String? topicKey;
  String? chapterKey;
  String? videoMaterialName;
  String? videoMaterialDecription;
  String? videoMaterialFile;
  String? videoMaterialIcon;
  String? videoMaterialCreatedAt;
  String? videoMaterialUpdatedAt;
  String? videoMaterialStatus;
  String? videoMaterialFileUrl;

  VideoMaterialsModel(
      {this.videoMaterialKey,
        this.courseKey,
        this.languageKey,
        this.topicKey,
        this.chapterKey,
        this.videoMaterialName,
        this.videoMaterialDecription,
        this.videoMaterialFile,
        this.videoMaterialIcon,
        this.videoMaterialCreatedAt,
        this.videoMaterialUpdatedAt,
        this.videoMaterialStatus,
        this.videoMaterialFileUrl});

  VideoMaterialsModel.fromJson(Map<String, dynamic> json) {
    videoMaterialKey = json['videoMaterialKey'];
    courseKey = json['courseKey'];
    languageKey = json['languageKey'];
    topicKey = json['topicKey'];
    chapterKey = json['chapterKey'];
    videoMaterialName = json['videoMaterialName'];
    videoMaterialDecription = json['videoMaterialDecription'];
    videoMaterialFile = json['videoMaterialFile'];
    videoMaterialIcon = json['videoMaterialIcon'];
    videoMaterialCreatedAt = json['videoMaterialCreatedAt'];
    videoMaterialUpdatedAt = json['videoMaterialUpdatedAt'];
    videoMaterialStatus = json['videoMaterialStatus'];
    videoMaterialFileUrl = json['videoMaterialFileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoMaterialKey'] = this.videoMaterialKey;
    data['courseKey'] = this.courseKey;
    data['languageKey'] = this.languageKey;
    data['topicKey'] = this.topicKey;
    data['chapterKey'] = this.chapterKey;
    data['videoMaterialName'] = this.videoMaterialName;
    data['videoMaterialDecription'] = this.videoMaterialDecription;
    data['videoMaterialFile'] = this.videoMaterialFile;
    data['videoMaterialIcon'] = this.videoMaterialIcon;
    data['videoMaterialCreatedAt'] = this.videoMaterialCreatedAt;
    data['videoMaterialUpdatedAt'] = this.videoMaterialUpdatedAt;
    data['videoMaterialStatus'] = this.videoMaterialStatus;
    data['videoMaterialFileUrl'] = this.videoMaterialFileUrl;
    return data;
  }
}
