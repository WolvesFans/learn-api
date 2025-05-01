class WeatherModel {
  final String city;
  final double temperature;
  final double feelsLike;
  final String description;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
