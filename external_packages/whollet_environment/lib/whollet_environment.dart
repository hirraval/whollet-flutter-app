library whollet_environment;

final class WholletEnvironment {
  const WholletEnvironment._private({
    required this.baseUrl,
    required this.socketUrl,
    String? baseApi,
    String? storageUrl,
    required this.isLogEnabled,
  })  : baseApi = baseApi ?? baseUrl,
        storageUrl = storageUrl ?? baseUrl;

  factory WholletEnvironment.fromArguments() {
    const env = String.fromEnvironment("env", defaultValue: "development");
    switch (env) {
      case "staging":
        return WholletEnvironment.staging;
      case "production":
        return WholletEnvironment.production;
      default:
        return WholletEnvironment.development;
    }
  }

  final String baseUrl;
  final String baseApi;
  final String socketUrl;
  final String storageUrl;
  final bool isLogEnabled;

  final encryption = (
    encryptionKey: "5266556A586E32723575387821412544",
    encryptionIv: "4A404E635166546A",
    decryptionKey: "24432646294A404E635266556A586E32",
    decryptionIv: "3677397A24432646",
  );

  String get imageUrl => "${storageUrl}images/";

  static const development = WholletEnvironment._private(
    baseUrl: "http://192.168.1.6:3000/",
    storageUrl: "http://192.168.1.6:3000/",
    socketUrl: "",
    isLogEnabled: true,
  );

  static const staging = WholletEnvironment._private(
    baseUrl: "https://systems.azsco.com/",
    baseApi: "https://systems.azsco.com/api/",
    // socketUrl: "http://15.185.232.111:4000/",
    socketUrl: "https://a479-136-232-118-126.ngrok-free.app",
    storageUrl: "https://systems.azsco.com/api/uploads/",
    isLogEnabled: true,
  );

  static const production = WholletEnvironment._private(
    baseUrl: "https://systems.azsco.com/",
    baseApi: "https://systems.azsco.com/api/",
    socketUrl: "http://15.185.232.111:4000/",
    storageUrl: "https://systems.azsco.com/api/uploads/",
    isLogEnabled: false,
  );
}
