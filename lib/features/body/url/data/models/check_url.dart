class UrlModel {
  final int prediction;
  final UrlInfo urlInfo;
  final VirusTotalResult virustotalResult;

  UrlModel({
    required this.prediction,
    required this.urlInfo,
    required this.virustotalResult,
  });

  factory UrlModel.fromJson(Map<String, dynamic> json) {
    return UrlModel(
      prediction: json['prediction'],
      urlInfo: UrlInfo.fromJson(json['url_info']),
      virustotalResult:
          VirusTotalResult.fromJson(json['virustotal_result']['data']),
    );
  }
}

class UrlInfo {
  final String domain;
  final String path;
  final String port;
  final String query;
  final String scheme;

  UrlInfo({
    required this.domain,
    required this.path,
    required this.port,
    required this.query,
    required this.scheme,
  });

  factory UrlInfo.fromJson(Map<String, dynamic> json) {
    return UrlInfo(
      domain: json['Domain'],
      path: json['Path'],
      port: json['Port'],
      query: json['Query'],
      scheme: json['Scheme'],
    );
  }
}

class VirusTotalResult {
  final Attributes attributes;

  VirusTotalResult({required this.attributes});

  factory VirusTotalResult.fromJson(Map<String, dynamic> json) {
    return VirusTotalResult(
      attributes: Attributes.fromJson(json['attributes']),
    );
  }
}

class Attributes {
  final Map<String, String> categories;
  final List<CrowdsourcedContext> crowdsourcedContext;
  final int harmless;
  final int malicious;
  final int suspicious;
  final int undetected;
  final String lastFinalUrl;
  final int lastHttpResponseCode;
  final int reputation;
  final String title;
  final int timesSubmitted;
  final Map<String, int> totalVotes;

  Attributes({
    required this.categories,
    required this.crowdsourcedContext,
    required this.harmless,
    required this.malicious,
    required this.suspicious,
    required this.undetected,
    required this.lastFinalUrl,
    required this.lastHttpResponseCode,
    required this.reputation,
    required this.title,
    required this.timesSubmitted,
    required this.totalVotes,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      categories: Map<String, String>.from(json['categories']),
      crowdsourcedContext: (json['crowdsourced_context'] as List?)
              ?.map((e) => CrowdsourcedContext.fromJson(e))
              .toList() ??
          [],
      harmless: json['last_analysis_stats']['harmless'],
      malicious: json['last_analysis_stats']['malicious'],
      suspicious: json['last_analysis_stats']['suspicious'],
      undetected: json['last_analysis_stats']['undetected'],
      lastFinalUrl: json['last_final_url'],
      lastHttpResponseCode: json['last_http_response_code'],
      reputation: json['reputation'],
      title: json['title'],
      timesSubmitted: json['times_submitted'],
      totalVotes: Map<String, int>.from(json['total_votes']),
    );
  }
}

class CrowdsourcedContext {
  final String details;
  final String severity;
  final String source;
  final int timestamp;
  final String title;

  CrowdsourcedContext({
    required this.details,
    required this.severity,
    required this.source,
    required this.timestamp,
    required this.title,
  });

  factory CrowdsourcedContext.fromJson(Map<String, dynamic> json) {
    return CrowdsourcedContext(
      details: json['details'],
      severity: json['severity'],
      source: json['source'],
      timestamp: json['timestamp'],
      title: json['title'],
    );
  }
}
