class VideoStegoResultModel {
  final String result;

  VideoStegoResultModel({required this.result});

  factory VideoStegoResultModel.fromJson(Map<String, dynamic> json) {
    return VideoStegoResultModel(result: json['result']);
  }

  bool get hasHiddenMessage =>
      result.toLowerCase().contains('There is hidden message found in video.');
}
