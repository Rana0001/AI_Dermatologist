class Reports {
  String? bodyFace;
  String? category;
  String? date;
  String? descriptions;
  String? reportImgUrl;
  String? diseaseName;

  Reports({
    this.bodyFace,
    this.category,
    this.date,
    this.descriptions,
    this.reportImgUrl,
    this.diseaseName,
  });

  Reports.fromJson(Map<String, dynamic> json) {
    bodyFace = json['body_face'];
    category = json['category'];
    date = json['date'];
    descriptions = json['descriptions'];
    reportImgUrl = json['report_img_url'];
    diseaseName = json['disease_name'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body_face'] = bodyFace;
    data['category'] = category;
    data['date'] = date;
    data['descriptions'] = descriptions;
    data['report_img_url'] = reportImgUrl;
    data['disease_name'] = diseaseName;
    return data;
  }
}
