import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Locale资源类
class DemoLocalizations {
  DemoLocalizations(this.isZh);

  bool isZh = false;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

//Locale代理类
class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("xxxx$locale");
    return  SynchronousFuture<DemoLocalizations>( DemoLocalizations(locale.languageCode == "zh"));
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
