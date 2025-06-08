class InspireTenant {
  final String name;
  final String schemaName;
  final String domainUrl;

  InspireTenant({
    required this.name,
    required this.schemaName,
    required this.domainUrl,
  });

  factory InspireTenant.fromJson(Map<String, dynamic> json) {
    return InspireTenant(
      name: json['name'],
      schemaName: json['schema_name'],
      domainUrl: json['domain_url'],
    );
  }
}
