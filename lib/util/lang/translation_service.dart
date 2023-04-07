import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
// import '/util/common/logger.dart';
import 'vi_VN.dart';

class LanguageCode {
  static final VI = "vi";
  static final EN = "en";
}

class TranslationService extends Translations {
  // TranslationService() {
  //     changeLocale(AppPreference().prefs.getString(AppKey.language) ?? 'vi');
  // }
  static Locale? get locale {
    // Logger.info(Get.deviceLocale.toString());
    return Get.deviceLocale;
  }

  static String languageCode = LanguageCode.VI;
  static final countryCode = 'VN';
  static final fallbackLocale = Locale(languageCode, countryCode);
  static final langCodes = [
    LanguageCode.EN,
    LanguageCode.VI,
  ];

  // các Locale được support
  static final locales = [
    Locale(LanguageCode.EN, 'US'),
    Locale(LanguageCode.VI, 'VN'),
  ];

  // cái này là Map các language được support đi kèm với mã code của lang đó: cái này dùng để đổ data vào Dropdownbutton và set language mà không cần quan tâm tới language của hệ thống
  static final langs = LinkedHashMap.from({
    LanguageCode.EN: 'English',
    LanguageCode.VI: 'Tiếng Việt',
  });

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
      };

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    languageCode = langCode;
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage({required String langCode}) {
    var lang = langCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return locales[0];
  }

  static saveLang() {}
}
