import '../domain.dart';

final class WeatherGroups {
  const WeatherGroups._();
  static WeatherGroup get _defVal => const WeatherGroup(
        groupNum: 800,
        groupEndNum: 0,
        imageUrl: 'assets/images/sunny.png',
      );
  static WeatherGroup getGroupById(int groupId) {
    int minGroup = _list.first.groupNum;
    int maxGroup = _list.last.groupNum + _list.last.groupEndNum;
    try {
      if (groupId < minGroup || groupId > maxGroup) {
        throw Exception('Weather Group Exception');
      }
      WeatherGroup weatherGroup = _list.firstWhere((g) =>
          groupId >= g.groupNum && groupId <= g.groupNum + g.groupEndNum);
      return weatherGroup;
    } catch (e) {
      return _defVal;
    }
  }

  static const List<WeatherGroup> _list = [
    WeatherGroup(
      groupNum: 200,
      imageUrl: 'assets/images/thunder.png',
    ),
    WeatherGroup(
      groupNum: 300,
      imageUrl: 'assets/images/rainy.png',
    ),
    WeatherGroup(
      groupNum: 500,
      imageUrl: 'assets/images/rain.png',
    ),
    WeatherGroup(
      groupNum: 600,
      imageUrl: 'assets/images/snow.png',
    ),
    WeatherGroup(
      groupNum: 800,
      groupEndNum: 0,
      imageUrl: 'assets/images/sunny.png',
    ),
    WeatherGroup(
        groupNum: 801,
        groupEndNum: 1,
        imageUrl: 'assets/images/sunny_cloud.png'),
    WeatherGroup(
      groupNum: 803,
      groupEndNum: 1,
      imageUrl: 'assets/images/cloud.png',
    ),
  ];
}
