class CommonResponse {
  int? status;
  dynamic data;
  dynamic? message;
  dynamic? error;
  dynamic meta;
  String? info;

  CommonResponse(
      {this.status, this.data, this.message, this.error, this.meta, this.info});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    error = json['error'];
    meta = json['meta'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    data['error'] = this.error;
    data['meta'] = this.meta;
    data['info'] = this.info;
    return data;
  }
}
