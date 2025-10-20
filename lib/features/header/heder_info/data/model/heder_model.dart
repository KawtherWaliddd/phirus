class HederModel {
  final String date;
  final String from;
  final String messageId;
  final String replyTo;
  final String subject;
  final String to;

  HederModel(
      {required this.date,
      required this.from,
      required this.messageId,
      required this.replyTo,
      required this.subject,
      required this.to});

  factory HederModel.fromJson(Map<String, dynamic> json) {
    return HederModel(
        date: json['date'],
        from: json['from'],
        messageId: json['message_id'],
        replyTo: json['reply_to'],
        subject: json['subject'],
        to: json['to']);
  }
}
