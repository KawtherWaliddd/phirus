class ImageStegoRawModel {
  final bool hidden;
  final String? message;

  ImageStegoRawModel({
    required this.hidden,
    required this.message,
  });

  factory ImageStegoRawModel.fromJson(Map<String, dynamic> json) {
    return ImageStegoRawModel(
      hidden: json['hidden'],
      message: json['message'],
    );
  }
}
