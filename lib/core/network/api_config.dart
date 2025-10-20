class ApiConfig {
  static const String baseUrl =
      "https://tester-production-caf8.up.railway.app/";
  static const Duration timeOut = Duration(seconds: 50);

//Endpoints

  // Domain Checks
  static const String whios = "whoise";
  static const String ssltls = "ssltls";
  static const String spfdmarc = "spfdmarc";
  static const String blacklist = "blacklist";

  // URL and Email Checks
  static const String urlcheck = "urlcheck";
  static const String analyzeEmail = "analyze_email";
  static const String checkattach = "checkattach";
  static const String header = "header";

  // Steganography
  static const String stegnographyImage = "stegnography";
  static const String stegnographyVideo = "sstegno";
}
