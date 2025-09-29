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
  // FAQ
  {
    'dhbx92pr': {
      'en': 'FAQ',
      'fa': 'سوالات متداول',
    },
    '24c4afj9': {
      'en': 'Whiat is Trust score?',
      'fa': 'امتیاز اعتماد (Trust Score) چقدر است؟',
    },
    'l1qm6pea': {
      'en':
          'Trust Score System\nThe Trust Score would be a dynamic value (e.g., 0–100) that indicates how trustworthy a user is, based on various factors.\n\n🔸 Factors That Could Influence Trust Score:\nVerified Identity\nGovernment ID, business license, phone number, etc.\n\n🔸 Customer Reviews & Ratings\nHigh ratings and positive feedback increase the score.\n\n🔸 Completed Transactions\nNumber and consistency of successful sales or services.\n\n🔸 Response Time & Engagement\nHow fast and often a user responds to messages or inquiries.\n\n🔸 Dispute History\nFewer disputes or issues with orders mean a higher score.\n\n🔸 Account Age & Activity\nOlder, consistently active accounts tend to be more trusted.\n\n🔸 Admin Verification\nFor certain professionals (e.g. a dentist), manual verification by Our team.(Contact our team)',
      'fa':
          'سیستم امتیاز اعتماد\nامتیاز اعتماد یک مقدار پویا (مثلاً 0 تا 100) خواهد بود که بر اساس عوامل مختلف، میزان قابل اعتماد بودن کاربر را نشان می‌دهد.\n\n\n🔸 عواملی که می‌توانند بر امتیاز اعتماد تأثیر بگذارند:\n\nهویت تأیید شده\nشناسه دولتی، مجوز کسب و کار، شماره تلفن و غیره\n\n🔸 نظرات و رتبه‌بندی‌های مشتری\nرتبه‌بندی‌های بالا و بازخورد مثبت، امتیاز را افزایش می‌دهد.\n\n\n🔸 تراکنش‌های تکمیل‌شده\nتعداد و تداوم فروش یا خدمات موفق.\n\n\n🔸 زمان پاسخگویی و تعامل\nسرعت و دفعات پاسخگویی کاربر به پیام‌ها یا سوالات.\n\n\n🔸 سابقه اختلاف نظر\nاختلاف نظرها یا مشکلات کمتر در سفارشات به معنای امتیاز بالاتر است.\n\n\n🔸 سن و فعالیت حساب\nحساب‌های قدیمی‌تر و فعال‌تر، معمولاً قابل اعتمادتر هستند.\n\n\n🔸 تأیید مدیریت\nبرای برخی از متخصصان (مثلاً دندانپزشک)، تأیید دستی توسط تیم ما. (با تیم ما تماس بگیرید)',
    },
    'dtpcil6r': {
      'en': 'How to become a Trust?',
      'fa': 'چگونه به یک تراست تبدیل شویم؟',
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
    'gvdgmual': {
      'en': 'Contact Yekja',
      'fa': 'تماس با یکجا',
    },
    'xelooj4q': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // Dashboard
  {
    'y27rul3e': {
      'en': 'Dashboard',
      'fa': 'داشبورد',
    },
    '3r5gd90h': {
      'en': 'Below is a summary of your day.',
      'fa': 'خلاصه‌ای از روز شما در زیر آمده است.',
    },
    'honzj49s': {
      'en': 'Reported Users',
      'fa': 'کاربران گزارش شده',
    },
    'a8s0jq7n': {
      'en': 'Reported Posts',
      'fa': 'پست‌های گزارش‌شده',
    },
    'bqpm7nju': {
      'en': '16',
      'fa': '۱۶',
    },
    'xe9yy4xg': {
      'en': 'Completed Tasks',
      'fa': 'وظایف انجام شده',
    },
    'trib0otj': {
      'en': 'User Acrivity',
      'fa': 'فعالیت کاربر',
    },
    '4g3g78nc': {
      'en': 'An overview of your route.',
      'fa': 'نمای کلی از مسیر شما.',
    },
    '59i64ufn': {
      'en': 'Route progress',
      'fa': 'پیشرفت مسیر',
    },
    'luw7diah': {
      'en': '12',
      'fa': '۱۲',
    },
    '2bodtbq0': {
      'en': 'Tasks to be completed',
      'fa': 'وظایفی که باید تکمیل شوند',
    },
    'w3s1tswi': {
      'en': 'Contact Messages',
      'fa': 'پیام‌های تماس',
    },
    'v3keodxf': {
      'en': 'Send at:',
      'fa': 'ارسال به:',
    },
    'zt64g53o': {
      'en': 'Task Type',
      'fa': 'نوع وظیفه',
    },
    'wwwqvc73': {
      'en': 'Task description here.',
      'fa': 'شرح وظایف اینجا.',
    },
    '5babgypu': {
      'en': 'Due:',
      'fa': 'موعد:',
    },
    'se5sinyl': {
      'en': 'Today, 6:20pm',
      'fa': 'امروز، ساعت ۱۸:۲۰',
    },
    'xqf0f5nk': {
      'en': 'Update',
      'fa': 'به‌روزرسانی',
    },
    'kcmsvvgv': {
      'en': '1',
      'fa': '۱',
    },
    'l5ch9txr': {
      'en': 'Recent Activity',
      'fa': 'فعالیت اخیر',
    },
    'zh98zvo3': {
      'en': 'Below is an overview of tasks & activity completed.',
      'fa': 'در زیر خلاصه‌ای از وظایف و فعالیت‌های انجام شده آمده است.',
    },
    'vhkxh9nm': {
      'en': 'Tasks',
      'fa': 'وظایف',
    },
    'htjdxa0n': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
    },
    'vh94losf': {
      'en': 'Launches',
      'fa': 'پرتاب‌ها',
    },
    '5rr1rii1': {
      'en': 'Last 30 Days',
      'fa': '۳۰ روز گذشته',
    },
    'd6pa0tus': {
      'en': 'Avg. Grade',
      'fa': 'میانگین درجه',
    },
    'ittjsdyx': {
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
  // ReportedPost
  {
    'fn7rbuop': {
      'en': 'Reported Posts',
      'fa': 'پست‌های گزارش‌شده',
    },
    'v4bgkf53': {
      'en': 'Make sure the users don\'t stay in reported state too long',
      'fa': 'مطمئن شوید که کاربران مدت زیادی در حالت گزارش‌شده نمی‌مانند.',
    },
    'yhwpofu5': {
      'en': 'Unblock',
      'fa': 'رفع انسداد',
    },
    'djmc2ax5': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // OnboardingPage
  {
    'fvqou22z': {
      'en': 'OFFER HELP, GET CLOSER',
      'fa': 'پیشنهاد کمک بدهید، نزدیک‌تر شوید',
    },
    'x5ipfs17': {
      'en':
          'Need help moving, repairing, or learning? Your community steps in — no pressure, just help.',
      'fa':
          'برای اسباب‌کشی، تعمیر یا یادگیری به کمک نیاز دارید؟ جامعه شما وارد عمل می‌شود - بدون هیچ فشاری، فقط کمک کنید.',
    },
    'dq5yb1i0': {
      'en': 'SWAP FREELY',
      'fa': 'آزادانه تعویض کنید',
    },
    'e8ck1z6d': {
      'en':
          'Swap items, skills or services — old-school style. Get what you need while passing along what you don’t.',
      'fa':
          'اقلام، مهارت‌ها یا خدمات را با هم عوض کنید - به سبک قدیمی. آنچه را که نیاز دارید، دریافت کنید و آنچه را که نیاز ندارید، به اشتراک بگذارید.',
    },
    'b8gufi8a': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ImageGalleryPage
  {
    'jzavtjcg': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // EventItmePage
  {
    'ihq6z2l7': {
      'en': 'New Comers Welcome Tour – Zaandam',
      'fa': 'تور خوش آمد گویی به تازه واردان – Zaandam',
    },
    '4b47z512': {
      'en': '230',
      'fa': '۲۳۰',
    },
    '8uuwoih6': {
      'en': '16',
      'fa': '۱۶',
    },
    'jyez8hqg': {
      'en': 'Every Friday, June 10 - Sept 30, 2025',
      'fa': 'هر جمعه، ۱۰ ژوئن - ۳۰ سپتامبر ۲۰۲۵',
    },
    'zgzw8om6': {
      'en': '14:00 - 16:00 ',
      'fa': '۱۴:۰۰ - ۱۶:۰۰',
    },
    '2p2vzywc': {
      'en': 'Windmill De Zoeker',
      'fa': 'آسیاب بادی دی زوکر',
    },
    '7055pg69': {
      'en': 'Kattenburgerstraat5, Zaandaam, NL',
      'fa': 'Kattenburgerstraat5، Zaandaam، NL',
    },
    'p3hgu7bk': {
      'en': 'Participate for',
      'fa': 'شرکت برای',
    },
    'sad49kdo': {
      'en': ' €15 ',
      'fa': '۱۵ یورو',
    },
    '36lo1k10': {
      'en': 'per person',
      'fa': 'به ازای هر نفر',
    },
    '7pq64pbr': {
      'en': ' €95 ',
      'fa': '۹۵ یورو',
    },
    'x0pefp0a': {
      'en': 'per group',
      'fa': 'به ازای هر گروه',
    },
    'dlcfidw0': {
      'en': 'Tom Hanks',
      'fa': 'تام هنکس',
    },
    'msy42f2i': {
      'en': 'Top Exchanger',
      'fa': 'صرافی برتر',
    },
    'vq33vbsn': {
      'en': 'DESCRIPTION',
      'fa': 'شرح',
    },
    '80mpb4qk': {
      'en':
          'Welcome to NL! If you live neaby (or have a plan to),  here is a chance to discover the charm of the Dutch countryside on this guided tour in Zaandam. Visit iconic windmills, explore traditional villages, and enjoy scenic views along the way. During the tour, we’ll stop for a relaxing break with authentic Turkish tea and fresh baklava — a sweet moment to enjoy and connect. Perfect for travelers seeking culture, nature, and local hospitality in one unforgettable experience.',
      'fa':
          'به هلند شمالی خوش آمدید! اگر در نزدیکی اینجا زندگی می‌کنید (یا قصد دارید به آنجا بروید)، این فرصتی است تا جذابیت‌های حومه هلند را در این تور با راهنما در زاندام کشف کنید. از آسیاب‌های بادی نمادین دیدن کنید، روستاهای سنتی را کشف کنید و از مناظر زیبا در طول مسیر لذت ببرید. در طول تور، برای استراحتی آرامش‌بخش با چای اصیل ترکی و باقلوا تازه توقف خواهیم کرد - لحظه‌ای شیرین برای لذت بردن و ارتباط برقرار کردن. ایده‌آل برای مسافرانی که به دنبال فرهنگ، طبیعت و مهمان‌نوازی محلی در یک تجربه فراموش‌نشدنی هستند.',
    },
    'cg9bonua': {
      'en': 'EVENT PARTICIPANTS',
      'fa': 'شرکت‌کنندگان رویداد',
    },
    'aec3sulw': {
      'en': 'Join others with shared interests and good vibes.',
      'fa': 'به دیگران با علایق مشترک و حس خوب بپیوندید.',
    },
    'yydu55h7': {
      'en': '45',
      'fa': '۴۵',
    },
    'dzuyi66h': {
      'en': 'Joining',
      'fa': 'پیوستن',
    },
    '7viwxc64': {
      'en': '3',
      'fa': '۳',
    },
    '3jbk7hbi': {
      'en': 'Min p',
      'fa': 'حداقل پ',
    },
    '7oom526x': {
      'en': '50',
      'fa': '۵۰',
    },
    'jj2j0c0t': {
      'en': 'Max p',
      'fa': 'حداکثر پ',
    },
    '04idx21p': {
      'en': 'Guests',
      'fa': 'مهمانان',
    },
    'cr7gr22a': {
      'en': 'Hosts',
      'fa': 'میزبان‌ها',
    },
    's2ptf6g9': {
      'en': '+ 13',
      'fa': '+ ۱۳',
    },
    '9vh06prn': {
      'en': 'See who\'s coming',
      'fa': 'ببین کی میاد؟',
    },
    '0713cvoi': {
      'en': '4.6',
      'fa': '۴.۶',
    },
    'cu24ges8': {
      'en': 'Based on 32 reviews',
      'fa': 'بر اساس ۳۲ نقد و بررسی',
    },
    'zvci263d': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'asot8dz4': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'qgsst55e': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'd0127ycu': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'whnl4div': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'aqmzn95o': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'sm5qfpl0': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'p80zp1s8': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'tbneab98': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'ww1g39y6': {
      'en': '',
      'fa': '',
    },
    'wybu2q8n': {
      'en': '',
      'fa': '',
    },
    't0gx5yvn': {
      'en': '',
      'fa': '',
    },
    '9okx54k2': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // IranNLItemPage
  {
    '698d8u6a': {
      'en': ' Biweekly Iran-NL Service',
      'fa': 'سرویس دوهفته‌ای ایران-هلند',
    },
    '9odoo7oj': {
      'en': '230',
      'fa': '۲۳۰',
    },
    'j1b3lfmx': {
      'en': '16',
      'fa': '۱۶',
    },
    'spgn74x5': {
      'en': 'Tehran',
      'fa': 'تهران',
    },
    '64c2tgov': {
      'en': 'Next shipment: Thursday, July 11, 2025',
      'fa': 'ارسال بعدی: پنجشنبه، ۱۱ جولای ۲۰۲۵',
    },
    'n3x0m4u8': {
      'en': 'Every 2 weeks',
      'fa': 'هر ۲ هفته',
    },
    '62g6ozol': {
      'en':
          'Cost depends on item price, weight, and volume. Final quote shared after your request',
      'fa':
          'هزینه بستگی به قیمت، وزن و حجم کالا دارد. قیمت نهایی پس از درخواست شما اعلام می‌شود.',
    },
    'r6wsjh6h': {
      'en':
          'I live in Tehran and offer a personal service to deliver what you need from Iran. I can also buy items from any Iranian store, market, or seller and send them to you in the Netherlands. \n\nYou send me your request, I buy it, pack it, and get it to you within 10–14 days.',
      'fa':
          'من در تهران زندگی می‌کنم و خدمات شخصی برای تحویل آنچه شما از ایران نیاز دارید ارائه می‌دهم. همچنین می‌توانم اقلامی را از هر فروشگاه، بازار یا فروشنده ایرانی خریداری کنم و آنها را برای شما در هلند ارسال کنم.\n\nشما درخواست خود را برای من ارسال می‌کنید، من آن را می‌خرم، بسته‌بندی می‌کنم و ظرف 10 تا 14 روز به شما تحویل می‌دهم.',
    },
    '5uv0g00r': {
      'en': 'What I Offer ',
      'fa': 'آنچه من ارائه می‌دهم',
    },
    '0t7y9vso': {
      'en': 'What You Submit',
      'fa': 'آنچه ارسال می‌کنید',
    },
    'bquhmqtu': {
      'en': 'Buy anything (legally allowed to ship)',
      'fa': 'هر چیزی بخرید (از نظر قانونی مجاز به ارسال است)',
    },
    '94sv7rn8': {
      'en': 'Pack items carefully',
      'fa': 'وسایل را با دقت بسته بندی کنید',
    },
    'z1kkdrjm': {
      'en': 'Propose the most cost-effective shipping methods',
      'fa': 'ارائه مقرون به صرفه ترین روش های حمل و نقل',
    },
    'scec8ibf': {
      'en': 'Budget estimate',
      'fa': 'برآورد بودجه',
    },
    '51327tnm': {
      'en': 'Notify you upon shipment',
      'fa': 'هنگام ارسال به شما اطلاع داده شود',
    },
    '14apyni8': {
      'en': 'A detailed description of what you need from Iran',
      'fa': 'شرح مفصلی از آنچه از ایران نیاز دارید',
    },
    'tscvf8mx': {
      'en': 'Online store link or pickup location',
      'fa': 'لینک فروشگاه آنلاین یا محل تحویل',
    },
    'jqrjrfpd': {
      'en': 'Quantity needed',
      'fa': 'مقدار مورد نیاز',
    },
    'nxzul2ll': {
      'en': 'Any special handling notes',
      'fa': 'هرگونه یادداشت ویژه در مورد نحوه‌ی جابجایی',
    },
    'tlwrqqe8': {
      'en': 'Your preferred delivery options',
      'fa': 'گزینه‌های تحویل ترجیحی شما',
    },
    '8pl0bxyw': {
      'en': 'How It Works',
      'fa': 'چگونه کار می‌کند؟',
    },
    '99hfqf63': {
      'en': '1',
      'fa': '۱',
    },
    'uw2ahlv2': {
      'en': 'Submit your request',
      'fa': 'درخواست خود را ارسال کنید',
    },
    'sh0ze098': {
      'en': '2',
      'fa': '۲',
    },
    'i6u59zgo': {
      'en': 'Get a cost estimate',
      'fa': 'برآورد هزینه دریافت کنید',
    },
    'qy1ukspa': {
      'en': '3',
      'fa': '۳',
    },
    '71e8esdk': {
      'en': 'Item purchased or collected in Iran',
      'fa': 'کالای خریداری شده یا جمع‌آوری شده در ایران',
    },
    'dpobm9vq': {
      'en': '4',
      'fa': '۴',
    },
    'ajpur35e': {
      'en': 'Confirmation & coordination',
      'fa': 'تایید و هماهنگی',
    },
    'es6w28rw': {
      'en': '5',
      'fa': '۵',
    },
    'ri59f6mb': {
      'en': 'Shipped on schedule',
      'fa': 'طبق برنامه ارسال شد',
    },
    '2pwt8h6f': {
      'en': '6',
      'fa': '۶',
    },
    'es5ev518': {
      'en': 'Customs & tracking update',
      'fa': 'به‌روزرسانی گمرک و ردیابی',
    },
    'o3i78q1l': {
      'en': '7',
      'fa': '۷',
    },
    'u007m8jl': {
      'en': 'Receive your item',
      'fa': 'کالای خود را دریافت کنید',
    },
    'bxpa1yr9': {
      'en': 'Get a free quote',
      'fa': 'یک نقل قول رایگان دریافت کنید',
    },
    '6mmu21ba': {
      'en': '4.9',
      'fa': '۴.۹',
    },
    'q7yoc0u8': {
      'en': 'Based on 88 reviews',
      'fa': 'بر اساس ۸۸ نظر',
    },
    'dkc514fo': {
      'en': 'Fatemeh',
      'fa': 'فاطمه',
    },
    'k8e7utvx': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'ovvoj9iq': {
      'en': 'My mother’s documents arrived safely – life saver!',
      'fa': 'مدارک مادرم به سلامت رسید - نجات‌بخش!',
    },
    'fwtj7adj': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'dunaq5y5': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    '6895axsg': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'oeux0bgg': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'yqigj1s8': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'udmofxx0': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    's3b9m6yo': {
      'en': 'FAQ',
      'fa': 'سوالات متداول',
    },
    '7ysebiyq': {
      'en': 'What items can be shipped?',
      'fa': 'چه اقلامی قابل ارسال هستند؟',
    },
    'thp1tfjk': {
      'en': 'How long does shipping take?',
      'fa': 'ارسال چقدر طول می‌کشد؟',
    },
    'wgckb9bk': {
      'en': 'What are the shipping costs?',
      'fa': 'هزینه‌های ارسال چقدر است؟',
    },
    'tz49t8iw': {
      'en': 'How do I track my order?',
      'fa': 'چگونه سفارش خود را پیگیری کنم؟',
    },
    '6uvnbyn8': {
      'en': 'What if my item doesn’t arrive?',
      'fa': 'اگر کالای من نرسد چه؟',
    },
    'pb9rabm4': {
      'en': 'Where will I receive my item?',
      'fa': 'کالای خود را از کجا دریافت خواهم کرد؟',
    },
    '0qauqxhu': {
      'en': 'Do I have to pay in advance?',
      'fa': 'آیا باید از قبل پرداخت کنم؟',
    },
    '1jkqiqoa': {
      'en': 'Is door-to-door delivery available?',
      'fa': 'آیا امکان تحویل درب منزل وجود دارد؟',
    },
    'agsj9qjo': {
      'en': 'Terms & Conditions',
      'fa': 'شرایط و ضوابط',
    },
    'jkcipc8d': {
      'en': '',
      'fa': '',
    },
    'k0dtzaoo': {
      'en': '',
      'fa': '',
    },
    'pnbxgmfu': {
      'en': '',
      'fa': '',
    },
    'oclkzflx': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // CreateItemSubCat
  {
    'sj1zehgy': {
      'en': 'Sub Category',
      'fa': 'زیر دسته',
    },
    'lf6kvle5': {
      'en': '3 of 6',
      'fa': '۳ از ۶',
    },
    'g8kc7wvh': {
      'en': 'Which category\nfits your post best?',
      'fa': 'کدام دسته بندی بیشتر با پست شما مطابقت دارد؟',
    },
    '5tosy1lm': {
      'en': 'Helps others find your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را پیدا کنند',
    },
    'csirahyr': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    'jedx2nxp': {
      'en': 'Post',
      'fa': 'پست',
    },
  },
  // CreateWishlist
  {
    'rbmqy5fa': {
      'en': 'Wishlist',
      'fa': 'لیست علاقه‌مندی‌ها',
    },
    'u8pq7w6y': {
      'en': '5 of 6',
      'fa': '۵ از ۶',
    },
    '987ihbyw': {
      'en': 'In a few lines, say what you need (items, services, or skills)',
      'fa':
          'در چند خط، آنچه را که نیاز دارید (اقلام، خدمات یا مهارت‌ها) بیان کنید.',
    },
    'ljhvx2e6': {
      'en': 'Your wishlist',
      'fa': 'لیست علاقه‌مندی‌های شما',
    },
    '70un5i6a': {
      'en':
          'E.g. Happy to trade for music (Setar) tutoring, Farsi books or a coffee maker.',
      'fa':
          'مثلاً: حاضرم با تدریس خصوصی موسیقی (سه‌تار)، کتاب فارسی یا قهوه‌ساز معاوضه کنم.',
    },
    'i2ffk8nn': {
      'en': 'Want more visibility?',
      'fa': 'می‌خواهید بیشتر دیده شوید؟',
    },
    'n7broe87': {
      'en': 'Add categories to help your post get found',
      'fa': 'برای کمک به دیده شدن پست خود، دسته بندی اضافه کنید',
    },
    'tjzx8b9z': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    'pegwryhf': {
      'en': 'Post',
      'fa': 'پست',
    },
  },
  // SignInConfirm
  {
    'm5qvsqog': {
      'en': 'Confirm Email',
      'fa': 'تأیید ایمیل',
    },
    '5rnnni2k': {
      'en': 'Please enter a username and email to continue',
      'fa': 'لطفا برای ادامه، نام کاربری و ایمیل خود را وارد کنید',
    },
    'h8nwoxdn': {
      'en': '',
      'fa': '',
    },
    'ep9mmsq3': {
      'en': 'Username',
      'fa': 'نام کاربری',
    },
    '0jzr1v97': {
      'en': 'Email',
      'fa': 'ایمیل',
    },
    'f9e65zx9': {
      'en': 'Password',
      'fa': 'رمز عبور',
    },
    'xhzqr4bk': {
      'en': 'Username is required',
      'fa': 'نام کاربری الزامی است',
    },
    'mm8x2xit': {
      'en': 'At least 4 characters are required',
      'fa': 'حداقل ۴ کاراکتر مورد نیاز است',
    },
    'c1vrjuyc': {
      'en': 'Max 12 characters are required',
      'fa': 'حداکثر ۱۲ کاراکتر مورد نیاز است',
    },
    'fqqtjta3': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '77e8urzk': {
      'en': 'Email is required',
      'fa': 'ایمیل الزامی است',
    },
    'ed0qiknp': {
      'en': 'Please enter a valid email address',
      'fa': 'لطفا یک آدرس ایمیل معتبر وارد کنید',
    },
    '2wawja0q': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '5vqq1v8g': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    'c1473phw': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ForgotPasswordPage
  {
    's3o2ku59': {
      'en': 'Forgot Password',
      'fa': 'رمز عبور را فراموش کرده‌ام',
    },
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
  // PreviewPost
  {
    'f3ldau17': {
      'en': 'This is a Preview',
      'fa': 'این یک پیش‌نمایش است',
    },
    'pk7ai9ce': {
      'en': 'Value hint ',
      'fa': 'اشاره به ارزش',
    },
    'jf6laf3h': {
      'en': '(check here)',
      'fa': '(اینجا را بررسی کنید)',
    },
    'qzvhf54q': {
      'en': 'Value hint',
      'fa': 'اشاره به ارزش',
    },
    '8m5rehpy': {
      'en': 'DESCRIPTION',
      'fa': 'شرح',
    },
    'mst2auf9': {
      'en': 'your review score',
      'fa': 'امتیاز بررسی شما',
    },
    'ceeh9fb2': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'آرزوی تبادل من',
    },
    'iwovhce9': {
      'en': 'Fresh start',
      'fa': 'شروع تازه',
    },
    'cga41mte': {
      'en': 'Publish',
      'fa': 'منتشر کردن',
    },
    '0tsng2mu': {
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
  // CreateItemCat
  {
    '3kfvdqz3': {
      'en': 'Listing type',
      'fa': 'نوع آگهی',
    },
    '44ke00e3': {
      'en': '2 of 6',
      'fa': '۲ از ۶',
    },
    '40tnrzir': {
      'en': 'What would you\nlike to do?',
      'fa': 'دوست داری چه کار کنی؟',
    },
    'vewqt7ds': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    '01wcpyj1': {
      'en': 'Post',
      'fa': 'پست',
    },
  },
  // CreateItemImages
  {
    'l4dfx6wn': {
      'en': 'Images',
      'fa': 'تصاویر',
    },
    'ubh8qc5e': {
      'en': '6 of 6',
      'fa': '۶ از ۶',
    },
    'nnd68vi1': {
      'en': 'Upload photos',
      'fa': 'آپلود عکس',
    },
    's1qkdor4': {
      'en': 'Add up to 4 photos',
      'fa': 'حداکثر ۴ عکس اضافه کنید',
    },
    'klkdc69y': {
      'en': 'See Preview',
      'fa': 'پیش‌نمایش را ببینید',
    },
    'dd7lcje3': {
      'en': 'Post',
      'fa': 'پست',
    },
  },
  // ChangePasswordPage
  {
    '13hkjxzm': {
      'en': 'Change Password',
      'fa': 'تغییر رمز عبور',
    },
    'vihtivjk': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    'yp6inssm': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
    },
    'ao0xte64': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'lwkof6wj': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
    },
    'kmgxcfsd': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
    '8jck5xal': {
      'en': 'Please  enter valid new password.',
      'fa': 'لطفا رمز عبور جدید معتبری وارد کنید.',
    },
    '9amewow5': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'w5i7eiux': {
      'en': 'Please  enter valid confirm password.',
      'fa': 'لطفا رمز عبور معتبر را وارد کنید.',
    },
    'zcnl34nd': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'q1jzr6vg': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // EditPost
  {
    'l0rjslcm': {
      'en': 'Value hint ',
      'fa': 'اشاره به ارزش',
    },
    '84zk9qfq': {
      'en': '(check here)',
      'fa': '(اینجا را بررسی کنید)',
    },
    'v5u8iq07': {
      'en': 'Value hint',
      'fa': 'اشاره به ارزش',
    },
    'ivb2hdm4': {
      'en': 'DESCRIPTION',
      'fa': 'شرح',
    },
    '31zmlj3e': {
      'en': 'your review score',
      'fa': 'امتیاز بررسی شما',
    },
    'ys4fo4tl': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'آرزوی تبادل من',
    },
    'rwziirc6': {
      'en': 'Delete',
      'fa': 'حذف',
    },
    '077lbh5r': {
      'en': 'Update',
      'fa': 'به‌روزرسانی',
    },
    'ru8iak45': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // OverviewMarket
  {
    '1suwvi7l': {
      'en': 'Items for Exchange',
      'fa': 'اقلام برای تبادل',
    },
    'qg11nzfg': {
      'en': 'Borrow\nRequests',
      'fa': 'درخواست‌های امانت',
    },
    '75la51ou': {
      'en': 'Give Away',
      'fa': 'هدیه دهید',
    },
    'enirg6xf': {
      'en': '(Free Items)',
      'fa': '(اقلام رایگان)',
    },
    'ws4n3vf5': {
      'en': 'Items for\nRent',
      'fa': 'اقلام برای اجاره',
    },
    'ck9c21g1': {
      'en': 'Job\nOffers',
      'fa': 'پیشنهادهای شغلی',
    },
    'v8cw56zz': {
      'en': 'Top Categories',
      'fa': 'دسته بندی های برتر',
    },
    'x72ccop9': {
      'en': 'Categories members like the most',
      'fa': 'دسته بندی هایی که اعضا بیشتر دوست دارند',
    },
    '4sc0hale': {
      'en': 'Popular Posts',
      'fa': 'پست‌های محبوب',
    },
    '3s3e80l6': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'pyjczjre': {
      'en': 'Most liked posts by  the community members',
      'fa': 'پست‌های پربازدید توسط اعضای انجمن',
    },
    '52evyl8t': {
      'en': 'New Exchanges',
      'fa': 'صرافی‌های جدید',
    },
    'ntlanv5q': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'j289ikv7': {
      'en': 'Most recent items offered for exchange',
      'fa': 'جدیدترین اقلام ارائه شده برای تعویض',
    },
    '9q0v7x9a': {
      'en': 'New Free Items',
      'fa': 'موارد رایگان جدید',
    },
    'ov2ewz6k': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'f6nhbrbx': {
      'en': 'Most recent items to give away for free ',
      'fa': 'جدیدترین اقلام برای اهدای رایگان',
    },
    'qd2gnjro': {
      'en': 'Community Market',
      'fa': 'بازار محلی',
    },
    'acanui6t': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // OverviewCare
  {
    '4f31r95c': {
      'en': 'Help\nRequests',
      'fa': 'درخواست‌های کمک',
    },
    'wrgp7a0a': {
      'en': 'Help\nOffers',
      'fa': 'کمک\nپیشنهادات',
    },
    '037amlyc': {
      'en': 'Top Categories',
      'fa': 'دسته بندی های برتر',
    },
    '3b4w4odm': {
      'en': 'Categories members like the most',
      'fa': 'دسته بندی هایی که اعضا بیشتر دوست دارند',
    },
    'tlwgczrq': {
      'en': 'Popular Posts',
      'fa': 'پست‌های محبوب',
    },
    'vktu3546': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'sxc6153h': {
      'en': 'Most liked posts by  the community members',
      'fa': 'پست‌های پربازدید توسط اعضای انجمن',
    },
    'h01izxww': {
      'en': 'New Help Requests',
      'fa': 'درخواست‌های کمک جدید',
    },
    'vuta9zjn': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    '8dcnikak': {
      'en': 'Most recent posts asking for help',
      'fa': 'جدیدترین پست‌ها درخواست کمک',
    },
    'qdios0ta': {
      'en': 'New Help Offers',
      'fa': 'پیشنهادات جدید کمک',
    },
    'jkkdwa93': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'monqa5zf': {
      'en': 'Most recent posts offering help',
      'fa': 'جدیدترین پست‌های ارائه دهنده کمک',
    },
    '60czvw6q': {
      'en': 'Community Care',
      'fa': 'مراقبت‌های اجتماعی',
    },
    'o0cqrexj': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ResetPasswordPage
  {
    'qvyltjge': {
      'en': 'Reset Password',
      'fa': 'بازنشانی رمز عبور',
    },
    '6baohfcj': {
      'en': 'Create a new password to log in',
      'fa': 'برای ورود به سیستم، رمز عبور جدیدی ایجاد کنید',
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
  // CreateItemDetail
  {
    '5twehhys': {
      'en': 'Details',
      'fa': 'جزئیات',
    },
    'h8xmok6d': {
      'en': '4 of 6',
      'fa': '۴ از ۶',
    },
    'jawfthpq': {
      'en': 'Complete the details\nof your post',
      'fa': 'جزئیات پست خود را تکمیل کنید',
    },
    'zjl6s1j8': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
    },
    'zf1aquhr': {
      'en': 'Title',
      'fa': 'عنوان',
    },
    'gm5k303k': {
      'en': 'Description',
      'fa': 'توضیحات',
    },
    'dm49jmti': {
      'en': 'Value',
      'fa': 'ارزش',
    },
    'z5jh6nb5': {
      'en': 'Delivery',
      'fa': 'تحویل',
    },
    'csa7xqlk': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    'k1h2s54o': {
      'en': 'Post',
      'fa': 'پست',
    },
  },
  // ProfileExtended
  {
    'fweal07j': {
      'en': 'Posts',
      'fa': 'پست‌ها',
    },
    'srw7h0cy': {
      'en': 'Favorites',
      'fa': 'موارد دلخواه',
    },
    '3tbjy6b8': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
    },
    '47ohilj6': {
      'en': 'Chats',
      'fa': 'چت‌ها',
    },
    '296bw0rg': {
      'en': '',
      'fa': 'خانه',
    },
  },
  // SignUpPage
  {
    'w51ndrcz': {
      'en': 'Create an account',
      'fa': 'ایجاد حساب کاربری',
    },
    '4z21d4lm': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
    },
    '7256pz7h': {
      'en': 'Username',
      'fa': 'نام کاربری',
    },
    'l59oh5jc': {
      'en': 'Email',
      'fa': 'ایمیل',
    },
    '17880f1u': {
      'en': 'Password',
      'fa': 'رمز عبور',
    },
    '1256s0cp': {
      'en': 'Confirm Password',
      'fa': 'تأیید رمز عبور',
    },
    'rl6es88l': {
      'en': 'Password dosen\'t match.',
      'fa': 'رمز عبور مطابقت ندارد.',
    },
    'ae4rvotw': {
      'en': 'User name is invalid',
      'fa': 'نام کاربری نامعتبر است',
    },
    '9yvyvlpk': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '5gfprwht': {
      'en': 'Please enter a valid email address.',
      'fa': 'لطفا یک آدرس ایمیل معتبر وارد کنید.',
    },
    'szbz780w': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'ckanrmbh': {
      'en': 'Minimum 6 characters are required.',
      'fa': 'حداقل ۶ کاراکتر مورد نیاز است.',
    },
    'h40f5p5q': {
      'en':
          '- At least one uppercase letter\n- At least one digit\n- At least 8 characters ',
      'fa': '- حداقل یک حرف بزرگ\n- حداقل یک رقم\n- حداقل ۸ کاراکتر',
    },
    'uqmqpy8n': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '1nu2760r': {
      'en': 'Minimum 6 characters are required.',
      'fa': 'حداقل ۶ کاراکتر مورد نیاز است.',
    },
    '1ges8uvu': {
      'en':
          '- At least one uppercase letter\n\n- At least one digit\n\n- At least 8 characters ',
      'fa': '- حداقل یک حرف بزرگ\n\n- حداقل یک رقم\n\n- حداقل ۸ کاراکتر',
    },
    'mebfhwgq': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'q3xjm17v': {
      'en': 'OR',
      'fa': 'یا',
    },
    'er6ptcif': {
      'en': 'Continue as a Gust',
      'fa': 'به عنوان یک تندباد ادامه دهید',
    },
    'eo7evm6p': {
      'en': 'Already have an account? ',
      'fa': 'قبلاً حساب کاربری دارید؟',
    },
    'vk8yd8no': {
      'en': ' Sign In here',
      'fa': 'اینجا وارد شوید',
    },
    '2g978126': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ReportedUser
  {
    '3z4oqpvn': {
      'en': 'Reported Users',
      'fa': 'کاربران گزارش شده',
    },
    'z0xpmlax': {
      'en': 'Make sure the users don\'t stay in reported state too long',
      'fa': 'مطمئن شوید که کاربران مدت زیادی در حالت گزارش‌شده نمی‌مانند.',
    },
    '5dcfcmeh': {
      'en': 'Unblock',
      'fa': 'رفع انسداد',
    },
    '48c96pal': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // SignInPage
  {
    '3yjo0udr': {
      'en': 'Welcome Back',
      'fa': 'خوش آمدید',
    },
    '61yuoo32': {
      'en': 'If your email isn’t verified, ',
      'fa': 'اگر ایمیل شما تأیید نشده است،',
    },
    '1pylrdnu': {
      'en': 'click here.',
      'fa': 'اینجا کلیک کنید.',
    },
    '9amiwbff': {
      'en': '',
      'fa': '',
    },
    'sdree3ti': {
      'en': 'Email',
      'fa': 'ایمیل',
    },
    'xpgw6kd9': {
      'en': 'Password',
      'fa': 'رمز عبور',
    },
    'i3al17a9': {
      'en': 'Sign In',
      'fa': 'ورود',
    },
    'nxmvn4ld': {
      'en': 'Forgot password? ',
      'fa': 'رمز عبور را فراموش کرده‌اید؟',
    },
    'btvjsow4': {
      'en': 'Click here',
      'fa': 'اینجا کلیک کنید',
    },
    'c0foq102': {
      'en': 'OR',
      'fa': 'یا',
    },
    'qqhkk63r': {
      'en': 'No account yet? ',
      'fa': 'هنوز حساب کاربری ندارید؟',
    },
    'oc6h6d27': {
      'en': 'Sign Up',
      'fa': 'ثبت نام',
    },
    't4mxpixd': {
      'en': 'Continute as a ',
      'fa': 'ادامه به عنوان',
    },
    'c1gzecba': {
      'en': 'Guest user',
      'fa': 'کاربر مهمان',
    },
    '0rujztpm': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ProductDetail
  {
    '2rqgmz8p': {
      'en': 'Value hint ',
      'fa': 'اشاره به ارزش',
    },
    'vmm70xk5': {
      'en': '(check here)',
      'fa': '(اینجا را بررسی کنید)',
    },
    'lfzko40i': {
      'en': 'Value hint',
      'fa': 'اشاره به ارزش',
    },
    'ajx9fsxv': {
      'en': 'DESCRIPTION',
      'fa': 'شرح',
    },
    'lbvm96he': {
      'en': '4.3',
      'fa': '۴.۳',
    },
    'lo8jmg0v': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'آرزوی تبادل من',
    },
    '6g2h5fom': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
    },
    'ptcsx6q0': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    '3p6focx2': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'fpajv90g': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'h9wvx9b7': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'sxmf1q6b': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    '09p29kmm': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    '1pz8zgqt': {
      'en': 'Olivia M.',
      'fa': 'اولیویا م.',
    },
    'cywr18k4': {
      'en': 'June 2023',
      'fa': 'ژوئن ۲۰۲۳',
    },
    'xi1ch7sr': {
      'en':
          'Tom Hanks is a natural storyteller. His warmth, humor, and sincerity made every moment engaging. I could listen to him for hours!  I could listen to him for hours! I could listen to him for hours!',
      'fa':
          'تام هنکس یک قصه‌گوی ذاتی است. گرمی، شوخ‌طبعی و صداقت او هر لحظه را جذاب می‌کرد. می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم! می‌توانستم ساعت‌ها به حرف‌هایش گوش بدهم!',
    },
    'onhh13rd': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ScoringSystem
  {
    'o0gdhtwy': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ContactYEKJA
  {
    'uaue3xf2': {
      'en': 'Welcome to support ',
      'fa': 'به پشتیبانی خوش آمدید',
    },
    'b3om7lkw': {
      'en': 'Make sure you check our FAQ',
      'fa': 'حتماً سوالات متداول ما را بررسی کنید',
    },
    'ydnrk5zy': {
      'en': 'Call Us',
      'fa': 'با ما تماس بگیرید',
    },
    'ofdaiisb': {
      'en': 'Search FAQs',
      'fa': 'سوالات متداول جستجو',
    },
    'zlr86zaw': {
      'en': '',
      'fa': '',
    },
    'uy7ff9ps': {
      'en': 'Choose a relevant subject',
      'fa': 'یک موضوع انتخاب کنید',
    },
    'ol3f2ple': {
      'en': 'Search...',
      'fa': 'جستجو...',
    },
    'rhw1og4g': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
    },
    '9ptgnueo': {
      'en': 'Option 2',
      'fa': 'گزینه ۲',
    },
    '1jg9wm4c': {
      'en': 'Option 3',
      'fa': 'گزینه ۳',
    },
    '7p9q5poi': {
      'en':
          'Please provide description of your inquiry here. We will do our best to come back to you as soon as possible. ',
      'fa': 'شرح مختصری از نحوه کمک رسانی ما...',
    },
    'qc3iypvs': {
      'en': 'Upload image',
      'fa': 'آپلود تصویر',
    },
    'ziper6ve': {
      'en': 'Submit ',
      'fa': 'ارسال',
    },
    'md9u0vgx': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // chatdetail
  {
    'v838atpy': {
      'en': ' Request a review',
      'fa': 'درخواست بررسی',
    },
    'swnn4nwr': {
      'en': '',
      'fa': '',
    },
    'm04p2p42': {
      'en': 'Type here',
      'fa': 'اینجا تایپ کنید',
    },
    'ixvb7rf1': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // CreateItemMainCat
  {
    's59m0mxv': {
      'en': 'Main Category',
      'fa': 'دسته اصلی',
    },
    'cisjybuu': {
      'en': '1 of 6',
      'fa': '۱ از ۶',
    },
    '5ih7nup2': {
      'en': 'What’s your\nnew post about?',
      'fa': 'پست جدیدت در مورد چیه؟',
    },
    'k4ql5elb': {
      'en': 'Community Care',
      'fa': 'مراقبت‌های اجتماعی',
    },
    'errx5eou': {
      'en': 'Exchange, trade, rent',
      'fa': 'معاوضه، تجارت، اجاره',
    },
    '4qyffrty': {
      'en': 'Community Market',
      'fa': 'بازار محلی',
    },
    '9exgqc2a': {
      'en': 'Offer or ask for help',
      'fa': 'پیشنهاد یا درخواست کمک',
    },
    'beewftzt': {
      'en': 'Next',
      'fa': 'بعدی',
    },
    'kg4285e0': {
      'en': 'Home',
      'fa': '',
    },
  },
  // Swipable
  {
    'c9tbt5vm': {
      'en': 'Discover Local \nOffers & Requests',
      'fa': 'پیشنهادات و درخواست‌های محلی را کشف کنید',
    },
    '507gxblh': {
      'en': 'Swipe to explore — tap any to learn more',
      'fa':
          'برای کاوش، انگشت خود را بکشید - برای کسب اطلاعات بیشتر، روی هر کدام ضربه بزنید',
    },
    'bifytvxz': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // HomePage
  {
    'md4unc80': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'uecq8i6w': {
      'en': 'What are you looking for today?',
      'fa': 'امروز چی می‌خوای پیدا کنی؟',
    },
    'rj83omaj': {
      'en': 'COMMUNITY CARE',
      'fa': 'همیاری  رایگان',
    },
    'c8a9ytss': {
      'en': 'COMMUNITY MARKET',
      'fa': 'دادو ستد محلی',
    },
    '9c4zv4ey': {
      'en': 'Hang tight! This feature is launching soon.',
      'fa': ' این ویژگی به زودی راه‌اندازی می‌شود.',
    },
    'w0qwb82n': {
      'en': 'IRAN – NL',
      'fa': 'خدمات ایران – هلند',
    },
    'clpmwr0u': {
      'en': 'Hang tight! This feature is launching soon.',
      'fa': ' این ویژگی به زودی راه‌اندازی می‌شود.',
    },
    'abmw58ok': {
      'en': 'EVENTS',
      'fa': 'رویدادها',
    },
    'hmb7gki5': {
      'en': 'Trending Categories',
      'fa': 'دسته بندی های پرطرفدار',
    },
    'f6xt57yr': {
      'en': 'See all',
      'fa': 'همه را ببینید',
    },
    'lnqdg5mp': {
      'en': 'Swap in 4 Easy Steps',
      'fa': 'تعویض در ۴ مرحله آسان',
    },
    'fsf3mcvr': {
      'en': 'Choose where your post belongs',
      'fa': 'انتخاب کنید که پست شما به کجا تعلق دارد',
    },
    'xvibk9g9': {
      'en': 'Add details and pics',
      'fa': 'جزئیات و تصاویر را اضافه کنید',
    },
    '6jcii098': {
      'en': 'Say what you want in return',
      'fa': 'در عوض هرچی دلت میخواد بگو',
    },
    'o4t933ga': {
      'en': 'Your post is live!',
      'fa': 'پست شما زنده است!',
    },
    'pfhno2h7': {
      'en': '1. Share an item, skill, or service',
      'fa': '۱. یک کالا، مهارت یا خدمات را به اشتراک بگذارید',
    },
    'v9eb6c1w': {
      'en':
          'E.g. Post to exchange  your bike, language lessons, or home repairs.',
      'fa': 'من یه کوله و چنتا کتاب دارم میدم و دنبال یکییم ساز یادم بده',
    },
    '6s56pbb1': {
      'en': '2. Receive offers & discuss',
      'fa':
          '۲. تو پیام میدی:  «ساز بلد نیستم، ولی می‌تونم زبان یا طراحی یاد بدم.',
    },
    '0n59oasi': {
      'en':
          'E.g.  check if they have what you need. If not, suggest other items until you both agree.',
      'fa': 'با هم حرف می‌زنیم، می‌بینیم چی به کارمون میاد',
    },
    'h0ay052s': {
      'en': '3. Meet up in person & swap ',
      'fa': '۳. اگه شد حضوری ملاقات میکنیم',
    },
    'iiu0tp23': {
      'en':
          'It’s always nice to get out, meet in person, swap your items, and end the exchange with a smile.',
      'fa':
          'اگه شد حضوری ملاقات میکنیم و به توافق میرسیم اگرم  نشد کمی پول اضافه می‌کنیم ',
    },
    '2mbe77a2': {
      'en': '4. Leave a review ',
      'fa': '۴. امتیاز و نظر میدیم',
    },
    'r365vlqj': {
      'en': 'Build trust and make it easier for others to find you both.',
      'fa': 'اینطوری بقیه توی یکجا راحت‌تر ما رو پیدا می‌کنن',
    },
    'gpiujku4': {
      'en': 'What’s Around You?',
      'fa': 'اطراف شما چه خبر است؟',
    },
    '353k0b4j': {
      'en': 'Start',
      'fa': 'شروع',
    },
    'a23ujna3': {
      'en': 'Community Shoutouts',
      'fa': 'قدردانی ها',
    },
    '6lyr5um7': {
      'en': 'the community',
      'fa': 'خانواده‌ی بزرگ ما',
    },
    'qv3strvd': {
      'en': '',
      'fa': '',
    },
  },
  // SearchPage
  {
    'qlxrtif2': {
      'en': 'Help\nRequests',
      'fa': 'درخواست‌های \nکمک',
    },
    'zxm6qhi3': {
      'en': 'Help\nOffers',
      'fa': 'پیشنهادهای\nکمک',
    },
    '7kdb5dt1': {
      'en': 'Items for Exchange',
      'fa': 'کالاها یا خدمات\nبرای تبادل',
    },
    'iqukbo0v': {
      'en': 'Borrow\nRequests',
      'fa': 'درخواست‌های \nامانت',
    },
    'ix9u3yl7': {
      'en': 'Items for\nFree',
      'fa': 'اقلام موجود\nرایگان',
    },
    'h96yelv3': {
      'en': 'Searh Results',
      'fa': 'نتایج جستجو',
    },
    '1je8wpdn': {
      'en': 'Filter',
      'fa': 'فیلتر',
    },
    'qrvkaa77': {
      'en': '',
      'fa': '',
    },
    '7uu9uavl': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'q4ar00pn': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
    },
    '0dfm2rcn': {
      'en': '',
      'fa': '',
    },
    'kd5mjjjg': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    '8b3no9i7': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
    },
    'gak00fpr': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // ChatPage
  {
    'au6wzutq': {
      'en': 'Chats',
      'fa': '',
    },
    'cyoqgt88': {
      'en': 'All',
      'fa': '',
    },
    'ktmh8zc4': {
      'en': 'My Posts',
      'fa': '',
    },
    's5akc9nm': {
      'en': 'Other\'s Posts',
      'fa': '',
    },
    'o9qneast': {
      'en': 'Yekja Help',
      'fa': '',
    },
    'fyic4jxi': {
      'en': 'All',
      'fa': '',
    },
    '5g28h2j2': {
      'en': 'Home',
      'fa': '',
    },
  },
  // ProfilePage
  {
    'wi68hahy': {
      'en': 'Likes',
      'fa': 'لایک‌ها',
    },
    'jzc0o03k': {
      'en': '3',
      'fa': '۳',
    },
    'yhmczqlg': {
      'en': '12 points to reach level 4',
      'fa': '۱۲ امتیاز برای رسیدن به سطح ۴',
    },
    '9ey4rtob': {
      'en': '',
      'fa': '',
    },
    'dcb0abt1': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
    },
    '2808vfr9': {
      'en': 'Posts',
      'fa': 'پست‌ها',
    },
    'xt0uhk7r': {
      'en': 'See All',
      'fa': 'همه را ببینید',
    },
    'oq2hc9vq': {
      'en': 'Favorites',
      'fa': 'موارد دلخواه',
    },
    'fd2re1c8': {
      'en': 'See All',
      'fa': 'همه را ببینید',
    },
    'h7butxb7': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
    },
    '9wndti6n': {
      'en': 'See All',
      'fa': 'همه را ببینید',
    },
    'c9j6hm84': {
      'en': 'Chats',
      'fa': 'چت‌ها',
    },
    'j6r5bq14': {
      'en': 'See All',
      'fa': 'همه را ببینید',
    },
    'yq4fqtye': {
      'en': '',
      'fa': 'خانه',
    },
  },
  // EditProfilePage
  {
    'iw57ng60': {
      'en': 'Personal',
      'fa': 'شخصی',
    },
    '186mo8c0': {
      'en': 'User name',
      'fa': 'نام کاربری',
    },
    '2kb0q1ca': {
      'en': 'A unique name to  display on your profile.',
      'fa': 'یک نام منحصر به فرد برای نمایش در پروفایل شما.',
    },
    'z131ngdr': {
      'en': 'First name',
      'fa': 'نام کوچک',
    },
    'd7mg7u6o': {
      'en': 'First name',
      'fa': 'نام کوچک',
    },
    'y5vpec7k': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
    },
    'iy6cw8jd': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
    },
    'gw29664w': {
      'en': 'Email',
      'fa': 'ایمیل',
    },
    'juviv350': {
      'en': 'example@example.com',
      'fa': 'example@example.com',
    },
    'vztgezxv': {
      'en': 'PhoneNumber',
      'fa': 'شماره تلفن',
    },
    'jhyzm45r': {
      'en': '0612345678',
      'fa': '۰۶۱۲۳۴۵۶۷۸',
    },
    'au2l0z07': {
      'en': 'City',
      'fa': 'شهر',
    },
    'ogj0tpug': {
      'en': 'City',
      'fa': 'شهر',
    },
    'v1s90rdp': {
      'en': 'Biography',
      'fa': 'زندگینامه',
    },
    'tf0ul5ip': {
      'en': 'Let everyone know about you.',
      'fa': 'بگذارید همه از شما خبر داشته باشند.',
    },
    'kzqn68ob': {
      'en': 'This field is required.',
      'fa': 'این فیلد الزامی است.',
    },
    'x0qbl9nx': {
      'en': 'Minimum 3 letters are required.',
      'fa': 'حداقل ۳ حرف الزامی است.',
    },
    '5w04aalv': {
      'en': 'user name is too lang.',
      'fa': 'نام کاربری خیلی طولانی است.',
    },
    '3jdly5te': {
      'en': 'Only letter(A-Z) are valid.',
      'fa': 'فقط حروف (A-Z) معتبر هستند.',
    },
    '7pbg3zwd': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'uuho7t2x': {
      'en': 'firstName is required',
      'fa': 'نام و نام خانوادگی الزامی است',
    },
    'vck7587e': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'ysa8o678': {
      'en': 'This field is required',
      'fa': 'این فیلد الزامی است',
    },
    '9mmnqcod': {
      'en': 'Please only user letter.',
      'fa': 'لطفا فقط نامه کاربر.',
    },
    '2dya79z6': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'xm54x3n1': {
      'en': 'Please enter valid Email address.',
      'fa': 'لطفا آدرس ایمیل معتبری وارد کنید.',
    },
    'cjui5wmm': {
      'en': 'This field is required',
      'fa': 'این فیلد الزامی است',
    },
    'bzz1mpym': {
      'en': 'Please enter valid Email address.',
      'fa': 'لطفا آدرس ایمیل معتبری وارد کنید.',
    },
    'pfi2e7s4': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'n8h9b885': {
      'en': 'This field is required.',
      'fa': 'این فیلد الزامی است.',
    },
    '45tsdecd': {
      'en': 'Use a valid phone number. e.g 0612345678',
      'fa': 'از یک شماره تلفن معتبر استفاده کنید. مثلاً 0612345678',
    },
    '59crfj9j': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    'f0jb91p1': {
      'en': 'user_city is required',
      'fa': 'user_city الزامی است',
    },
    'rkk7ejjr': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '4z0aqe0c': {
      'en': 'Too many characters.',
      'fa': 'تعداد کاراکترها خیلی زیاده.',
    },
    'pxidjvnl': {
      'en': 'Invalid structure, please follow the suggestion 0612345678',
      'fa': 'ساختار نامعتبر است، لطفاً پیشنهاد 0612345678 را دنبال کنید.',
    },
    'iosy9ppm': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
    },
    '7ob5ecaq': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
    '91y7tx26': {
      'en': 'Change password',
      'fa': 'تغییر رمز عبور',
    },
    'q6g1oauj': {
      'en': 'To delete your account, ',
      'fa': 'برای حذف حساب کاربری خود،',
    },
    'r5ao7kba': {
      'en': 'click here.',
      'fa': 'اینجا کلیک کنید.',
    },
    '7dpr3o6q': {
      'en': 'Are you sure you want to delete your account?',
      'fa': 'آیا مطمئن هستید که می‌خواهید حساب کاربری خود را حذف کنید؟',
    },
    'jfkgqpi8': {
      'en':
          'By confirming you cannot revive your account anymore. Would you confirm this?',
      'fa':
          'با تأیید اینکه دیگر نمی‌توانید حساب خود را احیا کنید، آیا این را تأیید می‌کنید؟',
    },
    '4erb0ghk': {
      'en': 'Privacy Setting',
      'fa': 'تنظیمات حریم خصوصی',
    },
    'o6m9um7k': {
      'en': 'Allow users to see my profile photo.',
      'fa': 'اعلان ایمیل',
    },
    'o1cxr5mo': {
      'en': 'Allow  users to see my social media link.',
      'fa': 'اعلان برنامه',
    },
    '5ct1ipp7': {
      'en': 'Allow  users to see my favorits.',
      'fa': 'به کاربران اجازه دهید به من پیام بدهند.',
    },
    '99v5cfwr': {
      'en': 'Allow  users to Call me.',
      'fa': 'نمایش بیوگرافی پروفایل',
    },
    'd7sz5zwn': {
      'en': 'Allow  users to Message me.',
      'fa': 'به کاربران اجازه دهید به من پیام بدهند.',
    },
    'bcc012tm': {
      'en': 'Save ',
      'fa': 'ذخیره',
    },
    'n0wh7xpu': {
      'en': 'Terms & Conditions',
      'fa': 'شرایط و ضوابط',
    },
    'tjb626e7': {
      'en': 'Last update:',
      'fa': 'آخرین به‌روزرسانی:',
    },
    '5e4ycz9l': {
      'en': ' 27/12/2023',
      'fa': '۲۷/۱۲/۲۰۲۳',
    },
    's985kdhj': {
      'en':
          'Please read these terms of service, carefully before using our app operated by us.',
      'fa':
          'لطفاً قبل از استفاده از برنامه‌ای که توسط ما اداره می‌شود، این شرایط خدمات را با دقت مطالعه کنید.',
    },
    'lmfc5v7f': {
      'en': 'Conditions of Uses',
      'fa': 'شرایط استفاده',
    },
    '4m7c0svb': {
      'en':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      'fa':
          'این یک واقعیت دیرینه است که خواننده هنگام نگاه کردن به طرح‌بندی یک صفحه، حواسش به محتوای خوانای آن پرت می‌شود. نکته استفاده از لورم ایپسوم این است که برخلاف استفاده از «محتوا اینجا، محتوا اینجا» توزیع حروف کم و بیش نرمالی دارد و باعث می‌شود مانند انگلیسی خوانا به نظر برسد.\n\nبسیاری از بسته‌های نشر رومیزی و ویرایشگرهای صفحات وب اکنون از لورم ایپسوم به عنوان متن مدل پیش‌فرض خود استفاده می‌کنند و جستجوی «لورم ایپسوم» بسیاری از وب‌سایت‌ها را که هنوز در مراحل ابتدایی خود هستند، آشکار می‌کند. نسخه‌های مختلفی در طول سال‌ها تکامل یافته‌اند، گاهی به طور تصادفی، گاهی به طور هدفمند (تزریق طنز و موارد مشابه).',
    },
    'qs6w5v52': {
      'en': 'Types of data we collect',
      'fa': 'انواع داده‌هایی که جمع‌آوری می‌کنیم',
    },
    'dpq02zvf': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
    },
    '9a8xasa6': {
      'en': 'Use of your personal data',
      'fa': 'استفاده از داده‌های شخصی شما',
    },
    'p7k9qd47': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
    },
    'qkcnqh30': {
      'en': 'Disclosure of your data',
      'fa': 'افشای داده‌های شما',
    },
    '33b9u8a9': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. ',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. تعلیق پرتیوم ویورا. Volutpat commodo sed egestas egestas fringillaphallus faucibus.',
    },
    '2615xb3m': {
      'en': 'Home',
      'fa': 'خانه',
    },
  },
  // profileCardComp
  {
    '600ony37': {
      'en': 'Trusted by 88 users',
      'fa': 'مورد اعتماد ۸۸ کاربر',
    },
  },
  // Chat_delete_Archive
  {
    'd723qvl3': {
      'en': 'Archive Chat',
      'fa': 'بایگانی گفتگو',
    },
    'l9et7p23': {
      'en': 'Delete Chat',
      'fa': 'حذف چت',
    },
    'sa505oyx': {
      'en': 'Cancel',
      'fa': 'لغو',
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
  // OurMainHeaderCopy
  {
    'khe3lt6k': {
      'en': '55',
      'fa': '۵۵',
    },
    '5qt3mxse': {
      'en': 'Trust score',
      'fa': 'امتیاز اعتماد',
    },
  },
  // PopUpTitle
  {
    '6ic7t8mm': {
      'en': 'Give your post short a title',
      'fa': 'برای پست کوتاه خود عنوان انتخاب کنید',
    },
    'y2fp32ac': {
      'en': 'E.g. Second-hand carpet from Tabriz',
      'fa': 'مثلاً فرش دست دوم تبریز',
    },
    'ol4g5aou': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
  },
  // PopUpDesc
  {
    'y55bc5uf': {
      'en': 'Give your post a clear description',
      'fa': 'برای پست خود توضیح واضحی بنویسید',
    },
    '0luhlo2r': {
      'en': 'Write here...',
      'fa': 'اینجا بنویس...',
    },
    'v2g5s1bb': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
  },
  // PopUpPrice
  {
    'kppj9j1v': {
      'en': 'Indicate a value (Optional)',
      'fa': 'یک مقدار را مشخص کنید (اختیاری)',
    },
    'wfbfu6bv': {
      'en':
          'Set a value to guide fair swaps—others can add items/services to match or pay the balance.',
      'fa':
          'برای هدایت مبادلات منصفانه، مقداری تعیین کنید - دیگران می‌توانند اقلام/خدماتی را برای مطابقت اضافه کنند یا مانده را پرداخت کنند.',
    },
    'qv6dk8tp': {
      'en': 'Roughly, what’s it worth?',
      'fa': 'تقریباً، ارزشش چقدر است؟',
    },
    '9mrhepn3': {
      'en': 'Enter your price',
      'fa': 'قیمت خود را وارد کنید',
    },
    'm9b17chr': {
      'en': 'Time-based? (e.g. per hour)',
      'fa': 'بر اساس زمان؟ (مثلاً به ازای هر ساعت)',
    },
    'l0xn8r9d': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
    },
    'aantg5c1': {
      'en': 'Search...',
      'fa': 'جستجو...',
    },
    'xqm0nvxx': {
      'en': 'None',
      'fa': 'هیچکدام',
    },
    'qkhkyi2d': {
      'en': 'Per day',
      'fa': 'در هر روز',
    },
    '5pz6t0ec': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
    },
    'cnghpb6c': {
      'en': 'Per week',
      'fa': 'در هر هفته',
    },
    'zt4a0vsx': {
      'en': 'Per month',
      'fa': 'در هر ماه',
    },
    'zjcyvx2u': {
      'en': 'Per year',
      'fa': 'در هر سال',
    },
    '89tnbwmo': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
  },
  // PopUpDelivery
  {
    'hfiypjxf': {
      'en': 'Set your delivery options',
      'fa': 'گزینه‌های تحویل خود را تنظیم کنید',
    },
    'nh0pws5w': {
      'en': 'Does delivery apply?',
      'fa': 'آیا تحویل اعمال می‌شود؟',
    },
    'fqknrw4a': {
      'en': 'What is your preferred delivery option?',
      'fa': 'گزینه تحویل مورد نظر شما چیست؟',
    },
    'wzk88een': {
      'en': 'Free Delivery',
      'fa': 'تحویل رایگان',
    },
    'qwds3g6m': {
      'en': 'Send by PostNL',
      'fa': 'ارسال از طریق PostNL',
    },
    'blxf3obc': {
      'en': 'Pick-up only',
      'fa': 'فقط تحویل حضوری',
    },
    'csy436p7': {
      'en': 'By agreement',
      'fa': 'طبق توافق',
    },
    'u30ejxny': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
  },
  // Wishlist
  {
    'rv1lw8l8': {
      'en': 'In a few lines, say what you need (items, services, or skills)',
      'fa':
          'در چند خط، آنچه را که نیاز دارید (اقلام، خدمات یا مهارت‌ها) بیان کنید.',
    },
    'pdvv7tmt': {
      'en': 'Your wishlist',
      'fa': 'لیست علاقه‌مندی‌های شما',
    },
    'p1qwyas9': {
      'en':
          'E.g. Happy to trade for music (Setar) tutoring, Farsi books or a coffee maker.',
      'fa':
          'مثلاً: حاضرم با تدریس خصوصی موسیقی (سه‌تار)، کتاب فارسی یا قهوه‌ساز معاوضه کنم.',
    },
    'jzfihyic': {
      'en': 'Want more visibility?',
      'fa': 'می‌خواهید بیشتر دیده شوید؟',
    },
    'e49swj77': {
      'en': 'Add categories to help your post get found',
      'fa': 'برای کمک به دیده شدن پست خود، دسته بندی اضافه کنید',
    },
    '0m1g2bxm': {
      'en': 'Confirm',
      'fa': 'تأیید',
    },
  },
  // valuePopup
  {
    'qkh0ickm': {
      'en': 'Estimated Value',
      'fa': 'ارزش تخمینی',
    },
    'h88bplqv': {
      'en':
          'This is only a  guide to the item or service’s worth—exchanges are welcome, and money is just one way to agree.',
      'fa':
          'این فقط راهنمایی برای ارزش کالا یا خدمات است - تبادل کالا مجاز است و پول فقط یکی از راه‌های توافق است.',
    },
  },
  // shoutOutCard
  {
    'r6m3h1jr': {
      'en': '+10 Points',
      'fa': '+۱۰ امتیاز',
    },
    '9n1g8cal': {
      'en': '4.9',
      'fa': '۴.۹',
    },
    'akk1rip2': {
      'en': 'Thank You!',
      'fa': 'نیما این هفته به ۳ نفر کمک کرده! مرسی نیما!',
    },
  },
  // Cat
  {
    '2qgj645y': {
      'en': 'How do you\nwant to trade?',
      'fa': 'چطور می‌خواهی معامله کنی؟',
    },
    '3cyvz1yl': {
      'en': 'Confirm',
      'fa': 'تأیید',
    },
  },
  // Images
  {
    '4leye1wv': {
      'en': 'Upload photos',
      'fa': 'آپلود عکس',
    },
    'qnqqsif9': {
      'en': 'Selectup to 4 images',
      'fa': 'انتخاب تا ۴ تصویر',
    },
    'pxk31e3x': {
      'en': 'Save',
      'fa': 'ذخیره',
    },
  },
  // SubCat
  {
    'bsnulsdb': {
      'en': 'Which category\nfits your post best?',
      'fa': 'کدام دسته بندی بیشتر با پست شما مطابقت دارد؟',
    },
    '66bqg7gc': {
      'en': 'Cofirm',
      'fa': 'کوفرم',
    },
  },
  // Reporting_popup
  {
    'kg3w5j6w': {
      'en': 'You are about to report ',
      'fa': 'شما در شرف گزارش دادن هستید',
    },
    '2pjit2x3': {
      'en': '. Please provide your reason below.',
      'fa': 'لطفا دلیل خود را در زیر ارائه دهید.',
    },
    '68d6jx0a': {
      'en': '',
      'fa': '',
    },
    '8r0yy5sr': {
      'en': 'Reason',
      'fa': 'دلیل',
    },
    '2iknl0nt': {
      'en': 'I would like to report this post/profile because..',
      'fa': 'من می‌خواهم این پست/پروفایل را گزارش کنم زیرا..',
    },
    'fq4r8mbk': {
      'en': 'Cancel',
      'fa': 'لغو',
    },
    '4f0rzqyy': {
      'en': 'Report',
      'fa': 'گزارش',
    },
  },
  // Profile_setting
  {
    'uc7ythtx': {
      'en': 'Edit Profile',
      'fa': 'ویرایش پروفایل',
    },
    'ux5iqynl': {
      'en': 'Terms & Conditions',
      'fa': 'شرایط و ضوابط',
    },
    'ks3vswcp': {
      'en': 'Share Profile',
      'fa': 'اشتراک‌گذاری پروفایل',
    },
    'ha2x8rnw': {
      'en': 'Contact Us',
      'fa': 'تماس با ما',
    },
    '81n9awh1': {
      'en': 'Log Out',
      'fa': 'خروج',
    },
    '5r4wo0co': {
      'en': 'Cancel',
      'fa': 'لغو',
    },
  },
  // verifyCode
  {
    'hy8t8fp9': {
      'en': 'A confimation code was sent via email.',
      'fa': 'یک کد تایید از طریق ایمیل ارسال شد.',
    },
    're93hvjq': {
      'en': 'Pease enter  valid code',
      'fa': 'لطفا کد معتبر را وارد کنید',
    },
    'vra2s4j2': {
      'en': 'Resend',
      'fa': 'ارسال مجدد',
    },
    '62qr2zha': {
      'en': 'Verify now',
      'fa': 'اکنون تأیید کنید',
    },
  },
  // ReviewAndRating
  {
    'bc2ugybz': {
      'en': 'Communication',
      'fa': 'ارتباطات',
    },
    '1wffczog': {
      'en': 'Reliability',
      'fa': 'قابلیت اطمینان',
    },
    '3hk4ajr8': {
      'en': 'Quality',
      'fa': 'کیفیت',
    },
    '69tqvojl': {
      'en': 'Fairness',
      'fa': 'انصاف',
    },
    'ixl4pva7': {
      'en': 'Review note',
      'fa': 'یادداشت بررسی',
    },
    'q9biojw1': {
      'en': 'Submit',
      'fa': 'ارسال',
    },
  },
  // ReviewCard
  {
    'wdd96ugv': {
      'en': 'Comunication',
      'fa': 'ارتباطات',
    },
    'qc660x4w': {
      'en': 'Quality',
      'fa': 'کیفیت',
    },
    'igw49v8r': {
      'en': 'Reliability',
      'fa': 'قابلیت اطمینان',
    },
    'fnbjhk24': {
      'en': 'Fairness',
      'fa': 'انصاف',
    },
  },
  // filterComp
  {
    '39m80n6c': {
      'en': 'Sort by',
      'fa': 'مرتب سازی بر اساس',
    },
    'rmxru5tr': {
      'en': 'Recent first',
      'fa': 'تازه‌ترین‌ها اول',
    },
    'e5ksnrbu': {
      'en': 'Popularity',
      'fa': 'پرطرفدارها اول',
    },
    '6mlgkdcp': {
      'en': 'Main Category',
      'fa': 'دسته اصلی',
    },
    'wyeesjpx': {
      'en': 'Help\nRequests',
      'fa': 'درخواست‌های\n کمک',
    },
    '4v5j6x7d': {
      'en': 'Help\nOffers',
      'fa': 'پیشنهادات\n کمک',
    },
    'dizhta1q': {
      'en': 'Items for\nExchange',
      'fa': 'اقلام برای\nمبادله',
    },
    '6k23jjcj': {
      'en': 'Borrow\nRequests',
      'fa': 'درخواست‌های\nامانت',
    },
    'ms5wvss5': {
      'en': 'Items for \nFree',
      'fa': 'اقلام\nرایگان',
    },
    'vomy1zvs': {
      'en': 'Category',
      'fa': 'دسته بندی',
    },
    'oxm7whsh': {
      'en': 'Prefrences',
      'fa': 'اولویت‌ها',
    },
    '049of0yw': {
      'en': 'Has Images',
      'fa': 'دارای تصاویر',
    },
    'z1n4754v': {
      'en': 'Yekja Certified',
      'fa': 'دارای گواهینامه یکجا',
    },
    '1k0o4qcd': {
      'en': 'Highly Rated Users',
      'fa': 'کاربران با امتیاز بالا',
    },
    'znbsze95': {
      'en': 'Location',
      'fa': 'مکان',
    },
    'ba1i6j7a': {
      'en': '',
      'fa': '',
    },
    'eawvpykz': {
      'en': 'Anywhere in NL   ',
      'fa': 'هر کجای هلند',
    },
    'uvve2iu3': {
      'en': 'Search...',
      'fa': 'جستجو...',
    },
    'w34s76kb': {
      'en': 'Search',
      'fa': 'جستجو',
    },
    'qq5pvrob': {
      'en': 'Clear all filters',
      'fa': 'پاک کردن همه فیلترها',
    },
  },
  // YekjaScorePopUp
  {
    'x4t1poso': {
      'en': 'Yekja Level',
      'fa': 'سطح یکجا',
    },
    'tccfkwh8': {
      'en': 'Total Points',
      'fa': 'مجموع امتیازات',
    },
    'rg6yq5rd': {
      'en': '10',
      'fa': '۱۰',
    },
    '1fgfwxor': {
      'en': '90 pts to next level',
      'fa': '۹۰ امتیاز تا مرحله بعد',
    },
    'hyrcnjok': {
      'en': 'Dena',
      'fa': 'دنا',
    },
    '8oqhe5wf': {
      'en': 'Sabalan',
      'fa': 'سبلان',
    },
    '3l2wyu39': {
      'en': 'Alam Kooh',
      'fa': 'علم کوه',
    },
    'rrsp4xfp': {
      'en': 'T-Soleyman',
      'fa': 'تی-سلیمان',
    },
    'l5cmvc2h': {
      'en': 'O-Kooh',
      'fa': 'او-کوه',
    },
    'xda20r4w': {
      'en': 'Damavand',
      'fa': 'دماوند',
    },
    'riofot9y': {
      'en': 'Welcome onboard ',
      'fa': 'به داخل خوش آمدید',
    },
    '0ydazef5': {
      'en':
          'You\'ve just joined Yekja! Start by completing your profile, creating your first listing or offering help to earn points.',
      'fa':
          'شما همین الان به یکجا پیوستید! با تکمیل پروفایل خود، ایجاد اولین آگهی یا ارائه کمک برای کسب امتیاز شروع کنید.',
    },
    'pm8axn5i': {
      'en': 'Complete profile (+5)',
      'fa': 'مشخصات کامل (+5)',
    },
    '8rbjz4a2': {
      'en': 'Create first post (+3)',
      'fa': 'ایجاد اولین پست (+3)',
    },
    'm274lwcs': {
      'en': 'Recent Contributions',
      'fa': 'مشارکت‌های اخیر',
    },
    'jwv0s37y': {
      'en': '+10 ',
      'fa': '+10',
    },
    'c85wa8iq': {
      'en': 'Welcome points',
      'fa': 'نقاط خوشامدگویی',
    },
    'si2ij889': {
      'en': '2h ago',
      'fa': '۲ ساعت پیش',
    },
    'll3tfsg2': {
      'en': '+20 (Locked)',
      'fa': '+۲۰ (قفل شده)',
    },
    'k9no7per': {
      'en': ' Early Adopter',
      'fa': 'پذیرنده اولیه',
    },
    'xsrkjudl': {
      'en': '2h ago',
      'fa': '۲ ساعت پیش',
    },
    'bomwqsri': {
      'en': 'See how points work',
      'fa': 'ببینید امتیازها چگونه کار می‌کنند',
    },
  },
  // Comunication_Bar
  {
    'kign2ryz': {
      'en': '',
      'fa': '',
    },
    'cehxi79j': {
      'en': '',
      'fa': '',
    },
    '8f99d8cs': {
      'en': '',
      'fa': '',
    },
  },
  // MainHeader
  {
    'xpzlwcmx': {
      'en': '10',
      'fa': '۱۰',
    },
    'awxu5n57': {
      'en': '10',
      'fa': '۴۵',
    },
  },
  // NavBar
  {
    'h84rq3rh': {
      'en': 'Confirm  email',
      'fa': 'ایمیل را تأیید کنید',
    },
    'guin220b': {
      'en': 'Please confirm your email first in order to create a post.',
      'fa': 'برای ایجاد پست، ابتدا ایمیل خود را تأیید کنید.',
    },
    'b4rlpy84': {
      'en': 'Confirm Email',
      'fa': 'تأیید ایمیل',
    },
    's2xla0yd': {
      'en': 'Confirm  email',
      'fa': 'ایمیل را تأیید کنید',
    },
    '93xbz86m': {
      'en': 'Please confirm your email first in order to create a post.',
      'fa': 'برای ایجاد پست، ابتدا ایمیل خود را تأیید کنید.',
    },
    'hg7wba0t': {
      'en': 'Confirm Email',
      'fa': 'تأیید ایمیل',
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
  },
].reduce((a, b) => a..addAll(b));
