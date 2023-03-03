class DiseaseResponse {
  String? message;
  String? label;
  String? filename;

  DiseaseResponse({
    this.message,
    this.label,
    this.filename,
  });

  factory DiseaseResponse.fromJson(Map<String, dynamic> json) {
    return DiseaseResponse(
      message: json['message'],
      label: json['label'],
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'label': label,
      'filename': filename,
    };
  }
}
