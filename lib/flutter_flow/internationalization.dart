import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fa'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? faText = '',
  }) =>
      [enText, faText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // FilterPage
  {
    'x657ak29': {
      'en': 'Categories',
      'fa': 'دسته‌ها',
    },
    '351c5gwm': {
      'en': 'View all',
      'fa': 'مشاهده همه',
    },
    'ksvb8tuc': {
      'en': 'Age preference',
      'fa': 'اولویت سنی',
    },
    '16hm6c3p': {
      'en': '20-40',
      'fa': '۲۰-۴۰',
    },
    '0wtgs91w': {
      'en': 'Reset',
      'fa': 'تنظیم مجدد',
    },
    '968w6phc': {
      'en': 'Apply',
      'fa': 'اعمال کردن',
    },
    'b0923dai': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // PersonalInfo
  {
    'dhbx92pr': {
      'en': 'Personal Information',
      'fa': 'اطلاعات شخصی',
    },
    '2jfkyihz': {
      'en': '45',
      'fa': '۴۵',
    },
    '6383gkiu': {
      'en': 'Likes',
      'fa': 'لایک‌ها',
    },
    'wmdfjpwn': {
      'en': '674',
      'fa': '۶۷۴ عدد',
    },
    '5n79suz7': {
      'en': 'Trust Score',
      'fa': 'امتیاز اعتماد',
    },
    'keflnha4': {
      'en': '45',
      'fa': '۴۵',
    },
    'zrigxn7j': {
      'en': 'Likes',
      'fa': 'لایک‌ها',
    },
    'j4hgtmpg': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // Checkout1Page
  {
    'gubfc5t4': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // AddnewaddressPage
  {
    'mff7d21e': {
      'en': 'New address',
      'fa': 'آدرس جدید',
    },
    '4br7f00z': {
      'en': 'New address',
      'fa': 'آدرس جدید',
    },
    '7hirru8b': {
      'en': 'Select City',
      'fa': 'شهر را انتخاب کنید',
    },
    'fyrtf1mr': {
      'en': 'Select City',
      'fa': 'شهر را انتخاب کنید',
    },
    '3slq5f42': {
      'en': 'Surat',
      'fa': 'سورات',
    },
    '3j4eh72z': {
      'en': 'Ahemdabad',
      'fa': 'احمدآباد',
    },
    '1yrygi96': {
      'en': 'Street',
      'fa': 'خیابان',
    },
    'jcy3n8gf': {
      'en': 'Street',
      'fa': 'خیابان',
    },
    'utcgziz3': {
      'en': 'Please enter valid new address.',
      'fa': 'لطفا آدرس جدید معتبری وارد کنید.',
    },
    '2fwgyluu': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '5pdoazh1': {
      'en': 'Please enter valid street.',
      'fa': 'لطفا خیابان معتبری وارد کنید.',
    },
    '6231kvms': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'qewp42n2': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // VerifyCodePage
  {
    '5tb8yf2m': {
      'en': 'The confimation code was sent via email',
      'fa': 'کد تایید از طریق ایمیل ارسال شد',
    },
    '51awg9dv': {
      'en': 'johnabram@gmail.com',
      'fa': 'johnabram@gmail.com',
    },
    '0nkfanj2': {
      'en': 'Pease enter  valid code',
      'fa': 'لطفا کد معتبر را وارد کنید',
    },
    'va3m435c': {
      'en': 'Don’t get the code? ',
      'fa': 'کد را دریافت نمی‌کنید؟',
    },
    'a58i7832': {
      'en': 'Resend code',
      'fa': 'ارسال مجدد کد',
    },
    'vjvaogfy': {
      'en': 'Verify now',
      'fa': 'اکنون تأیید کنید',
    },
    'ker0wihq': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // FeedbackPage
  {
    'lif54gtt': {
      'en': 'Write your feedback...',
      'fa': 'نظرات خود را بنویسید...',
    },
    'jkpmczmx': {
      'en': 'Please enter valid Feedback.',
      'fa': 'لطفا بازخورد معتبر وارد کنید.',
    },
    'ou5zhxpi': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'kjdnza70': {
      'en': 'Submit',
      'fa': 'ارسال',
    },
    'uxx92xm2': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // PrivacyPolicyPage
  {
    'et3v0xw9': {
      'en': 'Types of data we collect',
      'fa': 'انواع داده‌هایی که جمع‌آوری می‌کنیم',
    },
    'pjccx30m': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
    },
    'tfexkisk': {
      'en': 'Use of your personal data',
      'fa': 'استفاده از داده‌های شخصی شما',
    },
    '0c0whg70': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
    },
    'or00gc18': {
      'en': 'Disclosure of your data',
      'fa': 'افشای داده‌های شما',
    },
    '8zt0gtha': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. ',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. تعلیق پرتیوم ویورا. Volutpat commodo sed egestas egestas fringillaphallus faucibus.',
    },
    'nehddebj': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // OnboardingPage
  {
    'fvqou22z': {
      'en': 'OFFER HELP, GET CLOSER',
      'fa': '',
    },
    'x5ipfs17': {
      'en':
          'Need help moving, repairing, or learning? Your community steps in — no pressure, just help.',
      'fa': '',
    },
    'dq5yb1i0': {
      'en': 'EXCHANGE FREELY',
      'fa': '',
    },
    'e8ck1z6d': {
      'en':
          'Swap items or services — old-school style. Get what you need while passing along what you don’t.',
      'fa': '',
    },
    'mc82p32c': {
      'en': 'ORGANISE OR JOIN EVENTS',
      'fa': '',
    },
    '6hct3poo': {
      'en':
          'Host your own or join others — from cozy game nights to creative workshops. It’s your space to connect.',
      'fa': '',
    },
    '77oebv9d': {
      'en': 'NEVER FAR FROM IRAN',
      'fa': '',
    },
    '2lvwirso': {
      'en':
          'Need something from someone trusted in Iran? Income for them, ease for you.',
      'fa': '',
    },
    'b8gufi8a': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // Swipable_MA
  {
    'c1pfqxt9': {
      'en': 'Discover Local Offers & Events',
      'fa': 'پیشنهادات و رویدادهای محلی را کشف کنید',
    },
    'z2x2a2db': {
      'en':
          'Swipe through offerings, events, and exchanges from your community. When you both swipe right, you connect to trade, support, or join forces.',
      'fa':
          'با کشیدن انگشت خود به سمت راست، از پیشنهادات، رویدادها و تبادلات جامعه خود مطلع شوید. وقتی هر دو انگشت خود را به راست بکشید، به تجارت، پشتیبانی یا اتحاد نیروها متصل می‌شوید.',
    },
    'wwubvgcu': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // HomePage
  {
    'tp5ycz33': {
      'en': 'What are you looking for today?',
      'fa': 'امروز دنبال چی هستی؟',
    },
    'b6xasaj9': {
      'en': 'IRAN-NL',
      'fa': 'رویدادها',
    },
    '0vip22m0': {
      'en': 'EVENTS',
      'fa': 'رویدادها',
    },
    '3tz78yea': {
      'en': 'COMMUNITY CARE',
      'fa': 'مراقبت‌های اجتماعی',
    },
    'ib0ekrge': {
      'en': 'MARKETPLACE',
      'fa': 'مراقبت‌های اجتماعی',
    },
    'hmb7gki5': {
      'en': 'Tranding Categories',
      'fa': 'دسته بندی های ترندینگ',
    },
    '9s3kmnj6': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    '0tf02ybh': {
      'en': 'Help Request',
      'fa': 'درخواست کمک',
    },
    'lfk150vu': {
      'en': '50 requests',
      'fa': '۵۰ درخواست',
    },
    'fbxtj3am': {
      'en': 'Need a Job',
      'fa': 'نیاز به شغل',
    },
    'c9inkp2j': {
      'en': '3 requests',
      'fa': '۳ درخواست',
    },
    't2z7olia': {
      'en': 'Help Offer',
      'fa': 'پیشنهاد کمک',
    },
    'w4ta04kv': {
      'en': '10 requests',
      'fa': '۱۰ درخواست',
    },
    'cjy59qdz': {
      'en': 'New Events',
      'fa': 'رویدادهای جدید',
    },
    'z5ktm6xn': {
      'en': '2 requests',
      'fa': '۲ درخواست',
    },
    'pshx57tg': {
      'en': 'What’s Around You? Swipe to See',
      'fa': 'چه چیزهایی در اطراف شما وجود دارد؟ برای دیدن، صفحه را بکشید',
    },
    'nl42s9kh': {
      'en': 'Swipe through a world of existing \nproducts, services and events',
      'fa': 'در دنیایی از محصولات، خدمات و رویدادهای موجود جستجو کنید',
    },
    '1ydrd3oe': {
      'en': 'Swipe through a world of existing products, services and events',
      'fa': 'در دنیایی از محصولات، خدمات و رویدادهای موجود جستجو کنید',
    },
    '45nxx23g': {
      'en': 'Button',
      'fa': 'دکمه',
    },
    '607mveb5': {
      'en': 'Community Shoutouts',
      'fa': 'فریادهای جامعه',
    },
    '3e2bxvtz': {
      'en': 'Thank you Ali ',
      'fa': 'ممنون علی.',
    },
    'hzf4lfor': {
      'en':
          'For your Community support, we can make it abette world with indviduals like you.',
      'fa':
          'برای حمایت اجتماعی شما، می‌توانیم با افرادی مثل شما، دنیا را به دنیایی بهتر تبدیل کنیم.',
    },
    'ei09liyp': {
      'en': 'Thank you Ali ',
      'fa': 'ممنون علی.',
    },
    'gjeiq4pf': {
      'en':
          'For your Community support, we can make it abette world with indviduals like you.',
      'fa':
          'برای حمایت اجتماعی شما، می‌توانیم با افرادی مثل شما، دنیا را به دنیایی بهتر تبدیل کنیم.',
    },
    'd1hvqyow': {
      'en': 'Thank you Ali ',
      'fa': 'ممنون علی.',
    },
    'celsaycw': {
      'en':
          'For your Community support, we can make it abette world with indviduals like you.',
      'fa':
          'برای حمایت اجتماعی شما، می‌توانیم با افرادی مثل شما، دنیا را به دنیایی بهتر تبدیل کنیم.',
    },
    'qv3strvd': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // WriteReviewPage
  {
    'gr9w4vot': {
      'en': 'Would you like write anything about|',
      'fa': 'دوست دارید چیزی در موردش بنویسید؟',
    },
    'fdz15yw2': {
      'en': '350 Characters remaining',
      'fa': '۳۵۰ کاراکتر باقی مانده',
    },
    'amnv5cpz': {
      'en': 'Please entre valid write a review.',
      'fa': 'لطفا یک نقد معتبر بنویسید.',
    },
    'nvwwgpqy': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'lxmt4ut6': {
      'en': 'Submit review',
      'fa': 'ارسال نقد و بررسی',
    },
    'fzdiiauy': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // QuestionairPage
  {
    'nbdummsk': {
      'en': 'Where are you located?',
      'fa': '',
    },
    'y5itzz6t': {
      'en':
          'So we can better match you with nearby events, services, and users.',
      'fa': '',
    },
    '1295uiwr': {
      'en': 'Select Location',
      'fa': '',
    },
    'tpkopas3': {
      'en': 'How do you want to use Yekja?',
      'fa': '',
    },
    'jetsdu3f': {
      'en':
          'Select all the ways you\'d like to use the app — find help, exchange, trade, or connect with people.',
      'fa': '',
    },
    'g5kggsww': {
      'en': 'Ready to swap?',
      'fa': '',
    },
    'eng9z0mt': {
      'en':
          'Got something others could use? Swap what you have for what you need — you agree together how it works.',
      'fa': '',
    },
    'nro0no3y': {
      'en': 'What would you host or attend?',
      'fa': '',
    },
    '8p8vwszd': {
      'en':
          'Host your own or join others — from cozy game nights to creative workshops. It’s your space to connect.',
      'fa': '',
    },
    'z05zz2bf': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // SecurityPage
  {
    'kvsjl11z': {
      'en': 'Face ID',
      'fa': 'شناسه چهره',
    },
    '3md5ep01': {
      'en': 'Notifications',
      'fa': 'اعلان‌ها',
    },
    'snzn7yvn': {
      'en': 'Change password',
      'fa': 'تغییر رمز عبور',
    },
    'sf4e1hbe': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ProfilePage
  {
    'fueaz9te': {
      'en': 'Profile',
      'fa': 'پروفایل',
    },
    'hqyt6jd3': {
      'en': 'Tom Hanks',
      'fa': 'تام هنکس',
    },
    'segc8rtw': {
      'en': 'Tom_Hanks@gmail.com',
      'fa': 'Tom_Hanks@gmail.com',
    },
    '6qcg2p25': {
      'en': 'Personal Information',
      'fa': 'اطلاعات شخصی',
    },
    '6e1gjcci': {
      'en': 'My Posts',
      'fa': 'پست‌های من',
    },
    'g6fwp41n': {
      'en': 'My Favourites',
      'fa': 'موارد دلخواه من',
    },
    '36qgv5u6': {
      'en': 'Notifications',
      'fa': 'اعلان‌ها',
    },
    '6bxmq5ee': {
      'en': 'Yekja Terms&Conditions',
      'fa': 'شرایط و ضوابط یکجا',
    },
    'rh49er06': {
      'en': 'Privacy and policy',
      'fa': 'حریم خصوصی و سیاست',
    },
    'yq4fqtye': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // HelpPage
  {
    '24c4afj9': {
      'en': 'Which company best for furniture?',
      'fa': 'کدام شرکت برای مبلمان بهتر است؟',
    },
    'l1qm6pea': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'dtpcil6r': {
      'en': 'Which online shopping is best?',
      'fa': 'کدام خرید آنلاین بهتر است؟',
    },
    'odjaij7e': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'o9brjb3x': {
      'en': 'What comes under furniture?',
      'fa': 'زیر مبلمان چه چیزهایی قرار می‌گیرد؟',
    },
    'bkl59zgx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    '95ksmw47': {
      'en': 'Which furniture is best in India?',
      'fa': 'کدام مبلمان در هند بهترین است؟',
    },
    'nu3cwjjm': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'eks33xkk': {
      'en': 'Are items in Amazon original?',
      'fa': 'آیا کالاهای موجود در آمازون اصل هستند؟',
    },
    '21arpmnw': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'aloc0wpz': {
      'en': 'Does Amazon sell original items?',
      'fa': 'آیا آمازون اقلام اورجینال می‌فروشد؟',
    },
    'sjaptzm1': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'isn1j7jh': {
      'en': 'Is it OK to buy from Amazon?',
      'fa': 'آیا خرید از آمازون اشکالی ندارد؟',
    },
    'ncwlis4k': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'xelooj4q': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ChangePasswordPage
  {
    'es31lnj2': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    'n1c51t31': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    '4gt7mmvz': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'uzjift62': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'm0ojx49m': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
    'o2r9wrf3': {
      'en': 'Please  enter valid new password.',
      'fa': 'لطفا رمز عبور جدید معتبری وارد کنید.',
    },
    'bquhm6mz': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '3ldbjfsd': {
      'en': 'Please  enter valid confirm password.',
      'fa': 'لطفا رمز عبور معتبر را وارد کنید.',
    },
    'nmffikq0': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'q1jzr6vg': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ForgotPasswordPage
  {
    '7cx2kxrk': {
      'en': 'Type your email, we will send you verification code via email',
      'fa':
          'ایمیل خود را وارد کنید، ما کد تأیید را از طریق ایمیل برای شما ارسال خواهیم کرد',
    },
    'ukwsa1lg': {
      'en': 'Email address',
      'fa': 'آدرس ایمیل',
    },
    'b9qhzbmh': {
      'en': 'Email address',
      'fa': 'آدرس ایمیل',
    },
    'tx1anksc': {
      'en': 'please enter valid your email address.',
      'fa': 'لطفا آدرس ایمیل معتبر خود را وارد کنید.',
    },
    'dxfpl9nd': {
      'en': 'please enter your email address.',
      'fa': 'لطفا آدرس ایمیل خود را وارد کنید.',
    },
    'zwux5wuv': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'pn42p7ja': {
      'en': 'Continue',
      'fa': 'ادامه',
    },
    'ns7bgfpq': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // OrderDetailPage
  {
    'lkihf97e': {
      'en': 'Order ID :',
      'fa': 'شناسه سفارش:',
    },
    'lmnac4b8': {
      'en': ' #123654',
      'fa': '#۱۲۳۶۵۴',
    },
    'iwcovqks': {
      'en': 'Order at 6:35 PM|',
      'fa': 'سفارش ساعت ۶:۳۵ بعد از ظهر|',
    },
    '4lch27s7': {
      'en': '4 March',
      'fa': '۴ مارس',
    },
    'fe4sg29t': {
      'en': 'Pending',
      'fa': 'در حال بررسی',
    },
    'omxtm18b': {
      'en': 'Customer',
      'fa': 'مشتری',
    },
    'mg2c1r5j': {
      'en': 'Jane cooper',
      'fa': 'جین کوپر',
    },
    'dxaqlq2j': {
      'en': 'Office Address',
      'fa': 'آدرس دفتر',
    },
    'unwaqbh6': {
      'en': '4517 washington ave. manchester, kentucky 39495',
      'fa': '۴۵۱۷ خیابان واشنگتن، منچستر، کنتاکی ۳۹۴۹۵',
    },
    '2ma6y8t7': {
      'en': 'Home Address',
      'fa': 'آدرس منزل',
    },
    'zielytrq': {
      'en': '2118 thornridge cir. syracuse, connecticut 35624',
      'fa': '۲۱۱۸، سیراکیوز، کنتیکت، کد پستی ۳۵۶۲۴، تورنریج',
    },
    '8yhu29y4': {
      'en': 'Order note',
      'fa': 'یادداشت سفارش',
    },
    't7fk7jbv': {
      'en': 'I need the best one',
      'fa': 'من به بهترینش نیاز دارم',
    },
    '74yuid8d': {
      'en': 'Possibly table',
      'fa': 'احتمالاً میز',
    },
    '2ubn5vod': {
      'en': '\$30.00',
      'fa': '۳۰٫۰۰ دلار',
    },
    'xohpj1u6': {
      'en': 'Payment summary',
      'fa': 'خلاصه پرداخت',
    },
    'caes7d6g': {
      'en': 'Subtotal',
      'fa': 'جمع جزئی',
    },
    '1evrjq0h': {
      'en': 'Shipping',
      'fa': 'حمل و نقل',
    },
    '3s5du8oj': {
      'en': 'Total',
      'fa': 'مجموع',
    },
    '7ftwu6e0': {
      'en': '\$114.00',
      'fa': '۱۱۴٫۰۰ دلار',
    },
    'tisru0s4': {
      'en': '\$10.00',
      'fa': '۱۰٫۰۰ دلار',
    },
    'jr9qinm5': {
      'en': '\$124.00',
      'fa': '۱۲۴٫۰۰ دلار',
    },
    'bi9jcpvo': {
      'en': 'Cancel order',
      'fa': 'لغو سفارش',
    },
    'jtm8hzgg': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // Splash
  {
    'twp4gkdv': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ResetPasswordPage
  {
    '6baohfcj': {
      'en': 'Create your new password to log in',
      'fa': 'رمز عبور جدید خود را برای ورود ایجاد کنید',
    },
    '7qj4jthi': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    'hd56x034': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    'ssuipl8e': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'duge37vu': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'j3fkaqso': {
      'en': 'Reset password',
      'fa': 'بازنشانی رمز عبور',
    },
    '7fzxxs8j': {
      'en': 'Please enter valid new password.',
      'fa': 'لطفا رمز عبور جدید معتبری وارد کنید.',
    },
    'lo4zqx7s': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '71vw82ef': {
      'en': 'please enter valid confirm passsword.',
      'fa': 'لطفا رمز عبور معتبر وارد کنید.',
    },
    'elie794q': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'yp5q6x4q': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // chatsearch
  {
    'nx5r36vm': {
      'en': '',
      'fa': '',
    },
    'heyv0y7l': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'it1vxbnl': {
      'en': '',
      'fa': '',
    },
    '9c2yt8y7': {
      'en': 'People',
      'fa': 'مردم',
    },
    'e12a7uxc': {
      'en': 'Fariq Azhar',
      'fa': 'فارق ازهر',
    },
    'ysc1jits': {
      'en': 'Ok sir',
      'fa': 'باشه آقا',
    },
    'qkm0spa9': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'udn2jkxq': {
      'en': 'Messages',
      'fa': 'پیام‌ها',
    },
    '83da51ga': {
      'en': 'Jane cooper',
      'fa': 'جین کوپر',
    },
    'dufjtrv0': {
      'en': 'Ghusna she for new',
      'fa': 'غصنا او را برای جدید',
    },
    'x19rkdf7': {
      'en': '20/03/2023',
      'fa': '۲۰/۰۳/۲۰۲۳',
    },
    '8birqyxf': {
      'en': 'Fariq Azhar',
      'fa': 'فارق ازهر',
    },
    'b0qavx0w': {
      'en': 'Ok sir',
      'fa': 'باشه آقا',
    },
    'qiswl4cd': {
      'en': '16/03/2020',
      'fa': '۱۶/۰۳/۲۰۲۰',
    },
    'm9oyildy': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // CallPage
  {
    'y3o5jfkv': {
      'en': 'Jane cooper',
      'fa': 'جین کوپر',
    },
    'vgemo2vv': {
      'en': '20:12',
      'fa': '۲۰:۱۲',
    },
    'ttesvk8r': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // TermsConditionsPage
  {
    'h07847j4': {
      'en': 'Last update:',
      'fa': 'آخرین به‌روزرسانی:',
    },
    'gt5ezvts': {
      'en': ' 27/12/2023',
      'fa': '۲۷/۱۲/۲۰۲۳',
    },
    'ymkkp0xc': {
      'en':
          'Please read these terms of service, carefully before using our app operated by us.',
      'fa':
          'لطفاً قبل از استفاده از برنامه‌ای که توسط ما اداره می‌شود، این شرایط خدمات را با دقت مطالعه کنید.',
    },
    'qtiz5odk': {
      'en': 'Conditions of Uses',
      'fa': 'شرایط استفاده',
    },
    'n6b25ynm': {
      'en':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      'fa':
          'این یک واقعیت دیرینه است که خواننده هنگام نگاه کردن به طرح‌بندی یک صفحه، حواسش به محتوای خوانای آن پرت می‌شود. نکته استفاده از لورم ایپسوم این است که برخلاف استفاده از «محتوا اینجا، محتوا اینجا» توزیع حروف کم و بیش نرمالی دارد و باعث می‌شود مانند انگلیسی خوانا به نظر برسد.\n\nبسیاری از بسته‌های نشر رومیزی و ویرایشگرهای صفحات وب اکنون از لورم ایپسوم به عنوان متن مدل پیش‌فرض خود استفاده می‌کنند و جستجوی «لورم ایپسوم» بسیاری از وب‌سایت‌ها را که هنوز در مراحل ابتدایی خود هستند، آشکار می‌کند. نسخه‌های مختلفی در طول سال‌ها تکامل یافته‌اند، گاهی به طور تصادفی، گاهی به طور هدفمند (تزریق طنز و موارد مشابه).',
    },
    '0t1hw5zn': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ReviewsPage
  {
    '66ku3mjd': {
      'en': '4.0',
      'fa': '۴.۰',
    },
    'x7iif5up': {
      'en': 'Based on 23 reviews',
      'fa': 'بر اساس ۲۳ نظر',
    },
    'rxtq9yyu': {
      'en': 'Leslie Alexander',
      'fa': 'لسلی الکساندر',
    },
    'f30piew6': {
      'en': '5 Min',
      'fa': '۵ دقیقه',
    },
    '57j93ako': {
      'en':
          'Good service and I\'m happy with the service,best value plant nursery in my area.',
      'fa':
          'خدمات خوبی ارائه می‌دهد و من از خدمات راضی هستم، بهترین گلخانه با بهترین قیمت در منطقه من است.',
    },
    'v6ofv7vn': {
      'en': 'Raji Fakhr',
      'fa': 'راجی فخر',
    },
    '4d0vdy4g': {
      'en': '10 Min',
      'fa': '۱۰ دقیقه',
    },
    'g48zhywg': {
      'en':
          'Formal assessment of something with the intention of change if necessary.',
      'fa': 'ارزیابی رسمی چیزی با هدف تغییر در صورت لزوم.',
    },
    'wxbaqwac': {
      'en': 'Thuwaybah Issa',
      'fa': 'ثویبه عیسی',
    },
    'hjca21i3': {
      'en': '15 Min',
      'fa': '۱۵ دقیقه',
    },
    '78kxzikd': {
      'en':
          'Good service and I\'m happy with the service,best value plant nursery in my area.',
      'fa':
          'خدمات خوبی ارائه می‌دهد و من از خدمات راضی هستم، بهترین گلخانه با بهترین قیمت در منطقه من است.',
    },
    'e1b2lub2': {
      'en': 'Nuhaid Rihab',
      'fa': 'نوحید رحاب',
    },
    'ivvsfbyu': {
      'en': '20 Min',
      'fa': '۲۰ دقیقه',
    },
    'wd1f2mqj': {
      'en':
          'Review of the latest book on Chaucer. A criticism is a judgment, usually in an article, either favorable.',
      'fa':
          'نقد و بررسی آخرین کتاب درباره چاسر. نقد، قضاوتی است که معمولاً در یک مقاله، چه به صورت مثبت و چه به صورت منفی، صورت می‌گیرد.',
    },
    'qksj5snf': {
      'en': 'Nuhaid Rihab',
      'fa': 'نوحید رحاب',
    },
    'iliqi8ae': {
      'en': '20 Min',
      'fa': '۲۰ دقیقه',
    },
    'ho7wedwq': {
      'en':
          'Review of the latest book on Chaucer. A criticism is a judgment, usually in an article, either favorable.',
      'fa':
          'نقد و بررسی آخرین کتاب درباره چاسر. نقد، قضاوتی است که معمولاً در یک مقاله، چه به صورت مثبت و چه به صورت منفی، صورت می‌گیرد.',
    },
    'wcyttu8x': {
      'en': 'Write a review',
      'fa': 'نقد بنویسید',
    },
    '42yne5o9': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // EditProfilePage
  {
    '8sb7vstv': {
      'en': 'John Abram',
      'fa': 'جان آبرام',
    },
    'np0lsmdx': {
      'en': 'johnabram@gmail.com',
      'fa': 'johnabram@gmail.com',
    },
    't1x1npmz': {
      'en': 'First name',
      'fa': 'نام کوچک',
    },
    'pe76x8jk': {
      'en': 'First name',
      'fa': 'نام کوچک',
    },
    'cq38fd08': {
      'en': 'abc',
      'fa': 'الفبای',
    },
    'l8bplxxc': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
    },
    'mytq602l': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
    },
    '343jl3kw': {
      'en': 'xyz',
      'fa': 'ایکس وای زد',
    },
    '9yh4jgue': {
      'en': '',
      'fa': '',
    },
    'b72z9jr8': {
      'en': 'Email address',
      'fa': 'آدرس ایمیل',
    },
    'a080hwzc': {
      'en': 'abc@gmail.com',
      'fa': 'abc@gmail.com',
    },
    'xu2qdymg': {
      'en': 'Please enter valid first name.',
      'fa': 'لطفا نام و نام خانوادگی معتبر وارد کنید.',
    },
    '1qcswtv6': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '5dxsp78b': {
      'en': 'Please enter valid last name.',
      'fa': 'لطفا نام خانوادگی معتبر وارد کنید.',
    },
    '7ecykz20': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'de2de285': {
      'en': 'Please enter valid email address.',
      'fa': 'لطفا آدرس ایمیل معتبری وارد کنید.',
    },
    '4sen6l34': {
      'en': 'Please enter valid email address.',
      'fa': 'لطفا آدرس ایمیل معتبری وارد کنید.',
    },
    '9l1nfwp9': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'juhlo2km': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
    '2615xb3m': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // Events
  {
    'i7ajooi4': {
      'en': 'Location',
      'fa': 'مکان',
    },
    't14ytv6g': {
      'en': 'Search...',
      'fa': 'جستجو...',
    },
    '2kp727kk': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
    },
    '5s0c0ero': {
      'en': 'Utrecht',
      'fa': 'اوترخت',
    },
    'kcq2onos': {
      'en': 'Roterdam',
      'fa': 'روتردام',
    },
    '9elpb7u6': {
      'en': 'Create your Own ',
      'fa': 'خودت را بساز',
    },
    'v49kkwir': {
      'en': 'This Week',
      'fa': 'این هفته',
    },
    'x1xolbmi': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
    },
    't6hrpmq7': {
      'en': 'New Events',
      'fa': 'رویدادهای جدید',
    },
    'w0pnp1z3': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
    },
    'ti6bni8k': {
      'en': 'Past Events',
      'fa': 'رویدادهای گذشته',
    },
    '7zdzq2zc': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
    },
    'j6urr4mb': {
      'en': 'Papular',
      'fa': 'پاپولار',
    },
    'en1tquyj': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
    },
    'qxqmxean': {
      'en': 'Categories',
      'fa': 'دسته‌ها',
    },
    'fppuf54e': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'sfaqm5h0': {
      'en': 'Game Night',
      'fa': 'شب بازی',
    },
    'v6fucuhz': {
      'en': 'Sport',
      'fa': 'ورزش',
    },
    'cpfbz0wo': {
      'en': 'BBQ',
      'fa': 'باربیکیو',
    },
    '7qvgei9i': {
      'en': 'New Shows',
      'fa': 'نمایش‌های جدید',
    },
    'i1wixmqg': {
      'en': 'Last updated Today',
      'fa': 'آخرین به‌روزرسانی امروز',
    },
    'r5cmv49k': {
      'en': 'Amsterdam, Ziggo Dome',
      'fa': 'آمستردام، گنبد زیگو',
    },
    'mohqul2m': {
      'en': 'Summer Party',
      'fa': 'مهمانی تابستانی',
    },
    '0rcwktmq': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
    },
    '10zjo3pm': {
      'en': 'Amsterdam, Ziggo Dome',
      'fa': 'آمستردام، گنبد زیگو',
    },
    '0kvtjf5o': {
      'en': 'Summer Party',
      'fa': 'مهمانی تابستانی',
    },
    'q533wolg': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
    },
    'qmljwuqk': {
      'en': 'Amstelven, Amsterdam\'sBos',
      'fa': 'آمستلون، آمستردام بوس',
    },
    'rlyjcccd': {
      'en': 'Summer BBQ',
      'fa': 'باربیکیو تابستانی',
    },
    'mhsv7wn4': {
      'en': 'juli 23, 05:00 PM',
      'fa': '۲۳ ژوئیه، ساعت ۱۷:۰۰',
    },
    'hlhfhorw': {
      'en': 'Best of last month',
      'fa': 'بهترین‌های ماه گذشته',
    },
    'kgmsmnqi': {
      'en': 'Based on your like and reviews',
      'fa': 'بر اساس لایک و نظرات شما',
    },
    'rxbhr3mo': {
      'en': 'Game Night',
      'fa': 'شب بازی',
    },
    '7weex4k8': {
      'en': 'Utrecht',
      'fa': 'اوترخت',
    },
    'wir5zro3': {
      'en': 'Mafia',
      'fa': 'مافیا',
    },
    'gkg8vs6k': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
    },
    'ee1eczmi': {
      'en': '4.8',
      'fa': '۴.۸',
    },
    '941hvre2': {
      'en': 'Social',
      'fa': 'اجتماعی',
    },
    'uz5idaos': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
    },
    '0nsdrkwp': {
      'en': 'Book Club',
      'fa': 'باشگاه کتاب',
    },
    '6f9oi0a1': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
    },
    '0vhc4y98': {
      'en': '5',
      'fa': '۵',
    },
    'q3q0d5ui': {
      'en': 'BBQ',
      'fa': 'باربیکیو',
    },
    'c5txrema': {
      'en': 'Amstelven,Amsterdam\'s Bos',
      'fa': 'آمستلون، بوس آمستردام',
    },
    'jb80kqem': {
      'en': 'Picnic Lovers',
      'fa': 'عاشقان پیک نیک',
    },
    'qe8smj8m': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
    },
    'iu8qjnpz': {
      'en': '4',
      'fa': '۴',
    },
    'ezcrygy7': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // AboutPage
  {
    'sj2ejwyi': {
      'en': 'Traditional indian soup lentils.',
      'fa': 'سوپ عدس سنتی هندی.',
    },
    'eyopgro8': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. ',
      'fa':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum tellus elit sed risus.',
    },
    'v0leq08k': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'fa':
          'آمت مینیم مولیت غیر دسرونت اولامکو است سیت آلیکا دولور دو آمت سینت. Velit officia consequat duis enim velit mollit. ورزش veniam consequat sunt nostrud amet.',
    },
    'u4cub474': {
      'en':
          'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat volutpat. Curabitur fringilla in purus eget egestas. Etiam quis.',
      'fa':
          'در purus laoreet. عدد صحیح turpis quam، laoreet id orci nec، ultrices lacinia nunc. الیکوام ارات ولوتپات. Curabitur fringilla در purus eget egestas. اتیام کویس.',
    },
    'wm4znpuc': {
      'en':
          'IVorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. ',
      'fa':
          'IVorem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum tellus elit sed risus.',
    },
    'wk5x7m62': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
      'fa':
          'آمت مینیم مولیت غیر دسرونت اولامکو است سیت آلیکا دولور دو آمت سینت.',
    },
    '822wmebl': {
      'en':
          'IVorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. ',
      'fa':
          'IVorem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum tellus elit sed risus.',
    },
    'kwobyyc8': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // chatdetail
  {
    '71xw6t33': {
      'en': 'Basinah Quraishi',
      'fa': 'بصینه قریشی',
    },
    'zuqg8tu7': {
      'en': 'Hello sir',
      'fa': 'سلام آقا',
    },
    '6wmoc6n8': {
      'en': 'Yesterday',
      'fa': 'دیروز',
    },
    'mdu1w55m': {
      'en': 'Hello, brother',
      'fa': 'سلام برادر',
    },
    'hqpnggeo': {
      'en': 'Language is a means of the new communication',
      'fa': 'زبان وسیله‌ای برای ارتباط نوین است',
    },
    'q19l9lfr': {
      'en': 'Today',
      'fa': 'امروز',
    },
    'svwgmjd7': {
      'en': 'Good morning, brother',
      'fa': 'صبح بخیر، برادر',
    },
    'glbyizlc': {
      'en': 'Instruction in a prompt and provide a detailed response',
      'fa': 'دستورالعمل در یک سوال و ارائه پاسخ دقیق',
    },
    'k4p1738l': {
      'en': '',
      'fa': '',
    },
    'ztyst9mh': {
      'en': 'Type here',
      'fa': 'اینجا تایپ کنید',
    },
    'ixvb7rf1': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // SettingPage
  {
    'x0kdsaqy': {
      'en': 'About us',
      'fa': 'درباره ما',
    },
    'ic8q7mg9': {
      'en': 'Help',
      'fa': 'کمک',
    },
    'bh7jxmp0': {
      'en': 'Feedback',
      'fa': 'بازخورد',
    },
    'rpo1gjxd': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // AddnewcardPage
  {
    '9q7to6hw': {
      'en': 'Select card type',
      'fa': 'انتخاب نوع کارت',
    },
    'alhqzign': {
      'en': 'Search for an item...',
      'fa': 'جستجوی یک مورد...',
    },
    '7d3970t0': {
      'en': 'Credit Card',
      'fa': 'کارت اعتباری',
    },
    '95owi1am': {
      'en': 'Debit Card',
      'fa': 'کارت بدهی',
    },
    'xhhcf1za': {
      'en': 'Card holder name',
      'fa': 'نام دارنده کارت',
    },
    'kld2c2oq': {
      'en': 'Card holder name',
      'fa': 'نام دارنده کارت',
    },
    '760jsitm': {
      'en': 'Card number',
      'fa': 'شماره کارت',
    },
    'wwzr3c68': {
      'en': 'Card number',
      'fa': 'شماره کارت',
    },
    'cg1dui74': {
      'en': 'Expiray date',
      'fa': 'تاریخ انقضا',
    },
    '8sjf5i61': {
      'en': 'Expiray date',
      'fa': 'تاریخ انقضا',
    },
    'x9q220lh': {
      'en': 'CVV',
      'fa': 'سی وی وی',
    },
    'c8tmxcop': {
      'en': 'CVV',
      'fa': 'سی وی وی',
    },
    '4qezr8e5': {
      'en': 'Add',
      'fa': 'اضافه کردن',
    },
    '69wy7hnc': {
      'en': 'Please enter valid card holder name.',
      'fa': 'لطفا نام دارنده کارت معتبر را وارد کنید.',
    },
    'uemj7vsm': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'fp8h98zh': {
      'en': 'Please enter valid card number.',
      'fa': 'لطفا شماره کارت معتبر وارد کنید.',
    },
    '8tnlq6y2': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '01vkoiox': {
      'en': 'Please enter valid expiray date.',
      'fa': 'لطفا تاریخ انقضای معتبر وارد کنید.',
    },
    'byrvmfq9': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '1gtoud41': {
      'en': 'Please enter valid cvv.',
      'fa': 'لطفا cvv معتبر وارد کنید.',
    },
    '4wa3jltb': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '2aedvv87': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // SignInPage
  {
    '3yjo0udr': {
      'en': 'Welcome Back',
      'fa': '',
    },
    '9amiwbff': {
      'en':
          'Sign in to find trusted people, exchanges, and opportunities near you.',
      'fa': '',
    },
    '8p9u8xta': {
      'en': 'Email',
      'fa': '',
    },
    '719u7ojl': {
      'en': 'Password',
      'fa': '',
    },
    'nxmvn4ld': {
      'en': 'Forgot password? ',
      'fa': '',
    },
    'btvjsow4': {
      'en': 'Click here',
      'fa': '',
    },
    'c0foq102': {
      'en': 'OR',
      'fa': '',
    },
    '4pvcq608': {
      'en': 'Continue with Google',
      'fa': '',
    },
    'neytz17q': {
      'en': 'Continue with Facebook',
      'fa': '',
    },
    'qqhkk63r': {
      'en': 'No account yet? ',
      'fa': '',
    },
    'oc6h6d27': {
      'en': 'Sign Up here',
      'fa': '',
    },
    '0rujztpm': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // SignUpPage
  {
    'w51ndrcz': {
      'en': 'Create an account',
      'fa': '',
    },
    '4z21d4lm': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': '',
    },
    'nvfo5j5k': {
      'en': 'Your Name',
      'fa': '',
    },
    '89dit003': {
      'en': 'Email',
      'fa': '',
    },
    'llboq7q5': {
      'en': 'Password',
      'fa': '',
    },
    '1j6t5sr8': {
      'en': 'Confirm Password',
      'fa': '',
    },
    'q3xjm17v': {
      'en': 'OR',
      'fa': '',
    },
    'er6ptcif': {
      'en': 'Continue with Google',
      'fa': '',
    },
    'cm35ie6x': {
      'en': 'Continue with Facebook',
      'fa': '',
    },
    'eo7evm6p': {
      'en': 'Already have an account? ',
      'fa': '',
    },
    'vk8yd8no': {
      'en': ' Sign In here',
      'fa': '',
    },
    'gdw0qcl7': {
      'en': 'Terms of Service',
      'fa': '',
    },
    'os16i96x': {
      'en': 'Privacy Policy',
      'fa': '',
    },
    '2g978126': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ProductComponent
  {
    'zcmv3e6u': {
      'en': 'Item Title',
      'fa': 'عنوان کالا',
    },
    '2bfqa5n2': {
      'en': 'Price',
      'fa': 'قیمت',
    },
    '0zssz39y': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
    },
    'yl913sc3': {
      'en': 'Hello World',
      'fa': '',
    },
  },
  // FavouriteEmpty
  {
    'lveqe3uo': {
      'en': 'No favorite yet!',
      'fa': 'هنوز مورد علاقه‌ای پیدا نشده!',
    },
    'prk2a2pn': {
      'en': 'Like a product you see save them here to your favourites.',
      'fa':
          'مانند محصولی که می‌بینید، آنها را اینجا در لیست علاقه‌مندی‌هایتان ذخیره کنید.',
    },
  },
  // MyOrderEmpty
  {
    '3x5ajroo': {
      'en': 'No order yet!',
      'fa': 'هنوز سفارشی ثبت نشده!',
    },
    '87ki34ez': {
      'en': 'Explore and shortlist somelist some product',
      'fa': 'برخی از محصولات را بررسی و فهرست کوتاه کنید',
    },
  },
  // ChatEmpty
  {
    'okhx9o9y': {
      'en': 'No message yet!',
      'fa': 'هنوز پیامی نیومده!',
    },
    '6fy47ivq': {
      'en':
          'No messages in your inboxa yet!\n start chatting with your neighbours.',
      'fa': 'هنوز پیامی در صندوق ورودی شما نیست!\nبا همسایه‌هایتان چت کنید.',
    },
  },
  // ChatComopnet
  {
    'yehk8rq2': {
      'en': 'Chat',
      'fa': 'چت',
    },
    'urkkzuba': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'fmgb2ksa': {
      'en': 'Basinah Quraishi',
      'fa': 'بصینه قریشی',
    },
    'r5mk7tsj': {
      'en': 'Hello sir',
      'fa': 'سلام آقا',
    },
    'wn55w6ba': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'fun81ire': {
      'en': 'Iftikar Buthayna',
      'fa': 'افتخار بثینه',
    },
    'yl1sgi2i': {
      'en': 'Good morning sir',
      'fa': 'صبح بخیر آقا',
    },
    'z20s1lgm': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'dd3hm7oy': {
      'en': 'Fariq Azhar',
      'fa': 'فارق ازهر',
    },
    '43ingyh1': {
      'en': 'Ok sir',
      'fa': 'باشه آقا',
    },
    'k8mjufht': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'qyo2p7fb': {
      'en': 'Radeyah Hawra',
      'fa': 'راضیه حوراء',
    },
    'qlu2aawv': {
      'en': 'Potilies sir',
      'fa': 'آقایان، آقایان',
    },
    'xbfoad3b': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'a5hpjage': {
      'en': 'May Dunya',
      'fa': 'می دنیا',
    },
    'grxah90a': {
      'en': '36154212',
      'fa': '۳۶۱۸-۰۶-۱۱T۲۲:۰۰:۰۰Z',
    },
    'f15cfbbp': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
    'm4b3rd8t': {
      'en': 'Fayruz Awad',
      'fa': 'فیروز عوض',
    },
    'adsei9sc': {
      'en': 'Loadig',
      'fa': 'لودیگ',
    },
    'gpw4nj3k': {
      'en': '27 Min',
      'fa': '۲۷ دقیقه',
    },
  },
  // Addresscomponent
  {
    'p5v6bsuz': {
      'en': 'Office',
      'fa': 'دفتر',
    },
    'gufgipto': {
      'en': '4517 washington ave. manchester, kentucky\n39495',
      'fa': 'خیابان واشنگتن ۴۵۱۷، منچستر، کنتاکی\n۳۹۴۹۵',
    },
    'swclfvsw': {
      'en': 'Home ',
      'fa': 'خانه',
    },
    'crmg12jy': {
      'en': '2118 thornridge cir. syracuse, connecticut \n35624',
      'fa': '۲۱۱۸ ثورنریج سیراکیوز، کنتیکت\n۳۵۶۲۴',
    },
    'nuzt4ojt': {
      'en': '+ Add new address',
      'fa': '+ اضافه کردن آدرس جدید',
    },
  },
  // PasswordChange
  {
    '6jzbzlmu': {
      'en': 'Password changed!',
      'fa': 'رمز عبور تغییر کرد!',
    },
    't68uvs2f': {
      'en':
          'Your password has been changed successfull use your new password to login',
      'fa':
          'رمز عبور شما با موفقیت تغییر یافت. از رمز عبور جدید خود برای ورود استفاده کنید.',
    },
    '9z1whymb': {
      'en': 'Ok',
      'fa': 'باشه',
    },
  },
  // NotificationEmpty
  {
    '0qkduv6z': {
      'en': 'No notifications yet!',
      'fa': 'هنوز هیچ اطلاعیه‌ای ارسال نشده!',
    },
    'n1mo3i4f': {
      'en': 'We did not found any notification let’s \nstart exploring',
      'fa': 'ما هیچ اعلانی پیدا نکردیم، بیایید بررسی را شروع کنیم',
    },
  },
  // DropDownStandard
  {
    'ovads50a': {
      'en': 'I need help',
      'fa': 'من به کمک نیاز دارم',
    },
    'eij263gg': {
      'en': 'I want to offer help',
      'fa': 'می‌خواهم پیشنهاد کمک بدهم',
    },
    'pm50e711': {
      'en': 'I want to organize an event',
      'fa': 'می‌خواهم یک رویداد ترتیب بدهم',
    },
    'a1bonwie': {
      'en': 'I\'m giving away something ',
      'fa': 'دارم یه چیزی رو هدیه میدم',
    },
    '08ke4dvj': {
      'en': 'I\'m selling something',
      'fa': 'دارم یه چیزی میفروشم',
    },
    'jzwl48uh': {
      'en': 'I want to borrow',
      'fa': 'می‌خواهم قرض بگیرم',
    },
    'dnz0n838': {
      'en': 'I\'m lending something',
      'fa': 'من چیزی قرض می‌دهم',
    },
    '2q1acdpn': {
      'en': 'I\'m looking to buy (from Iran)',
      'fa': 'من به دنبال خرید (از ایران) هستم.',
    },
    'lfeu1v7l': {
      'en': 'I\'m looking to buy (from NL)',
      'fa': 'من به دنبال خرید هستم (از هلند)',
    },
    'j17b5y90': {
      'en': 'I need a professional (in Iran)',
      'fa': 'من به یک متخصص (در ایران) نیاز دارم',
    },
    'ipyqmw60': {
      'en': 'I need a professional (in NL)',
      'fa': 'من به یک متخصص (در هلند) نیاز دارم',
    },
  },
  // FavComponet
  {
    'jbhbbeak': {
      'en': 'Favorite',
      'fa': 'مورد علاقه',
    },
  },
  // OrderConfirm
  {
    'hs2wmnjg': {
      'en': 'Order successfull!',
      'fa': 'سفارش با موفقیت انجام شد!',
    },
    '6xiootek': {
      'en': 'Thank you so much for your order.',
      'fa': 'از دستور شما بسیار سپاسگزارم.',
    },
    '9bjkjlo7': {
      'en': 'Back to home',
      'fa': 'بازگشت به خانه',
    },
  },
  // OurMainHeader
  {
    'ryl4p4ag': {
      'en': '55',
      'fa': '۵۵',
    },
    'qu52uqkl': {
      'en': 'Trust score',
      'fa': 'امتیاز اعتماد',
    },
  },
  // PaymentComponent
  {
    '9ykaq9tl': {
      'en': 'Google pay',
      'fa': 'گوگل پی',
    },
    '7mhwa2bz': {
      'en': 'XXXX XXXX 125',
      'fa': 'XXXX XXXX 125',
    },
    '9y0ue7f4': {
      'en': 'Paypal',
      'fa': 'پی‌پال',
    },
    '6fnq4b68': {
      'en': 'XXXX XXXX 3698',
      'fa': 'XXXX XXXX ۳۶۹۸',
    },
    'uunvzk5e': {
      'en': 'Visa',
      'fa': 'ویزا',
    },
    'lgow3bp1': {
      'en': 'XXXX XXXX 3698',
      'fa': 'XXXX XXXX ۳۶۹۸',
    },
    'kvs22ls9': {
      'en': '+ Add new card',
      'fa': '+ اضافه کردن کارت جدید',
    },
  },
  // HomeComponet
  {
    '8xoxm2um': {
      'en': 'Find best one \nfurniture',
      'fa': 'بهترین مبلمان را پیدا کنید',
    },
    'xhm4wha5': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'oryz01sr': {
      'en': 'Furniture  in unique \nstyle',
      'fa': 'مبلمان با سبکی منحصر به فرد',
    },
    'jfnoilsc': {
      'en': 'Order Now',
      'fa': 'همین حالا سفارش دهید',
    },
    'epj8ectn': {
      'en': 'Categories',
      'fa': 'دسته‌ها',
    },
    'uumrfpkp': {
      'en': 'View all',
      'fa': 'مشاهده همه',
    },
    'm04ntfua': {
      'en': 'Trending products',
      'fa': 'محصولات پرطرفدار',
    },
    'jn9vdulr': {
      'en': 'View all',
      'fa': 'مشاهده همه',
    },
    'rt4qvee4': {
      'en': 'Explore more',
      'fa': 'بیشتر کاوش کنید',
    },
    'mvrq885a': {
      'en': 'View all',
      'fa': 'مشاهده همه',
    },
  },
  // DoneDialog
  {
    '57mfnl2n': {
      'en': 'Are you sure?',
      'fa': 'مطمئنی؟',
    },
    '2pbw2a4y': {
      'en': 'Are you sure you would like to remove this item from this order? ',
      'fa': 'آیا مطمئن هستید که می‌خواهید این مورد را از این سفارش حذف کنید؟',
    },
    '3desyw8s': {
      'en': 'No',
      'fa': 'خیر',
    },
    '1iycfzbj': {
      'en': 'Yes',
      'fa': 'بله',
    },
  },
  // Logout
  {
    'spvj04pz': {
      'en': 'Logout',
      'fa': 'خروج',
    },
    'ia1pz9go': {
      'en': 'Are you sure you want to logout?',
      'fa': 'آیا مطمئن هستید که می‌خواهید از سیستم خارج شوید؟',
    },
    'ugwbxf2n': {
      'en': 'No',
      'fa': 'خیر',
    },
    '9nmqr467': {
      'en': 'Yes',
      'fa': 'بله',
    },
  },
  // CartDialog
  {
    'gnyel4cc': {
      'en': 'Are you sure?',
      'fa': 'مطمئنی؟',
    },
    'ouwm4k95': {
      'en':
          'Are you sure you would like to delete this item from the shoping cart?',
      'fa': 'آیا از حذف این کالا از سبد خرید مطمئن هستید؟',
    },
    '6a9plz8m': {
      'en': 'No',
      'fa': 'خیر',
    },
    'fshk6jm2': {
      'en': 'Yes',
      'fa': 'بله',
    },
  },
  // EmptyData
  {
    '81n0qewt': {
      'en': 'No results found',
      'fa': 'هیچ نتیجه‌ای یافت نشد',
    },
    'ap9226j5': {
      'en':
          'Try using simpler search terms and then \nfiltering the correct tog',
      'fa':
          'سعی کنید از عبارات جستجوی ساده‌تر استفاده کنید و سپس تگ صحیح را فیلتر کنید',
    },
  },
  // SureDialog
  {
    'et2uvphw': {
      'en': 'Are you sure?',
      'fa': 'مطمئنی؟',
    },
    'x1dv3mze': {
      'en': 'Are you sure you would like to remove this item from this order? ',
      'fa': 'آیا مطمئن هستید که می‌خواهید این مورد را از این سفارش حذف کنید؟',
    },
    '62uhuxkp': {
      'en': 'No',
      'fa': 'خیر',
    },
    'muma8cun': {
      'en': 'Yes',
      'fa': 'بله',
    },
  },
  // ProfileComponet
  {
    'en780gdf': {
      'en': 'Profile',
      'fa': 'پروفایل',
    },
    'j4w08s29': {
      'en': 'John Abram',
      'fa': 'جان آبرام',
    },
    'ejlbbjsx': {
      'en': 'johnabram@gmail.com',
      'fa': 'johnabram@gmail.com',
    },
    'l7mt0wn3': {
      'en': 'My profile',
      'fa': 'پروفایل من',
    },
    'xfxg5sbj': {
      'en': 'Security',
      'fa': 'امنیت',
    },
    'z4l11x34': {
      'en': 'Settings',
      'fa': 'تنظیمات',
    },
    'pf1s4yua': {
      'en': 'My orders',
      'fa': 'سفارش‌های من',
    },
    '17oytv6v': {
      'en': 'Privacy policy',
      'fa': 'سیاست حفظ حریم خصوصی',
    },
    'utisgn27': {
      'en': 'Terms & conditions',
      'fa': 'شرایط و ضوابط',
    },
    '4ym96u4p': {
      'en': 'Log out',
      'fa': 'خروج از سیستم',
    },
  },
  // FeedBack
  {
    'p3u8bq3i': {
      'en': 'Your feedback submitted',
      'fa': 'بازخورد شما ارسال شد',
    },
    'h5p2gsrr': {
      'en': 'Your review has been submitted \nsuccessfully.',
      'fa': 'نقد شما با موفقیت ارسال شد.',
    },
    '2w8dd6cq': {
      'en': 'Ok',
      'fa': 'باشه',
    },
  },
  // Miscellaneous
  {
    'omgha2t3': {
      'en': 'Title2',
      'fa': 'عنوان۲',
    },
    'vwju2ofj': {
      'en': 'Title1',
      'fa': 'عنوان1',
    },
    '01ollrk2': {
      'en': 'Body',
      'fa': 'بدن',
    },
    'gey4csry': {
      'en': 'Button',
      'fa': 'دکمه',
    },
    'wxhwpq6v': {
      'en': 'LargeTitle',
      'fa': 'عنوان بزرگ',
    },
    'deb88d30': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
    },
    'h41az18a': {
      'en': 'email',
      'fa': 'ایمیل',
    },
    '57flb0js': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'n0cs6n6z': {
      'en': 'Title3',
      'fa': 'عنوان۳',
    },
    'h88a5tf5': {
      'en': 'Headline',
      'fa': 'تیتر',
    },
    'rw2ih3s4': {
      'en': 'Headline2',
      'fa': 'تیتر۲',
    },
    'wk295irs': {
      'en': 'Home',
      'fa': 'خانه',
    },
    'hmubrdhh': {
      'en': '',
      'fa': '',
    },
    'vytmfyvk': {
      'en': '',
      'fa': '',
    },
    't346prrm': {
      'en': '',
      'fa': '',
    },
    '47cwmfra': {
      'en': '',
      'fa': '',
    },
    'bkzk0pzb': {
      'en': '',
      'fa': '',
    },
    'v3j12ef2': {
      'en': '',
      'fa': '',
    },
    '50mnjf3u': {
      'en': '',
      'fa': '',
    },
    '97f9hqh2': {
      'en': '',
      'fa': '',
    },
    'h6sangyj': {
      'en': '',
      'fa': '',
    },
    'bxg3335f': {
      'en': '',
      'fa': '',
    },
    'gnals2t1': {
      'en': '',
      'fa': '',
    },
    'oinkk0nb': {
      'en': '',
      'fa': '',
    },
    '8uj1a0jo': {
      'en': '',
      'fa': '',
    },
    'k6bh436e': {
      'en': '',
      'fa': '',
    },
    '559g1o1z': {
      'en': '',
      'fa': '',
    },
    'xr7mbqkh': {
      'en': '',
      'fa': '',
    },
    'ft2472v6': {
      'en': '',
      'fa': '',
    },
    'mj6xv7lw': {
      'en': '',
      'fa': '',
    },
    'kefve5uc': {
      'en': '',
      'fa': '',
    },
    'd72qv7bu': {
      'en': '',
      'fa': '',
    },
    'fgjdu6a7': {
      'en': '',
      'fa': '',
    },
    'simsyf4s': {
      'en': '',
      'fa': '',
    },
    '33jz49ad': {
      'en': '',
      'fa': '',
    },
    '25nm38fm': {
      'en': '',
      'fa': '',
    },
    '7e31vege': {
      'en': '',
      'fa': '',
    },
    'ju3vxdoi': {
      'en': '',
      'fa': '',
    },
    'v8tch3nt': {
      'en': '',
      'fa': '',
    },
    '6w0ugb2r': {
      'en':
          'You can find your profile and your trust score here. We appreciate you communitty help and you will recive trust score from us as athank you. ',
      'fa':
          'شما می‌توانید پروفایل و امتیاز اعتماد خود را اینجا پیدا کنید. ما از کمک شما در انجمن قدردانی می‌کنیم و به عنوان تشکر، امتیاز اعتماد خود را از ما دریافت خواهید کرد.',
    },
    'susr9n4n': {
      'en': 'Welcome',
      'fa': 'خوش آمدید',
    },
    'd3f2b03m': {
      'en': 'Please select any of our main categories to start exploring.',
      'fa': 'لطفا برای شروع کاوش، هر یک از دسته‌های اصلی ما را انتخاب کنید.',
    },
    '12fyqovo': {
      'en': 'Main Categories',
      'fa': 'دسته‌های اصلی',
    },
    'ntdruu4f': {
      'en':
          'Make sure you check the tranding categories, We garentie you will find it intrsting. ',
      'fa':
          'حتماً دسته‌بندی‌های ترندینگ را بررسی کنید، ما تضمین می‌کنیم که آن را جذاب خواهید یافت.',
    },
    'b07jqo59': {
      'en': 'Don\'t Miss it',
      'fa': 'از دستش نده',
    },
    'irh58ss5': {
      'en':
          'This is a swip game which give you a fun expreiance buy going over all the items and events based on your intrest. ',
      'fa':
          'این یک بازی کشیدن انگشت است که به شما یک تجربه سرگرم کننده برای خرید می‌دهد و بر اساس علاقه شما، تمام اقلام و رویدادها را بررسی می‌کند.',
    },
    'jf2p2iby': {
      'en': 'Fun and easy way to swip through ',
      'fa': 'روشی سرگرم‌کننده و آسان برای ورق زدن صفحات',
    },
    't26my4kz': {
      'en':
          'Well we want everyone to know you helped the community. Make sure you like others to show appreciation.',
      'fa':
          'خب، ما می‌خواهیم همه بدانند که شما به جامعه کمک کرده‌اید. مطمئن شوید که دوست دارید دیگران قدردانی خود را نشان دهند.',
    },
    'weu704dt': {
      'en': 'Community Care',
      'fa': 'مراقبت‌های اجتماعی',
    },
  },
].reduce((a, b) => a..addAll(b));
