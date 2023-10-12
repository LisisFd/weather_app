class WeatherGroup {
  final int groupNum;
  final int groupEndNum;
  final String imageUrl;

  const WeatherGroup({
    required this.groupNum,
    required this.imageUrl,
    this.groupEndNum = 99,
  });
}
