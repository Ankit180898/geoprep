class CategoryModel {
  String? categoryKey;
  String? categoryName;
  String? categoryDecription;
  String? categoryIcon;
  String? categoryLogo;
  String? categoryCreatedAt;
  String? categoryUpdatedAt;
  String? categoryStatus;
  String? categoryLogoUrl;

  CategoryModel(
      {this.categoryKey,
        this.categoryName,
        this.categoryDecription,
        this.categoryIcon,
        this.categoryLogo,
        this.categoryCreatedAt,
        this.categoryUpdatedAt,
        this.categoryStatus,
        this.categoryLogoUrl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryKey = json['categoryKey'];
    categoryName = json['categoryName'];
    categoryDecription = json['categoryDecription'];
    categoryIcon = json['categoryIcon'];
    categoryLogo = json['categoryLogo'];
    categoryCreatedAt = json['categoryCreatedAt'];
    categoryUpdatedAt = json['categoryUpdatedAt'];
    categoryStatus = json['categoryStatus'];
    categoryLogoUrl = json['categoryLogoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryKey'] = this.categoryKey;
    data['categoryName'] = this.categoryName;
    data['categoryDecription'] = this.categoryDecription;
    data['categoryIcon'] = this.categoryIcon;
    data['categoryLogo'] = this.categoryLogo;
    data['categoryCreatedAt'] = this.categoryCreatedAt;
    data['categoryUpdatedAt'] = this.categoryUpdatedAt;
    data['categoryStatus'] = this.categoryStatus;
    data['categoryLogoUrl'] = this.categoryLogoUrl;
    return data;
  }
}
