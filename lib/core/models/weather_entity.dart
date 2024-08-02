class WeatherEntity {
  WeatherEntity({
    required this.main,
    required this.description,
    required this.icon,
  });

  String main;
  String description;
  String icon;

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      main: json['main'].toString(),
      description: json['description'].toString(),
      icon: json['icon'].toString(),
    );
  }
}
