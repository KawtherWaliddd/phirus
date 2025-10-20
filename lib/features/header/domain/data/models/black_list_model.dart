class BlackListModel {
  final String domain;
  final int maliciousVotes;
  final String status;
  final int suspiciousVotes;

  BlackListModel({
    required this.domain,
    required this.maliciousVotes,
    required this.status,
    required this.suspiciousVotes,
  });

  factory BlackListModel.fromJson(Map<String, dynamic> json) {
    return BlackListModel(
      domain: json['domain'],
      maliciousVotes: json['malicious_votes'],
      status: json['status'],
      suspiciousVotes: json['suspicious_votes'],
    );
  }
}
