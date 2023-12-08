import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          'titleAppBar': 'رفيق السكري',
          'bottomBarItemLabelHome': 'الرئيسية',
          'bottomBarItemLabelReport': 'مخطط',
          'bottomBarItemLabelProfile': 'حسابي',
          'bottomBarItemLabelMore': 'المزيد',
        },
        "en": {
          'titleAppBar': 'Diabetes Companion',
          'bottomBarItemLabelHome': 'Home',
          'bottomBarItemLabelReport': 'Report',
          'bottomBarItemLabelProfile': 'Profile',
          'bottomBarItemLabelMore': 'More',
        }
      };
}
