class SubCategoryModel {
  String? subCategoryKey;
  String? categoryKey;
  String? subCategoryName;
  String? subCategoryDecription;
  String? subCategoryIcon;
  String? subCategoryLogo;
  String? subCategoryCreatedAt;
  String? subCategoryUpdatedAt;
  String? subCategoryStatus;
  String? categoryName;
  String? categoryDecription;
  String? categoryIcon;
  String? categoryLogo;
  String? categoryCreatedAt;
  String? categoryUpdatedAt;
  String? categoryStatus;
  String? subCategoryLogoUrl;

  SubCategoryModel(
      {this.subCategoryKey,
        this.categoryKey,
        this.subCategoryName,
        this.subCategoryDecription,
        this.subCategoryIcon,
        this.subCategoryLogo,
        this.subCategoryCreatedAt,
        this.subCategoryUpdatedAt,
        this.subCategoryStatus,
        this.categoryName,
        this.categoryDecription,
        this.categoryIcon,
        this.categoryLogo,
        this.categoryCreatedAt,
        this.categoryUpdatedAt,
        this.categoryStatus,
        this.subCategoryLogoUrl});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryKey = json['subCategoryKey'];
    categoryKey = json['categoryKey'];
    subCategoryName = json['subCategoryName'];
    subCategoryDecription = json['subCategoryDecription'];
    subCategoryIcon = json['subCategoryIcon'];
    subCategoryLogo = json['subCategoryLogo'];
    subCategoryCreatedAt = json['subCategoryCreatedAt'];
    subCategoryUpdatedAt = json['subCategoryUpdatedAt'];
    subCategoryStatus = json['subCategoryStatus'];
    categoryName = json['categoryName'];
    categoryDecription = json['categoryDecription'];
    categoryIcon = json['categoryIcon'];
    categoryLogo = json['categoryLogo'];
    categoryCreatedAt = json['categoryCreatedAt'];
    categoryUpdatedAt = json['categoryUpdatedAt'];
    categoryStatus = json['categoryStatus'];
    subCategoryLogoUrl = json['subCategoryLogoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoryKey'] = this.subCategoryKey;
    data['categoryKey'] = this.categoryKey;
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryDecription'] = this.subCategoryDecription;
    data['subCategoryIcon'] = this.subCategoryIcon;
    data['subCategoryLogo'] = this.subCategoryLogo;
    data['subCategoryCreatedAt'] = this.subCategoryCreatedAt;
    data['subCategoryUpdatedAt'] = this.subCategoryUpdatedAt;
    data['subCategoryStatus'] = this.subCategoryStatus;
    data['categoryName'] = this.categoryName;
    data['categoryDecription'] = this.categoryDecription;
    data['categoryIcon'] = this.categoryIcon;
    data['categoryLogo'] = this.categoryLogo;
    data['categoryCreatedAt'] = this.categoryCreatedAt;
    data['categoryUpdatedAt'] = this.categoryUpdatedAt;
    data['categoryStatus'] = this.categoryStatus;
    data['subCategoryLogoUrl'] = this.subCategoryLogoUrl;
    return data;
  }
}
