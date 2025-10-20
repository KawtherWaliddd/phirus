class AttachmentModel {
  final String fileId;
  final int malicious;
  final int undetected;

  AttachmentModel({
    required this.fileId,
    required this.malicious,
    required this.undetected,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(
      fileId: json['file_id'],
      malicious: json['malicious'],
      undetected: json['undetected'],
    );
  }
}
