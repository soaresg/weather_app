class WindEntity {
  WindEntity({
    required this.speed,
    required this.degress,
  });

  double speed;
  double degress;

  factory WindEntity.fromJson(Map<String, dynamic> json) {
    return WindEntity(
      speed: json['speed'].toDouble(),
      degress: json['deg'].toDouble(),
    );
  }
}
