class DmarkModel {
  final String comment;
  final String status;

  DmarkModel({required this.comment, required this.status});
  factory DmarkModel.fromJson(Map<String, dynamic> json) {
    return DmarkModel(comment: json['comment'], status: json['status']);
  }
}
