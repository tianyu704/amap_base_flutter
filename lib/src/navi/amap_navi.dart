part of amap_flutter;

class AmapNavi {
  static final _channel = MethodChannel('me.yohom/amap_navi');
  static const _startNavi = 'startNavi';
  static const _setKey = 'setKey';

  static void startNavi({
    @required double lat,
    @required double lon,
  }) {
    _channel.invokeMethod(_startNavi, {
      'lat': lat,
      'lon': lon,
    });
  }

  static Future setIOSKey(String key) async {
    try {
      if (Platform.isAndroid) {
        return true;
      } else if (Platform.isIOS) {
        return _channel.invokeMethod(_setKey, {'key': key});
      }
    } catch (e) {
      return false;
    }
  }
}
