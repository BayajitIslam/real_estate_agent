class IntegrationModel {
  final String name;
  final String icon;
  bool isConnected;

  IntegrationModel({
    required this.name,
    required this.icon,
    this.isConnected = false,
  });
}