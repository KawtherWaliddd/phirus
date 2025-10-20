class SpfModel {
  final String comment;
  final String status;

  SpfModel({required this.comment, required this.status});
  factory SpfModel.fromJson(Map<String, dynamic> json) {
    return SpfModel(comment: json['comment'], status: json['status']);
  }
}
