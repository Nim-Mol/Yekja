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

  static List<String> languages() => ['en', 'fa', 'nl'];

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
    String? nlText = '',
  }) =>
      [enText, faText, nlText][languageIndex] ?? '';

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
      'nl': 'Soorten gegevens die we verzamelen',
    },
    'pjccx30m': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
      'nl':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Als u weet dat er een fringilla-accumsan is, is de vraag sem-sollicitudin lacus, ut interdum',
    },
    'tfexkisk': {
      'en': 'Use of your personal data',
      'fa': 'استفاده از داده‌های شخصی شما',
      'nl': 'Gebruik van uw persoonsgegevens',
    },
    '0c0whg70': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet، consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
      'nl':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Als u weet dat er een fringilla-accumsan is, is de vraag sem-sollicitudin lacus, ut interdum',
    },
    'or00gc18': {
      'en': 'Disclosure of your data',
      'fa': 'افشای داده‌های شما',
      'nl': 'Openbaarmaking van uw gegevens',
    },
    '8zt0gtha': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. ',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. تعلیق پرتیوم ویورا. Volutpat commodo sed egestas egestas fringillaphallus faucibus.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus.',
    },
    'nehddebj': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // FAQ
  {
    'dhbx92pr': {
      'en': 'FAQ',
      'fa': 'سوالات متداول',
      'nl': 'Veelgestelde vragen',
    },
    '24c4afj9': {
      'en': 'Whiat is Trust score?',
      'fa': 'امتیاز اعتماد (Trust Score) چقدر است؟',
      'nl': 'Wat is de Trust score?',
    },
    'l1qm6pea': {
      'en':
          'Trust Score System\nThe Trust Score would be a dynamic value (e.g., 0–100) that indicates how trustworthy a user is, based on various factors.\n\n🔸 Factors That Could Influence Trust Score:\nVerified Identity\nGovernment ID, business license, phone number, etc.\n\n🔸 Customer Reviews & Ratings\nHigh ratings and positive feedback increase the score.\n\n🔸 Completed Transactions\nNumber and consistency of successful sales or services.\n\n🔸 Response Time & Engagement\nHow fast and often a user responds to messages or inquiries.\n\n🔸 Dispute History\nFewer disputes or issues with orders mean a higher score.\n\n🔸 Account Age & Activity\nOlder, consistently active accounts tend to be more trusted.\n\n🔸 Admin Verification\nFor certain professionals (e.g. a dentist), manual verification by Our team.(Contact our team)',
      'fa':
          'سیستم امتیاز اعتماد\nامتیاز اعتماد یک مقدار پویا (مثلاً 0 تا 100) خواهد بود که بر اساس عوامل مختلف، میزان قابل اعتماد بودن کاربر را نشان می‌دهد.\n\n\n🔸 عواملی که می‌توانند بر امتیاز اعتماد تأثیر بگذارند:\n\nهویت تأیید شده\nشناسه دولتی، مجوز کسب و کار، شماره تلفن و غیره\n\n🔸 نظرات و رتبه‌بندی‌های مشتری\nرتبه‌بندی‌های بالا و بازخورد مثبت، امتیاز را افزایش می‌دهد.\n\n\n🔸 تراکنش‌های تکمیل‌شده\nتعداد و تداوم فروش یا خدمات موفق.\n\n\n🔸 زمان پاسخگویی و تعامل\nسرعت و دفعات پاسخگویی کاربر به پیام‌ها یا سوالات.\n\n\n🔸 سابقه اختلاف نظر\nاختلاف نظرها یا مشکلات کمتر در سفارشات به معنای امتیاز بالاتر است.\n\n\n🔸 سن و فعالیت حساب\nحساب‌های قدیمی‌تر و فعال‌تر، معمولاً قابل اعتمادتر هستند.\n\n\n🔸 تأیید مدیریت\nبرای برخی از متخصصان (مثلاً دندانپزشک)، تأیید دستی توسط تیم ما. (با تیم ما تماس بگیرید)',
      'nl':
          'Vertrouwensscoresysteem\nDe vertrouwensscore is een dynamische waarde (bijv. 0-100) die aangeeft hoe betrouwbaar een gebruiker is, op basis van verschillende factoren.\n\n🔸 Factoren die de vertrouwensscore kunnen beïnvloeden:\nGeverifieerde identiteit\nOverheids-ID, bedrijfsvergunning, telefoonnummer, enz.\n\n🔸 Klantbeoordelingen en -beoordelingen\nHoge beoordelingen en positieve feedback verhogen de score.\n\n🔸 Voltooide transacties\nAantal en consistentie van succesvolle verkopen of diensten.\n\n🔸 Reactietijd en betrokkenheid\nHoe snel en vaak een gebruiker reageert op berichten of vragen.\n\n🔸 Geschillengeschiedenis\nMinder geschillen of problemen met bestellingen betekenen een hogere score.\n\n🔸 Accountleeftijd en -activiteit\nOudere, consistent actieve accounts zijn over het algemeen betrouwbaarder.\n\n🔸 Beheerdersverificatie\nVoor bepaalde professionals (bijv. een tandarts), handmatige verificatie door ons team. (Neem contact op met ons team)',
    },
    'dtpcil6r': {
      'en': 'How to become a Trust?',
      'fa': 'چگونه به یک تراست تبدیل شویم؟',
      'nl': 'Hoe word ik een trust?',
    },
    'odjaij7e': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    'o9brjb3x': {
      'en': 'What comes under furniture?',
      'fa': 'زیر مبلمان چه چیزهایی قرار می‌گیرد؟',
      'nl': 'Wat valt er onder meubels?',
    },
    'bkl59zgx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    '95ksmw47': {
      'en': 'Which furniture is best in India?',
      'fa': 'کدام مبلمان در هند بهترین است؟',
      'nl': 'Welk meubilair is het beste in India?',
    },
    'nu3cwjjm': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    'eks33xkk': {
      'en': 'Are items in Amazon original?',
      'fa': 'آیا کالاهای موجود در آمازون اصل هستند؟',
      'nl': 'Zijn de artikelen op Amazon origineel?',
    },
    '21arpmnw': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    'aloc0wpz': {
      'en': 'Does Amazon sell original items?',
      'fa': 'آیا آمازون اقلام اورجینال می‌فروشد؟',
      'nl': 'Verkoopt Amazon originele artikelen?',
    },
    'sjaptzm1': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    'isn1j7jh': {
      'en': 'Is it OK to buy from Amazon?',
      'fa': 'آیا خرید از آمازون اشکالی ندارد؟',
      'nl': 'Is het oké om via Amazon te kopen?',
    },
    'ncwlis4k': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua.',
    },
    'gvdgmual': {
      'en': 'Contact Yekja',
      'fa': 'تماس با یکجا',
      'nl': 'Neem contact op met Yekja',
    },
    'xelooj4q': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // Dashboard
  {
    'y27rul3e': {
      'en': 'Dashboard',
      'fa': 'داشبورد',
      'nl': 'Dashboard',
    },
    '3r5gd90h': {
      'en': 'Below is a summary of your day.',
      'fa': 'خلاصه‌ای از روز شما در زیر آمده است.',
      'nl': 'Hieronder vindt u een samenvatting van uw dag.',
    },
    'honzj49s': {
      'en': 'Reported Users',
      'fa': 'کاربران گزارش شده',
      'nl': 'Gerapporteerde gebruikers',
    },
    'a8s0jq7n': {
      'en': 'Reported Posts',
      'fa': 'پست‌های گزارش‌شده',
      'nl': 'Gerapporteerde berichten',
    },
    'bqpm7nju': {
      'en': '16',
      'fa': '۱۶',
      'nl': '16',
    },
    'xe9yy4xg': {
      'en': 'Completed Tasks',
      'fa': 'وظایف انجام شده',
      'nl': 'Voltooide taken',
    },
    'trib0otj': {
      'en': 'User Acrivity',
      'fa': 'فعالیت کاربر',
      'nl': 'Gebruikersactiviteit',
    },
    '4g3g78nc': {
      'en': 'An overview of your route.',
      'fa': 'نمای کلی از مسیر شما.',
      'nl': 'Een overzicht van uw route.',
    },
    '59i64ufn': {
      'en': 'Route progress',
      'fa': 'پیشرفت مسیر',
      'nl': 'Routevoortgang',
    },
    'luw7diah': {
      'en': '12',
      'fa': '۱۲',
      'nl': '12',
    },
    '2bodtbq0': {
      'en': 'Tasks to be completed',
      'fa': 'وظایفی که باید تکمیل شوند',
      'nl': 'Uit te voeren taken',
    },
    'w3s1tswi': {
      'en': 'Contact Messages',
      'fa': 'پیام‌های تماس',
      'nl': 'Contactberichten',
    },
    'v3keodxf': {
      'en': 'Send at:',
      'fa': 'ارسال به:',
      'nl': 'Verzenden naar:',
    },
    'zt64g53o': {
      'en': 'Task Type',
      'fa': 'نوع وظیفه',
      'nl': 'Taaktype',
    },
    'wwwqvc73': {
      'en': 'Task description here.',
      'fa': 'شرح وظایف اینجا.',
      'nl': 'Taakbeschrijving hier.',
    },
    '5babgypu': {
      'en': 'Due:',
      'fa': 'موعد:',
      'nl': 'Vanwege:',
    },
    'se5sinyl': {
      'en': 'Today, 6:20pm',
      'fa': 'امروز، ساعت ۱۸:۲۰',
      'nl': 'Vandaag, 18:20 uur',
    },
    'xqf0f5nk': {
      'en': 'Update',
      'fa': 'به‌روزرسانی',
      'nl': 'Update',
    },
    'kcmsvvgv': {
      'en': '1',
      'fa': '۱',
      'nl': '1',
    },
    'l5ch9txr': {
      'en': 'Recent Activity',
      'fa': 'فعالیت اخیر',
      'nl': 'Recente activiteit',
    },
    'zh98zvo3': {
      'en': 'Below is an overview of tasks & activity completed.',
      'fa': 'در زیر خلاصه‌ای از وظایف و فعالیت‌های انجام شده آمده است.',
      'nl':
          'Hieronder vindt u een overzicht van de voltooide taken en activiteiten.',
    },
    'vhkxh9nm': {
      'en': 'Tasks',
      'fa': 'وظایف',
      'nl': 'Taken',
    },
    'htjdxa0n': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
      'nl': 'Voltooid',
    },
    'vh94losf': {
      'en': 'Launches',
      'fa': 'پرتاب‌ها',
      'nl': 'Lanceringen',
    },
    '5rr1rii1': {
      'en': 'Last 30 Days',
      'fa': '۳۰ روز گذشته',
      'nl': 'Laatste 30 dagen',
    },
    'd6pa0tus': {
      'en': 'Avg. Grade',
      'fa': 'میانگین درجه',
      'nl': 'Gemiddeld cijfer',
    },
    'ittjsdyx': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // Events
  {
    'i7ajooi4': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    't14ytv6g': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '2kp727kk': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
      'nl': 'Amsterdam',
    },
    '5s0c0ero': {
      'en': 'Utrecht',
      'fa': 'اوترخت',
      'nl': 'Utrecht',
    },
    'kcq2onos': {
      'en': 'Roterdam',
      'fa': 'روتردام',
      'nl': 'Rotterdam',
    },
    '9elpb7u6': {
      'en': 'Create your Own ',
      'fa': 'شخصی سازی پست',
      'nl': 'Maak je eigen',
    },
    'v49kkwir': {
      'en': 'This Week',
      'fa': 'این هفته',
      'nl': 'Deze week',
    },
    'x1xolbmi': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
      'nl': '10 evenementen',
    },
    't6hrpmq7': {
      'en': 'New Events',
      'fa': 'رویدادهای جدید',
      'nl': 'Nieuwe evenementen',
    },
    'w0pnp1z3': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
      'nl': '10 evenementen',
    },
    'ti6bni8k': {
      'en': 'Past Events',
      'fa': 'رویدادهای گذشته',
      'nl': 'Afgelopen evenementen',
    },
    '7zdzq2zc': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
      'nl': '10 evenementen',
    },
    'j6urr4mb': {
      'en': 'Papular',
      'fa': 'پاپولار',
      'nl': 'Papulair',
    },
    'en1tquyj': {
      'en': '10 events',
      'fa': '۱۰ رویداد',
      'nl': '10 evenementen',
    },
    'qxqmxean': {
      'en': 'Categories',
      'fa': 'دسته‌ها',
      'nl': 'Categorieën',
    },
    'fppuf54e': {
      'en': 'See all',
      'fa': 'همه را ببینید',
      'nl': 'Bekijk alles',
    },
    '7qvgei9i': {
      'en': 'New Shows',
      'fa': 'نمایش‌های جدید',
      'nl': 'Nieuwe shows',
    },
    'i1wixmqg': {
      'en': 'Last updated Today',
      'fa': 'آخرین به‌روزرسانی امروز',
      'nl': 'Laatst bijgewerkt vandaag',
    },
    'r5cmv49k': {
      'en': 'Amsterdam, Ziggo Dome',
      'fa': 'آمستردام، گنبد زیگو',
      'nl': 'Amsterdam, Ziggo Dome',
    },
    'mohqul2m': {
      'en': 'Summer Party',
      'fa': 'مهمانی تابستانی',
      'nl': 'Zomerfeest',
    },
    '0rcwktmq': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
      'nl': '23 augustus, 17:00 uur',
    },
    '10zjo3pm': {
      'en': 'Amsterdam, Ziggo Dome',
      'fa': 'آمستردام، گنبد زیگو',
      'nl': 'Amsterdam, Ziggo Dome',
    },
    '0kvtjf5o': {
      'en': 'Summer Party',
      'fa': 'مهمانی تابستانی',
      'nl': 'Zomerfeest',
    },
    'q533wolg': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
      'nl': '23 augustus, 17:00 uur',
    },
    'qmljwuqk': {
      'en': 'Amstelven, Amsterdam\'sBos',
      'fa': 'آمستلون، آمستردام بوس',
      'nl': 'Amstelven, Amsterdams Bos',
    },
    'rlyjcccd': {
      'en': 'Summer BBQ',
      'fa': 'باربیکیو تابستانی',
      'nl': 'Zomerbarbecue',
    },
    'mhsv7wn4': {
      'en': 'juli 23, 05:00 PM',
      'fa': '۲۳ ژوئیه، ساعت ۱۷:۰۰',
      'nl': '23 juli, 17:00 uur',
    },
    'hlhfhorw': {
      'en': 'Best of last month',
      'fa': 'بهترین‌های ماه گذشته',
      'nl': 'Beste van de afgelopen maand',
    },
    'kgmsmnqi': {
      'en': 'Based on your like and reviews',
      'fa': 'بر اساس لایک و نظرات شما',
      'nl': 'Gebaseerd op uw likes en recensies',
    },
    'rxbhr3mo': {
      'en': 'Game Night',
      'fa': 'شب بازی',
      'nl': 'Spelletjesavond',
    },
    '7weex4k8': {
      'en': 'Utrecht',
      'fa': 'اوترخت',
      'nl': 'Utrecht',
    },
    'wir5zro3': {
      'en': 'Mafia',
      'fa': 'مافیا',
      'nl': 'Maffia',
    },
    'gkg8vs6k': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
      'nl': '23 augustus, 17:00 uur',
    },
    'ee1eczmi': {
      'en': '4.8',
      'fa': '۴.۸',
      'nl': '4.8',
    },
    '941hvre2': {
      'en': 'Social',
      'fa': 'اجتماعی',
      'nl': 'Sociaal',
    },
    'uz5idaos': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
      'nl': 'Amsterdam',
    },
    '0nsdrkwp': {
      'en': 'Book Club',
      'fa': 'باشگاه کتاب',
      'nl': 'Boekenclub',
    },
    '6f9oi0a1': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
      'nl': '23 augustus, 17:00 uur',
    },
    '0vhc4y98': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'q3q0d5ui': {
      'en': 'BBQ',
      'fa': 'باربیکیو',
      'nl': 'barbecue',
    },
    'c5txrema': {
      'en': 'Amstelven,Amsterdam\'s Bos',
      'fa': 'آمستلون، بوس آمستردام',
      'nl': 'Amstelven, Amsterdams Bos',
    },
    'jb80kqem': {
      'en': 'Picnic Lovers',
      'fa': 'عاشقان پیک نیک',
      'nl': 'Picknickliefhebbers',
    },
    'qe8smj8m': {
      'en': 'agust 23, 05:00 PM',
      'fa': '۲۳ آگوست، ساعت ۱۷:۰۰',
      'nl': '23 augustus, 17:00 uur',
    },
    'iu8qjnpz': {
      'en': '4',
      'fa': '۴',
      'nl': '4',
    },
    'ezcrygy7': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ReportedPost
  {
    'fn7rbuop': {
      'en': 'Reported Posts',
      'fa': 'پست‌های گزارش‌شده',
      'nl': 'Gerapporteerde berichten',
    },
    'v4bgkf53': {
      'en': 'Make sure the users don\'t stay in reported state too long',
      'fa': 'مطمئن شوید که کاربران مدت زیادی در حالت گزارش‌شده نمی‌مانند.',
      'nl':
          'Zorg ervoor dat de gebruikers niet te lang in de gerapporteerde status blijven',
    },
    'yhwpofu5': {
      'en': 'Unblock',
      'fa': 'رفع انسداد',
      'nl': 'Deblokkeren',
    },
    'djmc2ax5': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // OnboardingPage
  {
    'fvqou22z': {
      'en': 'IRANIAN SUPPORT NETWORK',
      'fa': 'شبکه همیاری ایرانیان',
      'nl': 'IRAANSE ZORGNETWERK',
    },
    'x5ipfs17': {
      'en':
          'From students and newcomers to refugees, Yekja connects those who need help with those ready to give it — freely and sincerely.',
      'fa':
          'از دانشجویان و تازه واردان گرفته تا پناهندگان، یکجا کسانی را که به کمک نیاز دارند با کسانی که آماده‌ی کمک هستند - آزادانه و صمیمانه - مرتبط می‌کند.',
      'nl':
          'Yekja brengt mensen die hulp nodig hebben in contact met mensen die bereid zijn die hulp te geven, van studenten en nieuwkomers tot vluchtelingen.',
    },
    '2lb8wxe3': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'dq5yb1i0': {
      'en': 'EXCHANCE & SWAPS',
      'fa': 'صرافی و مبادله کالا به کالا',
      'nl': 'UITWISSELINGEN & SWAPS',
    },
    'e8ck1z6d': {
      'en':
          'Swap tickets, currency, books, clothes household items easily — all with visible reviews so you know who you’re trading with.',
      'fa':
          'بلیط، ارز، کتاب، لباس و لوازم خانگی را به راحتی مبادله کنید - همه با نظرات قابل مشاهده، بنابراین می‌دانید با چه کسی معامله می‌کنید.',
      'nl':
          'Ruil eenvoudig tickets, valuta, boeken, kleding en huishoudelijke artikelen — allemaal met zichtbare beoordelingen, zodat u weet met wie u handelt.',
    },
    'xlldlheo': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    '1nu2cohf': {
      'en': 'RENT OR BORROW',
      'fa': 'اجاره یا قرض',
      'nl': 'HUREN OF LENEN',
    },
    'qz7dvayq': {
      'en':
          'From housing and shared rooms to tools and furniture — borrow or rent the things you need, for less waste and more trust.',
      'fa':
          'از مسکن و اتاق‌های مشترک گرفته تا ابزار و مبلمان - چیزهایی را که نیاز دارید قرض بگیرید یا اجاره کنید، تا ضایعات کمتر و اعتماد بیشتری داشته باشید.',
      'nl':
          'Van huisvesting en gedeelde kamers tot gereedschap en meubilair: leen of huur de spullen die u nodig hebt, voor minder afval en meer vertrouwen.',
    },
    'sla1kl9z': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'ac5jubwt': {
      'en': 'SERVICES & HELPERS',
      'fa': ' خدمات  و کسب و کارها',
      'nl': 'DAGELIJKSE HULPERS',
    },
    'dmo5swsp': {
      'en':
          'Find nearby people offering reliable, everyday services — from babysitting and cleaning to home repairs or package transfer to Iran.',
      'fa':
          'افراد نزدیک خود را که خدمات روزمره و قابل اعتمادی ارائه می‌دهند، پیدا کنید - از نگهداری از کودک و نظافت گرفته تا تعمیرات منزل یا ارسال بسته به ایران.',
      'nl':
          'Vind mensen in de buurt die betrouwbare, dagelijkse diensten aanbieden — van oppassen en schoonmaken tot huisreparaties of pakketvervoer naar Iran.',
    },
    'texwferp': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'bgqgyx88': {
      'en': 'BUSINESSES & PROFESSIONAL SERVICES',
      'fa': 'خدمات تجاری و حرفه‌ای',
      'nl': 'BEDRIJVEN & PROFESSIONELE DIENSTEN',
    },
    'kkri2xpp': {
      'en':
          'Find trusted experts, businesses, and shops — from consultants and tech specialists to tailors and restaurants.',
      'fa':
          'متخصصان، کسب‌وکارها و مغازه‌های مورد اعتماد را پیدا کنید - از مشاوران و متخصصان فناوری گرفته تا خیاط‌ها و رستوران‌ها.',
      'nl':
          'Vind betrouwbare experts, bedrijven en winkels: van consultants en technische specialisten tot kleermakers en restaurants.',
    },
    'xebxlzec': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'zv67z709': {
      'en': 'COMMUNITY EVENTS',
      'fa': 'مراسم و رویدادها',
      'nl': 'GEMEENSCHAPSEVENEMENTEN',
    },
    'pk8wib7p': {
      'en':
          'Never miss an Iranian event again — find announcements, meetups, performances and celebrations all in one place.',
      'fa':
          'دیگر هرگز هیچ رویداد ایرانی را از دست ندهید - اطلاعیه‌ها، گردهمایی‌ها، اجراها و جشن‌ها را همه در یک مکان بیابید.',
      'nl':
          'Mis nooit meer een Iraans evenement: vind aankondigingen, bijeenkomsten, optredens en festiviteiten allemaal op één plek.',
    },
    'mjdiukti': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'b8gufi8a': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ImageGalleryPage
  {
    'jzavtjcg': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostSubCat
  {
    '63avlo5i': {
      'en': 'Subcategory',
      'fa': 'زیرشاخه',
      'nl': 'Subcategorie',
    },
    'm0e8ms6f': {
      'en': '3',
      'fa': '۳',
      'nl': '3',
    },
    'q5po1f7m': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    's7quu3gz': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'nth5pnlt': {
      'en': '4',
      'fa': '۴',
      'nl': '4',
    },
    'pvgrrlua': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    '5vuuqhdq': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'csirahyr': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'jedx2nxp': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // SignInConfirm
  {
    'm5qvsqog': {
      'en': 'Confirm Email',
      'fa': 'تأیید ایمیل',
      'nl': 'Bevestig e-mail',
    },
    '5rnnni2k': {
      'en': 'Please enter a username and email to continue',
      'fa': 'لطفا برای ادامه، نام کاربری و ایمیل خود را وارد کنید',
      'nl': 'Voer een gebruikersnaam en e-mailadres in om door te gaan',
    },
    'h8nwoxdn': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ep9mmsq3': {
      'en': 'Username',
      'fa': 'نام کاربری',
      'nl': 'Gebruikersnaam',
    },
    '0jzr1v97': {
      'en': 'Email',
      'fa': 'ایمیل',
      'nl': 'E-mail',
    },
    'f9e65zx9': {
      'en': 'Password',
      'fa': 'رمز عبور',
      'nl': 'Wachtwoord',
    },
    'xhzqr4bk': {
      'en': 'Username is required',
      'fa': 'نام کاربری الزامی است',
      'nl': 'Gebruikersnaam is vereist',
    },
    'mm8x2xit': {
      'en': 'At least 4 characters are required',
      'fa': 'حداقل ۴ کاراکتر مورد نیاز است',
      'nl': 'Er zijn minimaal 4 tekens vereist',
    },
    'c1vrjuyc': {
      'en': 'Max 12 characters are required',
      'fa': 'حداکثر ۱۲ کاراکتر مورد نیاز است',
      'nl': 'Er zijn maximaal 12 tekens vereist',
    },
    'xcdq956e': {
      'en':
          'Please use only letters (English/Persian), spaces, a dot or underscore.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، نقطه یا زیرخط استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, een punt of onderstrepingsteken.',
    },
    'fqqtjta3': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '77e8urzk': {
      'en': 'Email is required',
      'fa': 'ایمیل الزامی است',
      'nl': 'E-mailadres is vereist',
    },
    'ed0qiknp': {
      'en': 'Please enter a valid email address',
      'fa': 'لطفا یک آدرس ایمیل معتبر وارد کنید',
      'nl': 'Voer een geldig e-mailadres in',
    },
    '2wawja0q': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'u7jll47q': {
      'en': 'Password is required',
      'fa': 'رمز عبور الزامی است',
      'nl': 'Wachtwoord is vereist',
    },
    'qdm7trjn': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'it3a9439': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    'c1473phw': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostCat
  {
    'vctzvcga': {
      'en': 'Category',
      'fa': 'دسته بندی',
      'nl': 'Categorie',
    },
    'x4v7qe1s': {
      'en': '2',
      'fa': '۲',
      'nl': '2',
    },
    'vofew9ox': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'pncnlblo': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'vewqt7ds': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    '01wcpyj1': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // PostImage
  {
    'bia6eg30': {
      'en': 'Images',
      'fa': 'تصاویر',
      'nl': 'Afbeeldingen',
    },
    '8dol1v4o': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'fkwkxg0k': {
      'en': ' of ',
      'fa': 'از ',
      'nl': 'van',
    },
    'u6ho4fgv': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'uynzsoxg': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    '9ef0l1f0': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'gn0tmtgz': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'nnd68vi1': {
      'en': 'Upload photos',
      'fa': 'آپلود عکس',
      'nl': 'Foto\'s uploaden',
    },
    's1qkdor4': {
      'en': 'Add up to 4 photos',
      'fa': 'حداکثر ۴ عکس اضافه کنید',
      'nl': 'Voeg maximaal 4 foto\'s toe',
    },
    'klkdc69y': {
      'en': 'See Preview',
      'fa': 'پیش‌نمایش را ببینید',
      'nl': 'Bekijk voorbeeld',
    },
    'q3yy9x1s': {
      'en': 'Save',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
    'dd7lcje3': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // PostEdit
  {
    's45yad1c': {
      'en': 'PARTICIPANTS',
      'fa': 'شرکت‌کنندگان',
      'nl': 'DEELNEMERS',
    },
    '7jnr42m3': {
      'en': 'People who are going to this event.',
      'fa': 'افرادی که قرار است در این مراسم شرکت کنند.',
      'nl': 'Mensen die naar dit evenement gaan.',
    },
    'yr4ahw7e': {
      'en': 'Join Event',
      'fa': 'شرکت در رویداد',
      'nl': 'Deelnemen',
    },
    'x1ku0nkv': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'RECENSIES',
    },
    'mxg6sthy': {
      'en': 'Delete',
      'fa': 'حذف',
      'nl': 'Verwijderen',
    },
    '3b0fgnsw': {
      'en': 'Update',
      'fa': 'به‌روزرسانی',
      'nl': 'Update',
    },
    'g3y2is5w': {
      'en': 'Are you sure youwant to update this post?',
      'fa': 'آیا مطمئن هستید که می‌خواهید این پست را به‌روزرسانی کنید؟',
      'nl': 'Weet u zeker dat u dit bericht wilt bijwerken?',
    },
    'fqxvxcs2': {
      'en': 'Your post will update instantly after you confirm.',
      'fa': 'پست شما بلافاصله پس از تایید شما به‌روزرسانی خواهد شد.',
      'nl':
          'Nadat u uw bericht heeft bevestigd, wordt het bericht direct bijgewerkt.',
    },
    '2k2s462g': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'v1ly20lq': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    'ru8iak45': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ChangeEmailPage
  {
    'qvyltjge': {
      'en': 'Change Email',
      'fa': 'بازنشانی رمز عبور',
      'nl': 'Wachtwoord opnieuw instellen',
    },
    '6baohfcj': {
      'en': 'Make sure you enter a valid email address and confirm it.',
      'fa': 'برای ورود به سیستم، رمز عبور جدیدی ایجاد کنید',
      'nl': 'Maak een nieuw wachtwoord aan om in te loggen',
    },
    '7qj4jthi': {
      'en': 'New Email',
      'fa': 'رمز عبور جدید',
      'nl': 'Nieuw wachtwoord',
    },
    'hd56x034': {
      'en': 'New Email',
      'fa': 'رمز عبور جدید',
      'nl': 'Nieuw wachtwoord',
    },
    'j3fkaqso': {
      'en': 'Change Email',
      'fa': 'بازنشانی رمز عبور',
      'nl': 'Wachtwoord opnieuw instellen',
    },
    '7fzxxs8j': {
      'en': 'Please enter valid new password.',
      'fa': 'لطفا رمز عبور جدید معتبری وارد کنید.',
      'nl': 'Voer een nieuw, geldig wachtwoord in.',
    },
    's7ssap9i': {
      'en': 'please use a valid email address.',
      'fa': '',
      'nl': '',
    },
    'lo4zqx7s': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'yp5q6x4q': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // TermsConditionsPage
  {
    'h07847j4': {
      'en': 'Last update:',
      'fa': 'آخرین به‌روزرسانی:',
      'nl': '',
    },
    'gt5ezvts': {
      'en': ' 27/12/2025',
      'fa': '۲۷/۱۲/۲۰۲۳',
      'nl': '',
    },
    'ymkkp0xc': {
      'en':
          'Please read these terms of service, carefully before using our app operated by us.',
      'fa':
          'لطفاً قبل از استفاده از برنامه‌ای که توسط ما اداره می‌شود، این شرایط خدمات را با دقت مطالعه کنید.',
      'nl': '',
    },
    'qtiz5odk': {
      'en': 'Conditions of Uses',
      'fa': 'شرایط استفاده',
      'nl': '',
    },
    'n6b25ynm': {
      'en':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      'fa':
          'این یک واقعیت دیرینه است که خواننده هنگام نگاه کردن به طرح‌بندی یک صفحه، حواسش به محتوای خوانای آن پرت می‌شود. نکته استفاده از لورم ایپسوم این است که برخلاف استفاده از «محتوا اینجا، محتوا اینجا» توزیع حروف کم و بیش نرمالی دارد و باعث می‌شود مانند انگلیسی خوانا به نظر برسد.\n\nبسیاری از بسته‌های نشر رومیزی و ویرایشگرهای صفحات وب اکنون از لورم ایپسوم به عنوان متن مدل پیش‌فرض خود استفاده می‌کنند و جستجوی «لورم ایپسوم» بسیاری از وب‌سایت‌ها را که هنوز در مراحل ابتدایی خود هستند، آشکار می‌کند. نسخه‌های مختلفی در طول سال‌ها تکامل یافته‌اند، گاهی به طور تصادفی، گاهی به طور هدفمند (تزریق طنز و موارد مشابه).',
      'nl': '',
    },
    '0t1hw5zn': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': '',
    },
  },
  // ReportedUser
  {
    '3z4oqpvn': {
      'en': 'Reported Users',
      'fa': 'کاربران گزارش شده',
      'nl': '',
    },
    'z0xpmlax': {
      'en': 'Make sure the users don\'t stay in reported state too long',
      'fa': 'مطمئن شوید که کاربران مدت زیادی در حالت گزارش‌شده نمی‌مانند.',
      'nl': '',
    },
    '5dcfcmeh': {
      'en': 'Unblock',
      'fa': 'رفع انسداد',
      'nl': '',
    },
    '48c96pal': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': '',
    },
  },
  // Swipable
  {
    'c9tbt5vm': {
      'en': 'Discover Local \nOffers & Requests',
      'fa': 'کشف تمامی پیشنهادات و درخواست‌ها',
      'nl': 'Ontdek lokale\naanbiedingen en verzoeken',
    },
    '507gxblh': {
      'en': 'Swipe to explore — tap any to learn more',
      'fa': 'برای کاوش، انگشت خود را به هر سمتی  بکشید',
      'nl': 'Veeg om te ontdekken - tik op een optie om meer te weten te komen',
    },
    'b8feubfc': {
      'en': 'See details',
      'fa': 'جزئیات را ببینید',
      'nl': 'Zie details',
    },
    'bifytvxz': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ForgotPasswordPage
  {
    'akc8n3xv': {
      'en': 'Forgot Password',
      'fa': 'رمز عبور را فراموش کرده‌ام',
      'nl': 'Wachtwoord vergeten',
    },
    '7cx2kxrk': {
      'en': 'Type your email, we will send you verification code via email',
      'fa':
          'ایمیل خود را وارد کنید، ما کد تأیید را از طریق ایمیل برای شما ارسال خواهیم کرد',
      'nl': 'Typ uw e-mailadres, wij sturen u de verificatiecode via e-mail',
    },
    'ukwsa1lg': {
      'en': 'Email address',
      'fa': 'آدرس ایمیل',
      'nl': 'E-mailadres',
    },
    'b9qhzbmh': {
      'en': 'Email address',
      'fa': 'آدرس ایمیل',
      'nl': 'E-mailadres',
    },
    'tx1anksc': {
      'en': 'please enter valid your email address.',
      'fa': 'لطفا آدرس ایمیل معتبر خود را وارد کنید.',
      'nl': 'Voer een geldig e-mailadres in.',
    },
    'dxfpl9nd': {
      'en': 'please enter your email address.',
      'fa': 'لطفا آدرس ایمیل خود را وارد کنید.',
      'nl': 'Vul uw e-mailadres in.',
    },
    'zwux5wuv': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'pn42p7ja': {
      'en': 'Continue',
      'fa': 'ادامه',
      'nl': 'Doorgaan',
    },
    'ns7bgfpq': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ProfileExtended
  {
    'fweal07j': {
      'en': 'Posts',
      'fa': 'پست‌ها',
      'nl': 'Berichten',
    },
    'srw7h0cy': {
      'en': 'Favorites',
      'fa': 'موارد دلخواه',
      'nl': 'Favorieten',
    },
    '3tbjy6b8': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'Beoordelingen',
    },
    '47ohilj6': {
      'en': 'Awards',
      'fa': 'جوایز',
      'nl': 'Prijzen',
    },
    'hgewwtg0': {
      'en': 'Not received an award yet. ',
      'fa': 'هنوز جایزه‌ای دریافت نکرده است.',
      'nl': 'Nog geen prijs ontvangen.',
    },
    '296bw0rg': {
      'en': '',
      'fa': 'خانه',
      'nl': '',
    },
  },
  // SignInPage
  {
    '3yjo0udr': {
      'en': 'Welcome Back',
      'fa': 'خوش آمدید',
      'nl': 'Welkom terug',
    },
    '61yuoo32': {
      'en': 'If your email isn’t verified,',
      'fa': 'اگر ایمیل شما تأیید نشده است،',
      'nl': 'Als uw e-mailadres niet is geverifieerd,',
    },
    '1pylrdnu': {
      'en': ' click here. ',
      'fa': 'اینجا کلیک کنید.',
      'nl': 'Klik hier.',
    },
    '9amiwbff': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'sdree3ti': {
      'en': 'Email',
      'fa': 'ایمیل',
      'nl': 'E-mail',
    },
    'xpgw6kd9': {
      'en': 'Password',
      'fa': 'رمز عبور',
      'nl': 'Wachtwoord',
    },
    '8879mkr4': {
      'en': 'Sign in',
      'fa': 'ورود',
      'nl': 'Aanmelden',
    },
    'nxmvn4ld': {
      'en': 'Forgot password?',
      'fa': 'رمز عبور را فراموش کرده‌اید؟',
      'nl': 'Wachtwoord vergeten?',
    },
    'btvjsow4': {
      'en': ' Click here ',
      'fa': 'اینجا کلیک کنید',
      'nl': 'Klik hier',
    },
    'c0foq102': {
      'en': 'OR',
      'fa': 'یا',
      'nl': 'OF',
    },
    'qqhkk63r': {
      'en': 'No account yet?',
      'fa': 'هنوز حساب کاربری ندارید؟',
      'nl': 'Nog geen account?',
    },
    'oc6h6d27': {
      'en': ' Sign Up ',
      'fa': 'ثبت نام',
      'nl': 'Aanmelden',
    },
    't4mxpixd': {
      'en': 'Continute as a',
      'fa': 'ادامه به عنوان',
      'nl': 'Ga door als een',
    },
    'c1gzecba': {
      'en': ' Guest user ',
      'fa': 'کاربر مهمان',
      'nl': 'Gastgebruiker',
    },
    '0rujztpm': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // chatdetailWithYekja
  {
    '8v33985q': {
      'en': 'Yekja team',
      'fa': 'تیم یکجا',
      'nl': 'Yekja-team',
    },
    'a9aw2hjl': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostIntend
  {
    '3qldlcbv': {
      'en': 'Action',
      'fa': 'نوع اقدام',
      'nl': 'Actie',
    },
    'nwjujkbj': {
      'en': '3',
      'fa': '۳',
      'nl': '3',
    },
    '32apr70p': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'nz40p4e7': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'fmcypfvm': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'xoqgud4d': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // OverviewCare_XXX
  {
    '4f31r95c': {
      'en': 'Help\nRequests',
      'fa': 'درخواست‌های کمک',
      'nl': 'Hulp\nVerzoeken',
    },
    'wrgp7a0a': {
      'en': 'Help\nOffers',
      'fa': 'کمک\nپیشنهادات',
      'nl': 'Hulp\nAanbiedingen',
    },
    '037amlyc': {
      'en': 'Top Categories',
      'fa': 'دسته بندی های برتر',
      'nl': 'Topcategorieën',
    },
    '3b4w4odm': {
      'en': 'Categories members like the most',
      'fa': 'دسته بندی هایی که اعضا بیشتر دوست دارند',
      'nl': 'Categorieën die leden het leukst vinden',
    },
    'tlwgczrq': {
      'en': 'Popular Posts',
      'fa': 'پست‌های محبوب',
      'nl': 'Populaire berichten',
    },
    'vktu3546': {
      'en': 'See all',
      'fa': 'همه را ببینید',
      'nl': 'Bekijk alles',
    },
    'sxc6153h': {
      'en': 'Most liked posts by  the community members',
      'fa': 'پست‌های پربازدید توسط اعضای انجمن',
      'nl': 'Meest gewaardeerde berichten van de communityleden',
    },
    'h01izxww': {
      'en': 'New Help Requests',
      'fa': 'درخواست‌های کمک جدید',
      'nl': 'Nieuwe hulpverzoeken',
    },
    'vuta9zjn': {
      'en': 'See all',
      'fa': 'همه را ببینید',
      'nl': 'Bekijk alles',
    },
    '8dcnikak': {
      'en': 'Most recent posts asking for help',
      'fa': 'جدیدترین پست‌ها درخواست کمک',
      'nl': 'Meest recente berichten waarin om hulp wordt gevraagd',
    },
    'qdios0ta': {
      'en': 'New Help Offers',
      'fa': 'پیشنهادات جدید کمک',
      'nl': 'Nieuwe Help-aanbiedingen',
    },
    'jkkdwa93': {
      'en': 'See all',
      'fa': 'همه را ببینید',
      'nl': 'Bekijk alles',
    },
    'monqa5zf': {
      'en': 'Most recent posts offering help',
      'fa': 'جدیدترین پست‌های ارائه دهنده کمک',
      'nl': 'Meest recente berichten die hulp aanbieden',
    },
    '60czvw6q': {
      'en': 'Community Care',
      'fa': 'مراقبت‌های اجتماعی',
      'nl': 'Gemeenschapszorg',
    },
    'o0cqrexj': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ContactYEKJA
  {
    'uaue3xf2': {
      'en': 'Welcome to support ',
      'fa': 'به پشتیبانی خوش آمدید',
      'nl': 'Welkom bij de ondersteuning',
    },
    '18qj4qd2': {
      'en': 'Make sure you check our ',
      'fa': '',
      'nl': '',
    },
    'f2k084ch': {
      'en': 'FAQ',
      'fa': '',
      'nl': '',
    },
    'b3om7lkw': {
      'en': 'Make sure you check our FAQ',
      'fa': 'حتماً سوالات متداول ما را بررسی کنید',
      'nl': 'Zorg ervoor dat u onze FAQ bekijkt',
    },
    'ydnrk5zy': {
      'en': 'Call Us',
      'fa': 'با ما تماس بگیرید',
      'nl': 'Bel ons',
    },
    'ofdaiisb': {
      'en': 'Search FAQs',
      'fa': 'سوالات متداول جستجو',
      'nl': 'Veelgestelde vragen zoeken',
    },
    'zlr86zaw': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'uy7ff9ps': {
      'en': 'Choose a relevant subject',
      'fa': 'یک موضوع مرتبط انتخاب کنید',
      'nl': 'Kies een relevant onderwerp',
    },
    'ol3f2ple': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'rhw1og4g': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
      'nl': 'Optie 1',
    },
    '9ptgnueo': {
      'en': 'Option 2',
      'fa': 'گزینه ۲',
      'nl': 'Optie 2',
    },
    '1jg9wm4c': {
      'en': 'Option 3',
      'fa': 'گزینه ۳',
      'nl': 'Optie 3',
    },
    '7p9q5poi': {
      'en':
          'Please provide description of your inquiry here. We will do our best to come back to you as soon as possible. ',
      'fa':
          'لطفا شرح درخواست خود را اینجا بنویسید. ما تمام تلاش خود را خواهیم کرد تا در اسرع وقت با شما تماس بگیریم.',
      'nl':
          'Geef hier een omschrijving van uw vraag. We doen ons best om zo snel mogelijk contact met u op te nemen.',
    },
    'n246spdb': {
      'en':
          'Please use only letters (English/Persian), spaces, a dot or underscore.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، نقطه یا زیرخط استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, een punt of onderstrepingsteken.',
    },
    'u1tki64s': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'qc3iypvs': {
      'en': 'Upload image',
      'fa': 'آپلود تصویر',
      'nl': 'Afbeelding uploaden',
    },
    'ziper6ve': {
      'en': 'Submit ',
      'fa': 'ارسال',
      'nl': 'Indienen',
    },
    'md9u0vgx': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // chatdetail
  {
    'wsj9su2t': {
      'en': 'Accept & close post when ready!',
      'fa': 'وقتی آماده شد، پست را بپذیرید و ببندید!',
      'nl': 'Accepteer en sluit het bericht als je klaar bent!',
    },
    'p1eefnvj': {
      'en': 'All done?',
      'fa': ' تمام؟',
      'nl': 'Alles klaar?',
    },
    '6u0sie6q': {
      'en': 'Ready to close this post and give each other review scores?',
      'fa': 'آماده‌ای این پست را ببندی و به یکدیگر امتیاز بدهید؟',
      'nl':
          'Bent u klaar om dit bericht te sluiten en elkaar beoordelingen te geven?',
    },
    '8xgki3cf': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'obpbp262': {
      'en': 'Type here',
      'fa': 'اینجا تایپ کنید',
      'nl': 'Typ hier',
    },
    'ixvb7rf1': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // DetailRentals
  {
    'i2k2zt4c': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'kjzhkoro': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    '0t9ks399': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'xmtjj0up': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    '29bchon4': {
      'en': 'Details about your ',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    '11ou3mom': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'dgh17pei': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    'zlpz83yb': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'c0z72le4': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'ki5vg6i3': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'cw5hzgjx': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'l47jxe8h': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'eml3sji2': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'oj36fxbg': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'y82pkapp': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    '1dbbegru': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'i6tytr32': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'xedjp0yj': {
      'en': 'Rental Type',
      'fa': 'نوع اجاره',
      'nl': 'Huurtype',
    },
    'uhl6xl97': {
      'en': 'Long-Term',
      'fa': 'بلندمدت',
      'nl': 'Lange termijn',
    },
    'dv9t32fm': {
      'en': 'Short-Term',
      'fa': 'کوتاه مدت',
      'nl': 'Korte termijn',
    },
    'wnwel91z': {
      'en': 'Sublet',
      'fa': 'اجاره فرعی',
      'nl': 'Onderverhuren',
    },
    'v3s3ysuk': {
      'en': 'Co-Living',
      'fa': 'هم‌خانه‌ای',
      'nl': 'Samenwonen',
    },
    'um5oamy8': {
      'en': 'Flexible',
      'fa': 'منعطف هستم',
      'nl': 'Flexibele',
    },
    'j10xsxsq': {
      'en': 'Total Area (m2):',
      'fa': 'مساحت کل (متر مربع):',
      'nl': 'Totale oppervlakte (m2):',
    },
    'q0a49sup': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'jzba3thw': {
      'en': 'Availability',
      'fa': 'بازهٔ زمانی اجاره',
      'nl': 'Beschikbaarheid',
    },
    't1ab9yoz': {
      'en': 'Price',
      'fa': 'قیمت',
      'nl': 'Prijs',
    },
    'k2h7igyv': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '9l12r0f8': {
      'en': 'per',
      'fa': 'به ازای هر',
      'nl': 'per',
    },
    '1r311j54': {
      'en': 'Select..',
      'fa': 'انتخاب کنید..',
      'nl': 'Selecteer..',
    },
    'yye3471y': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'ns6xe18s': {
      'en': 'hour',
      'fa': 'ساعت',
      'nl': 'uur',
    },
    'aspkqw5u': {
      'en': 'day',
      'fa': 'روز',
      'nl': 'dag',
    },
    '40j17v6f': {
      'en': 'night',
      'fa': 'شب',
      'nl': 'nacht',
    },
    'n4x6bc4w': {
      'en': 'week',
      'fa': 'هفته',
      'nl': 'week',
    },
    'wdzvygiw': {
      'en': 'month',
      'fa': 'ماه',
      'nl': 'maand',
    },
    'gbggb7so': {
      'en': 'year',
      'fa': 'سال',
      'nl': 'jaar',
    },
    'szljnmug': {
      'en': 'Deposit:',
      'fa': 'پیش پرداخت:',
      'nl': 'Borg:',
    },
    '21etygi0': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '9s1vxa8a': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'opmbewd0': {
      'en': 'Price Class',
      'fa': 'حدود قیمت',
      'nl': 'Prijsklasse',
    },
    '7ls3ku09': {
      'en': 'Under €1,000',
      'fa': 'زیر ۱۰۰۰ یورو',
      'nl': 'Onder €1.000',
    },
    'f67n8tk2': {
      'en': 'Under €2,000',
      'fa': 'زیر ۲۰۰۰ یورو',
      'nl': 'Onder € 2.000',
    },
    '12qd3c92': {
      'en': 'Under €3000',
      'fa': 'زیر ۳۰۰۰ یورو',
      'nl': 'Onder €3000',
    },
    'eqb3di1t': {
      'en': 'Any Price',
      'fa': 'هر قیمتی',
      'nl': 'Elke prijs',
    },
    '9ai0llrw': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    'd572bc3m': {
      'en': 'Registration Needed/Possible?',
      'fa': 'رجیستر لازم/ممکن است؟',
      'nl': 'Registratie nodig/mogelijk?',
    },
    'k36l0tnz': {
      'en': 'Furnished?',
      'fa': 'مبله؟',
      'nl': 'Gemeubileerd?',
    },
    '3jlbd3yl': {
      'en': 'Utilities Included?',
      'fa': 'شامل هزینه‌های قبوض؟',
      'nl': 'incl. G/W/L',
    },
    'e1emmok0': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'hfdx27wx': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'dnaxnao0': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailSales
  {
    'umi1tia3': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'gvahl0ml': {
      'en': '4',
      'fa': '۴',
      'nl': '4',
    },
    'dlunofp8': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'dzeetgze': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'k6f3f1iv': {
      'en': 'Details about your ',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'ktcoqfcb': {
      'en': 'item to sell',
      'fa': 'مورد برای فروش',
      'nl': 'artikel om te verkopen',
    },
    'gbnahsqm': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'cezqw3hd': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    'jyf96aez': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'fek8z4ho': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    '3zmhx945': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'z5ykdy6b': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'lnt7h57h': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'd15pcah3': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    '0bpci57f': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'mnin06ya': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'iwpp6cwh': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'rcpmo092': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'z2lalgrq': {
      'en': 'Condition',
      'fa': 'وضعیت',
      'nl': 'Voorwaarde',
    },
    '1a8kyuld': {
      'en': 'New',
      'fa': 'جدید',
      'nl': 'Nieuw',
    },
    '5tp0a0dn': {
      'en': 'Used - Like New',
      'fa': 'کارکرده - مشابه نو',
      'nl': 'Gebruikt - Als nieuw',
    },
    'l17abn2d': {
      'en': 'Used - Fair',
      'fa': 'کارکرده',
      'nl': 'Gebruikt - Redelijk',
    },
    'n8939ymc': {
      'en': 'Delivery',
      'fa': 'تحویل',
      'nl': 'Levering',
    },
    '35v6i4cg': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'wjspq3vv': {
      'en': 'Pick-Up Only',
      'fa': ' تحویل حضوری',
      'nl': 'Alleen afhalen',
    },
    '2zy9jngr': {
      'en': 'Sent by Post',
      'fa': 'ارسال  با پست',
      'nl': 'Verzonden per post',
    },
    'n71xiclx': {
      'en': 'Free Delivery',
      'fa': 'تحویل رایگان',
      'nl': 'Gratis bezorging',
    },
    '3oank8zl': {
      'en': 'Price',
      'fa': 'قیمت',
      'nl': 'Prijs',
    },
    'g51z4ag3': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    '39711slm': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    't34cpmie': {
      'en': 'price is required',
      'fa': '',
      'nl': '',
    },
    'nzdfm26i': {
      'en': 'Please only use numbers.',
      'fa': '',
      'nl': '',
    },
    '0d4agwnm': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'bdue310f': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'gsufvd5f': {
      'en': 'Price Class',
      'fa': 'کلاس قیمت',
      'nl': 'Prijsklasse',
    },
    'lfw1zl4w': {
      'en': 'Under €1,000',
      'fa': 'زیر ۱۰۰۰ یورو',
      'nl': 'Onder €1.000',
    },
    'cpveulx3': {
      'en': 'Under €2,000',
      'fa': 'زیر ۲۰۰۰ یورو',
      'nl': 'Onder € 2.000',
    },
    'bh69sazu': {
      'en': 'Under €3000',
      'fa': 'زیر ۳۰۰۰ یورو',
      'nl': 'Onder €3000',
    },
    't5bbbgfg': {
      'en': 'Any Price',
      'fa': 'هر قیمتی',
      'nl': 'Elke prijs',
    },
    'zo4qiwvz': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    'psy1m1j2': {
      'en': 'Open for swap?',
      'fa': 'برای سوآپ باز شده؟',
      'nl': 'Open voor ruil?',
    },
    'p31bqpjt': {
      'en': 'Try item exchange, not just payment.',
      'fa': 'مبادله کالا را امتحان کنید، نه فقط پرداخت.',
      'nl': 'Probeer eens een artikel te ruilen, niet alleen betalen.',
    },
    '38e3zjus': {
      'en': 'Please insert a wishlist for what you want in return.',
      'fa':
          'لطفاً یک لیست دلخواه برای آنچه که در ازای آن می‌خواهید، وارد کنید.',
      'nl': 'Voeg een verlanglijstje toe met wat u in ruil daarvoor wenst.',
    },
    'ai0foikt': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '3699a1sd': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Voor welke artikelen wilt u ruilen?',
    },
    'oim5aeia': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa': '',
      'nl': '',
    },
    'c4m2zo5w': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'xxw4ioga': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'fha4ecx7': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'whxo726d': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailGiveAway
  {
    '569xs1qk': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'j0vrrbv7': {
      'en': '4',
      'fa': '۴',
      'nl': '4',
    },
    'jlkcjv7k': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'caecumvf': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    '0bfcni7u': {
      'en': 'Details about your ',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'zke2pwqa': {
      'en': 'item to give away',
      'fa': 'کالایی برای هدیه دادن',
      'nl': 'item om weg te geven',
    },
    'hh37t41a': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    '2jnhw97r': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    '1a7e8j3s': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'ho1n1j72': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'iw0jeq5e': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'jaal6fbj': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '1a8omnm1': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'w0v4sm15': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    '7rtkn8rw': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'fqb533gf': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    '5ekn6nuk': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'f5cf9jbc': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'cflpm8dj': {
      'en': 'Condition',
      'fa': 'وضعیت',
      'nl': 'Voorwaarde',
    },
    'beppbgau': {
      'en': 'New',
      'fa': 'جدید',
      'nl': 'Nieuw',
    },
    'rcmxis99': {
      'en': 'Used - Like New',
      'fa': 'کارکرده - مشابه نو',
      'nl': 'Gebruikt - Als nieuw',
    },
    'bif5doj2': {
      'en': 'Used - Fair',
      'fa': 'کارکرده',
      'nl': 'Gebruikt - Redelijk',
    },
    'eru4109y': {
      'en': 'Delivery',
      'fa': 'تحویل',
      'nl': 'Levering',
    },
    'dgyudrcd': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'bk7qkf31': {
      'en': 'Pick-Up Only',
      'fa': ' تحویل حضوری',
      'nl': 'Alleen afhalen',
    },
    '3k180gdk': {
      'en': 'Sent by Post',
      'fa': 'ارسال  با پست',
      'nl': 'Verzonden per post',
    },
    'oskg8m4r': {
      'en': 'Free Delivery',
      'fa': 'تحویل رایگان',
      'nl': 'Gratis bezorging',
    },
    '382ddprf': {
      'en': 'Price Class',
      'fa': 'کلاس قیمت',
      'nl': 'Prijsklasse',
    },
    '22yth6md': {
      'en': 'Under €1,000',
      'fa': 'زیر ۱۰۰۰ یورو',
      'nl': 'Onder €1.000',
    },
    '6tvyq410': {
      'en': 'Under €2,000',
      'fa': 'زیر ۲۰۰۰ یورو',
      'nl': 'Onder € 2.000',
    },
    '09d2k7m2': {
      'en': 'Under €3000',
      'fa': 'زیر ۳۰۰۰ یورو',
      'nl': 'Onder €3000',
    },
    '92cfgxa3': {
      'en': 'Any Price',
      'fa': 'هر قیمتی',
      'nl': 'Elke prijs',
    },
    'awde4lpb': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    'pbeqpsj6': {
      'en': 'Open for swap?',
      'fa': 'برای سوآپ باز شده؟',
      'nl': 'Open voor ruil?',
    },
    'wcnqe1gw': {
      'en': 'Try item exchange, not just payment.',
      'fa': 'مبادله کالا را امتحان کنید، نه فقط پرداخت.',
      'nl': 'Probeer eens een artikel te ruilen, niet alleen betalen.',
    },
    'tkul9z9c': {
      'en': 'Please insert a wishlist for what you want in return.',
      'fa':
          'لطفاً یک لیست دلخواه برای آنچه که در ازای آن می‌خواهید، وارد کنید.',
      'nl': 'Voeg een verlanglijstje toe met wat u in ruil daarvoor wenst.',
    },
    'k8v335sd': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'vg1ce5gk': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Voor welke artikelen wilt u ruilen?',
    },
    '89gasxy1': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa': '',
      'nl': '',
    },
    'j3lgifec': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'zp5nvud3': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'n9gj6enp': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    '73v108cn': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailSwapItems
  {
    'aozmhw4u': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'rf10fvhl': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'jpejlo9e': {
      'en': ' of ',
      'fa': ' از',
      'nl': 'van',
    },
    'y4sqlq48': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'j2mqcfx9': {
      'en': 'Details about your',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    '08n0yc3b': {
      'en': 'item swap',
      'fa': 'مبادله کالا',
      'nl': 'item ruil',
    },
    'xcdfbio2': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'yrq89ts4': {
      'en': 'Title',
      'fa': '',
      'nl': '',
    },
    '1t2ybuxp': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '8qub49xp': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    '2u4xggi7': {
      'en': 'Description',
      'fa': '',
      'nl': '',
    },
    'sjh0ulkv': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '49m211ow': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'x24er6a4': {
      'en': 'Location',
      'fa': '',
      'nl': '',
    },
    'b96va8w1': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    'zvyse8ai': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'ig3jh1v1': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'wji2a8s8': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'pjy3012q': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'z1y6ljv6': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'kif7efnv': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'p1tydbnl': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'ylnjqkud': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'nog97kra': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    '5hgb5wf6': {
      'en': 'Deliverye',
      'fa': '',
      'nl': '',
    },
    'hrtd2q5g': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    'mjs3qjgz': {
      'en': 'Delivery',
      'fa': 'تحویل',
      'nl': 'Levering',
    },
    'xgagv1mq': {
      'en': 'By Agreement',
      'fa': ' توافقی',
      'nl': 'In overleg',
    },
    'c8qu362r': {
      'en': 'Pick-Up Only',
      'fa': ' تحویل حضوری',
      'nl': 'Afhalen',
    },
    'cfz5c46e': {
      'en': 'Sent by Post',
      'fa': 'ارسال  با  پست',
      'nl': 'Verzonden per post',
    },
    '39k5fdm8': {
      'en': 'Free Delivery',
      'fa': 'تحویل رایگان',
      'nl': 'Gratis bezorging',
    },
    'whd5sol7': {
      'en': 'Wishlist',
      'fa': 'لیست علاقه‌مندی‌ها',
      'nl': 'verlanglijstje',
    },
    'u6ez8fmp': {
      'en': 'Please insert a wishlist for what you want in return.',
      'fa':
          'لطفاً یک لیست دلخواه برای آنچه که در ازای آن می‌خواهید، وارد کنید.',
      'nl': 'Voeg een verlanglijstje toe met wat u in ruil daarvoor wenst.',
    },
    'wn40dywk': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '1iqn48px': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Voor welke artikelen wilt u ruilen?',
    },
    'wukfcoma': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa': '',
      'nl': '',
    },
    'kqj2ar6o': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'txu3x8o7': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    'd0tqcv4n': {
      'en': 'Allow cash adjustment?',
      'fa': 'اجازهٔ تسویه نقدی؟',
      'nl': 'Contante bijbetaling?',
    },
    'g7l755yk': {
      'en': 'You or the other user can add a bit of cash to balance the swap.',
      'fa':
          'شما یا کاربر دیگر می‌توانید کمی پول نقد اضافه کنید تا سوآپ را متعادل کنید.',
      'nl':
          'Jij of de andere gebruiker kan een klein bedrag toevoegen om de swap in evenwicht te brengen.',
    },
    '5buz8b30': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    '5v7za05v': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'o8ohiub9': {
      'en': '6',
      'fa': '',
      'nl': '',
    },
    'q4yp49b5': {
      'en': 'Details about your',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'biiohvxh': {
      'en': 'borrow request',
      'fa': 'درخواست امانت',
      'nl': 'leenaanvraag',
    },
    'k034644c': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'vq94tkzh': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    '0g05oij9': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'nxl1a5ul': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'yo39xlof': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'n2zdt87s': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'a88t6r2a': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'ub14pqbe': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'h47012yx': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'tn5l9e4a': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'bxzyhcgs': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'kaflki7c': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'afwtxktl': {
      'en': 'Duration',
      'fa': 'مدت زمان',
      'nl': 'Duur',
    },
    'vgnftlvs': {
      'en': 'Your deadline:',
      'fa': 'مهلت شما:',
      'nl': 'Uw deadline:',
    },
    'ohr57sk3': {
      'en': 'For how many days?',
      'fa': 'برای چند روز؟',
      'nl': 'Voor hoeveel dagen?',
    },
    's83uwbqf': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '6fm7r7ko': {
      'en': 'Compensation (optional)',
      'fa': 'پاداش (اختیاری)',
      'nl': 'Compensatie',
    },
    'lx9z68l6': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    '4yknl3p9': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '8kpvo2qd': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    '7saqyfxb': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'td12p8u4': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'gjymting': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailTicketSwap
  {
    '2q0ispdh': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'p7f0byc7': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'ibldjymf': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'erw75s64': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'nhf8w4f8': {
      'en': 'Details about your ',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'bu8f9ttf': {
      'en': 'ticket swap',
      'fa': 'تعویض بلیط',
      'nl': 'ticketruil',
    },
    'c4rjjccb': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'lezz4mlq': {
      'en': 'Title',
      'fa': '',
      'nl': '',
    },
    'wzhz4wlc': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    's8iqcgar': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    'fzkvd1wu': {
      'en': 'Description',
      'fa': '',
      'nl': '',
    },
    '1x0t4843': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '7lwejce8': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'boiwnof2': {
      'en': 'Location & Time',
      'fa': '',
      'nl': '',
    },
    'lfzdhox1': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '86dxy2w2': {
      'en': 'Location & Time',
      'fa': 'مکان و زمان',
      'nl': 'Locatie en tijd',
    },
    'wzyumqwm': {
      'en': 'City:',
      'fa': 'شهر:',
      'nl': 'Stad:',
    },
    'yl0n4v1x': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    '8suzjqsw': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'eny6naiz': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'qaia7y5s': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'n8vo379e': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'gdh7wyeo': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    '951yh0c4': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'kr931b99': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'i795xn0d': {
      'en': 'Venue Name:',
      'fa': 'نام محل برگزاری:',
      'nl': 'Locatienaam:',
    },
    't8rl0pvu': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '5uv7jgtj': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'zjr31iza': {
      'en': 'Event Date:',
      'fa': 'تاریخ رویداد:',
      'nl': 'Evenementdatum:',
    },
    'u1em63oh': {
      'en': 'Quantity',
      'fa': '',
      'nl': '',
    },
    'jjn035dr': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '1hzunx06': {
      'en': 'Quantity',
      'fa': 'مقدار',
      'nl': 'Hoeveelheid',
    },
    'h4m9ps4s': {
      'en': 'Ticket Quantity:',
      'fa': 'تعداد بلیط:',
      'nl': 'Tickethoeveelheid:',
    },
    'ixfs5a0y': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ki8iepox': {
      'en': 'Please only use numbers.',
      'fa': '',
      'nl': '',
    },
    'vflwt5pj': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'zhxhx7nz': {
      'en': 'Price',
      'fa': '',
      'nl': '',
    },
    'w82qbv05': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    'wg4o51ol': {
      'en': 'Price',
      'fa': 'قیمت',
      'nl': 'Prijs',
    },
    'tksd3hx2': {
      'en': 'By Agreement:',
      'fa': 'طبق توافق:',
      'nl': 'In overleg:',
    },
    'o34zrvkm': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'jgypiur7': {
      'en': 'Please only use numbers.',
      'fa': '',
      'nl': '',
    },
    '4gjdl0io': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'yq4oenko': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'ywa3czll': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    '1rgiabxg': {
      'en': 'Open for swap without money?',
      'fa': 'برای سوآپ بدون پول باز است؟',
      'nl': 'Open voor ruil zonder geld?',
    },
    '77uuem4d': {
      'en': 'Try item exchange, not just payment.',
      'fa': 'مبادله کالا را امتحان کنید، نه فقط پرداخت.',
      'nl': 'Probeer eens een artikel te ruilen, niet alleen betalen.',
    },
    'n7rm4sxc': {
      'en': 'Please insert a wishlist for what you want in return.',
      'fa':
          'لطفاً یک لیست دلخواه برای آنچه که در ازای آن می‌خواهید، وارد کنید.',
      'nl': 'Voeg een verlanglijstje toe met wat u in ruil daarvoor wenst.',
    },
    'urn4qss6': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '1bv0ikje': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Voor welke artikelen wilt u ruilen?',
    },
    'zaums6gv': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa': '',
      'nl': '',
    },
    'x9yhqtds': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'luh3rdt6': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'er5xc5je': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'ws8876ah': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailCurrencyExchange
  {
    '17xrt80e': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'cl2ivgrm': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    '5qq3hx35': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    '808pynxb': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'znjxyn0k': {
      'en': 'Details about your',
      'fa': 'جزئیات مربوط به ',
      'nl': 'Gegevens over uw',
    },
    'gk8qg01c': {
      'en': 'currency exchange',
      'fa': 'خرید و فروش ارز',
      'nl': 'wisselkantoor',
    },
    'rhxrulgi': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    '9v80v1z3': {
      'en': 'Title',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'fn5dgh3u': {
      'en': '*',
      'fa': '',
      'nl': '',
    },
    'i86k6q1i': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'o9653wwb': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    '2ajc4s5u': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'h3cuc3zp': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '9zsnbz33': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    '8nttwwqa': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    '45az7ywd': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    't695us99': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'a2jmo452': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'fnc3mnmi': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'li7evtos': {
      'en': 'Currency',
      'fa': 'ارز',
      'nl': 'Munteenheid',
    },
    'e04ggwe7': {
      'en': 'Euro',
      'fa': 'یورو',
      'nl': 'Euro',
    },
    'hbbjx0bx': {
      'en': 'USD',
      'fa': 'دلار آمریکا',
      'nl': 'Amerikaanse dollar',
    },
    '3nybfk4h': {
      'en': 'Amount:',
      'fa': 'تعداد ارز:',
      'nl': 'Hoeveelheid:',
    },
    'zqql20jx': {
      'en': '',
      'fa': 'مبلغ',
      'nl': 'Hoeveelheid',
    },
    'jpjzjfc1': {
      'en': 'Numbers only.',
      'fa': '',
      'nl': '',
    },
    'bqy92p76': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '1b3l59px': {
      'en': '*',
      'fa': '',
      'nl': '',
    },
    'samgtsrz': {
      'en': 'Price',
      'fa': 'قیمت',
      'nl': 'Prijs',
    },
    'wull39th': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'wj6bmnps': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ssh7o6u6': {
      'en': 'Numbers only.',
      'fa': '',
      'nl': '',
    },
    'c4sbf9x9': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '16ebkzkj': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'wmd3lbpl': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    '2oi8j9j2': {
      'en': 'I\'ll Pay First',
      'fa': 'من اول پرداخت می‌کنم',
      'nl': 'Ik betaal eerst',
    },
    'mx6q6t51': {
      'en': 'Pay After',
      'fa': 'پرداخت پس از تحریل ارز',
      'nl': 'Betaal achteraf',
    },
    'i28tnnp4': {
      'en': 'Flexible',
      'fa': ' پرداخت توافقی',
      'nl': 'Flexibele',
    },
    'rj1h5dym': {
      'en': 'Allow partial trade?',
      'fa': 'حاضر به مبادله جزئی؟',
      'nl': 'Gedeeltelijke handel toestaan?',
    },
    'igvsuetz': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'ritftihu': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'bdzncucc': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailCareAndAssistance
  {
    'w01m58me': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'mkecadja': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'zkms5fe1': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'kpg0fdit': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'qjuj07rg': {
      'en': 'Details about your',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'nga3ya0w': {
      'en': 'support post',
      'fa': 'پست پشتیبانی',
      'nl': 'ondersteuningspost',
    },
    'i1n166r0': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'uzhr4z1s': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    '9ph8lxsc': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'wpdfqsiq': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    '2nl17z9d': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'o9wthtmb': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '6x3fojhi': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    '8javjnda': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'bbophh0r': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'j77cpnnt': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'das7goho': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    '48h09fsy': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'yc6m1j1g': {
      'en': 'Deadline',
      'fa': 'مهلت',
      'nl': 'Termijn',
    },
    'zi6grwu2': {
      'en': 'Compensation',
      'fa': 'جبران خسارت',
      'nl': 'Compensatie',
    },
    'lvwzfby4': {
      'en': 'Free help appreciated',
      'fa': 'کمک رایگان مورد تقدیر است',
      'nl': 'Gratis hulp wordt gewaardeerd',
    },
    '20xkyxrc': {
      'en': 'Can offer something back',
      'fa': 'حاضر به پرداخت در عوض',
      'nl': 'Kan iets terugdoen',
    },
    'jy7n8fge': {
      'en': 'Flexible',
      'fa': 'انعطاف‌پذیر',
      'nl': 'Flexibele',
    },
    'lwx39hgw': {
      'en': 'Free / Just helping',
      'fa': 'رایگان صرفآ برای کمک',
      'nl': 'Gratis / Gewoon helpen',
    },
    '5gulvjxg': {
      'en': 'Give what you feel',
      'fa': 'پاداش می پذیرد',
      'nl': 'Geef wat je voelt',
    },
    'gwy1uxk4': {
      'en': 'Flexible',
      'fa': 'انعطاف‌پذیر',
      'nl': 'Flexibele',
    },
    '83sc63g8': {
      'en': 'Preferances',
      'fa': 'ترجیحات',
      'nl': 'Voorkeuren',
    },
    'g140snbx': {
      'en': 'Open for swap?',
      'fa': 'برای سوآپ باز شده؟',
      'nl': 'Open voor ruil?',
    },
    'okfhv1oq': {
      'en': 'Please insert a wishlist of what you want in return',
      'fa': 'لطفا لیست آرزوهایی از آنچه در ازای آن می‌خواهید را وارد کنید',
      'nl': 'Voeg een verlanglijstje toe met wat u in ruil daarvoor wilt',
    },
    'qs36tiph': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'jz0m4wkl': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Welke artikelen wilt u ruilen?',
    },
    '8nx9yjx1': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'v6o4kog0': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'z7r4lvjf': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // DetailEvents
  {
    'a4rd6rwz': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'cghv1ir6': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'w551g7e7': {
      'en': ' of ',
      'fa': 'از',
      'nl': 'van',
    },
    'jlkoaugv': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'hom4dzos': {
      'en': 'Details about ',
      'fa': 'جزئیات مربوط به',
      'nl': 'Details over',
    },
    '2hfhu5k5': {
      'en': 'event post',
      'fa': 'پست رویداد',
      'nl': 'evenement bericht',
    },
    '02ax6rz5': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    '33qd6vje': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    'z4ekb2qy': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    'wz0ot8v5': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    '3k7x9zzh': {
      'en': 'City:',
      'fa': 'شهر:',
      'nl': 'Stad:',
    },
    '4g9jglj2': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'jx0ngmlm': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '31fzpvb7': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'pbv87sl1': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'a5kfzf1d': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'nv0hksqo': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    '2yk7tfh0': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'ji7s1tt3': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'eu0y6r9j': {
      'en': 'Venue Name:',
      'fa': 'نام محل برگزاری:',
      'nl': 'Locatienaam:',
    },
    'fopi64hs': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '10iinpa9': {
      'en': 'Address:',
      'fa': 'آدرس:',
      'nl': 'Adres:',
    },
    'hw2yvly7': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'i1z8dk0h': {
      'en': 'Date & Time',
      'fa': 'تاریخ و زمان',
      'nl': 'Datum en tijd',
    },
    'cx5qymde': {
      'en': 'Starts at:',
      'fa': 'شروع می‌شود از:',
      'nl': 'Begint om:',
    },
    'm20wyojj': {
      'en': 'Ends at (optional):',
      'fa': 'پایان می‌یابد در (اختیاری):',
      'nl': 'Eindigt om (optioneel):',
    },
    'sccmk1mq': {
      'en': 'Event repeats (optional)?',
      'fa': 'تکرار رویداد (اختیاری)؟',
      'nl': 'Gebeurtenisherhalingen (optioneel)?',
    },
    'v22mcqq9': {
      'en': 'Daily',
      'fa': 'هر روز یا شب',
      'nl': 'Dagelijks',
    },
    'hv4fqm3b': {
      'en': 'Weekly',
      'fa': 'هفتگی',
      'nl': 'Wekelijks',
    },
    'kbww3ght': {
      'en': 'Monthly',
      'fa': 'ماهانه',
      'nl': 'Maandelijks',
    },
    'h7w2y7vc': {
      'en': 'Yearly',
      'fa': 'سالانه',
      'nl': 'Jaarlijks',
    },
    'epl8urs2': {
      'en': 'Price & Capacity',
      'fa': 'قیمت و ظرفیت',
      'nl': 'Prijs & Capaciteit',
    },
    'eewjrpy6': {
      'en': 'Is this a free event?',
      'fa': 'آیا این یک رویداد رایگان است؟',
      'nl': 'Is dit een gratis evenement?',
    },
    '379rl08x': {
      'en': 'Pay what they can?',
      'fa': 'هر چقدر می‌توانند بپردازند؟',
      'nl': 'Betalen wat ze kunnen?',
    },
    '7v4k19h9': {
      'en': 'Or fill in the exact price:',
      'fa': 'یا قیمت دقیق را وارد کنید:',
      'nl': 'Of vul de exacte prijs in:',
    },
    'qm3e0a9n': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'snbevskk': {
      'en': 'Numbers only.',
      'fa': '',
      'nl': '',
    },
    '5ljejcqn': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '3m59iq7m': {
      'en': 'Capacity:',
      'fa': 'ظرفیت:',
      'nl': 'Capaciteit:',
    },
    '5ehf3v36': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'y0o3czo1': {
      'en': 'Numbers only.',
      'fa': '',
      'nl': '',
    },
    '8dddndt3': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'cxs946ao': {
      'en': 'URL (optional)',
      'fa': 'آدرس اینترنتی (اختیاری)',
      'nl': 'URL (optioneel)',
    },
    'fyyx577k': {
      'en':
          'In case needed, you can insert an online URL for your event here. ',
      'fa':
          'در صورت نیاز، می‌توانید یک URL آنلاین برای رویداد خود در اینجا وارد کنید.',
      'nl':
          'Indien nodig kunt u hier een online URL voor uw evenement invoeren.',
    },
    'ynapbsf4': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '6z4ynt98': {
      'en': 'What items are you looking to swap for?',
      'fa': 'دنبال چه اقلامی برای تعویض هستید؟',
      'nl': 'Voor welke artikelen wilt u ruilen?',
    },
    '78ks6xrw': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'x84mpl8h': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'vf63iwg2': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // FinalizedLogin
  {
    'o0gdhtwy': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // DetailSkills
  {
    'pz1jh2j0': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'folxd7bo': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    'lzr91ona': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'mxfb6ihq': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    'eflupep5': {
      'en': 'Details about your',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'tex3vqkw': {
      'en': 'service to offer',
      'fa': 'خدمات برای ارائه',
      'nl': 'dienst aan te bieden',
    },
    'q0u7f10k': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'utuzbcuw': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    '44bmawcn': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    '34tuhuw3': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    '7qg0csfd': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    '5miyhgqo': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'fvpmxwtm': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    '2xilk4a1': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'd9unc0jh': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'allvymzb': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'c4est0e1': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'e46te1ff': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'cjl03uix': {
      'en': 'Service Mode',
      'fa': 'حالت سرویس',
      'nl': 'Servicemodus',
    },
    'tlij6f0p': {
      'en': 'Remote',
      'fa': 'از راه دور',
      'nl': 'Op afstand',
    },
    '6ep0rgf6': {
      'en': 'In-person',
      'fa': 'حضوری',
      'nl': 'Persoonlijk',
    },
    'lr5nihza': {
      'en': 'At my place',
      'fa': 'در محلِ من',
      'nl': 'Op mijn locatie',
    },
    'tfpdwo3s': {
      'en': 'Flexible',
      'fa': 'مکان توافقی',
      'nl': 'Flexibele',
    },
    '77i3cx3i': {
      'en': 'Price',
      'fa': 'قیمت',
      'nl': 'Prijs',
    },
    'ah037la4': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'e212nvn8': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '70how8tb': {
      'en': 'price is required',
      'fa': '',
      'nl': '',
    },
    '9ulc4l5r': {
      'en': 'Please only use numbers.',
      'fa': '',
      'nl': '',
    },
    'g0e0moz1': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'iuegrp26': {
      'en': 'per',
      'fa': 'به ازای هر',
      'nl': 'per',
    },
    's4qowpfn': {
      'en': 'Select..',
      'fa': 'انتخاب کنید..',
      'nl': 'Selecteer..',
    },
    'wejspuwu': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'v924dh4a': {
      'en': 'hour',
      'fa': 'ساعت',
      'nl': 'uur',
    },
    'ozyficmy': {
      'en': 'day',
      'fa': 'روز',
      'nl': 'dag',
    },
    'fdk66m0n': {
      'en': 'night',
      'fa': 'شب',
      'nl': 'nacht',
    },
    'p7hnno8o': {
      'en': 'week',
      'fa': 'هفته',
      'nl': 'week',
    },
    'boyy3zp5': {
      'en': 'month',
      'fa': 'ماه',
      'nl': 'maand',
    },
    '797cksh5': {
      'en': 'year',
      'fa': 'سال',
      'nl': 'jaar',
    },
    'ek499l29': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'q9a2wtlm': {
      'en': 'Experience (years)',
      'fa': 'تجربه (اختیاری)',
      'nl': 'Ervaring (optioneel)',
    },
    '0qu5sgmm': {
      'en': '<1 year',
      'fa': '<1 سال',
      'nl': '<1 jaar',
    },
    '5jrtocln': {
      'en': '1-3 years',
      'fa': '۱-۳ سال',
      'nl': '1-3 jaar',
    },
    'dk59b7ss': {
      'en': '3-5 years',
      'fa': '۳-۵ سال',
      'nl': '3-5 jaar',
    },
    'nv2ixev4': {
      'en': '5-10 years',
      'fa': '۵-۱۰ سال',
      'nl': '5-10 jaar',
    },
    'ss1xe1s4': {
      'en': '10+ years',
      'fa': '۱۰+ سال',
      'nl': '10+ jaar',
    },
    'en4qxtra': {
      'en': 'Languages (optional)',
      'fa': 'زبان‌ها (اختیاری)',
      'nl': 'Talen (optioneel)',
    },
    'd5hrgm0v': {
      'en': 'Farsi',
      'fa': 'فارسی',
      'nl': 'Perzisch',
    },
    'fcujhj2h': {
      'en': 'Dutch',
      'fa': 'هلندی',
      'nl': 'Nederlands',
    },
    'd6xli9xh': {
      'en': 'English',
      'fa': 'انگلیسی',
      'nl': 'Engels',
    },
    'e00vrlpw': {
      'en': 'Turkish',
      'fa': 'ترکی',
      'nl': 'Turks',
    },
    '5j3p68kd': {
      'en': 'Urdu',
      'fa': 'اردو',
      'nl': 'Urdu',
    },
    'mzea4pzo': {
      'en': 'Arabic',
      'fa': 'عربی',
      'nl': 'Arabisch',
    },
    'l8joc4ww': {
      'en': 'Kurdish',
      'fa': 'کردی',
      'nl': 'Koerdisch',
    },
    '4f0n49sx': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'vm1fmibp': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'gldt8jrc': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // ResetPasswordPage
  {
    'apdbizbi': {
      'en': 'Reset Password',
      'fa': 'بازنشانی رمز عبور',
      'nl': 'Wachtwoord opnieuw instellen',
    },
    'jr6jre2f': {
      'en': 'Create a new password to log in',
      'fa': 'برای ورود به سیستم، رمز عبور جدیدی ایجاد کنید',
      'nl': 'Maak een nieuw wachtwoord aan om in te loggen',
    },
    '0peyon7h': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'nl': 'Nieuw wachtwoord',
    },
    'c6lydnkl': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'nl': 'Nieuw wachtwoord',
    },
    'e3y7muka': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
      'nl': 'Bevestig wachtwoord',
    },
    'gyid9abr': {
      'en': 'Confirm password',
      'fa': 'تأیید رمز عبور',
      'nl': 'Bevestig wachtwoord',
    },
    'tvflwo86': {
      'en': 'Reset password',
      'fa': 'بازنشانی رمز عبور',
      'nl': 'Wachtwoord opnieuw instellen',
    },
    'rfogeldx': {
      'en': 'Please enter valid new password.',
      'fa': 'لطفا رمز عبور جدید معتبری وارد کنید.',
      'nl': 'Voer een nieuw, geldig wachtwoord in.',
    },
    '91ioakpl': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '22lxza13': {
      'en': 'please enter valid confirm passsword.',
      'fa': 'لطفا رمز عبور معتبر وارد کنید.',
      'nl': 'Voer een geldig bevestigingswachtwoord in.',
    },
    'cqusyo0b': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'wnv1c0l4': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // Splash
  {
    'twp4gkdv': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostMainCat
  {
    'gbvj8ngz': {
      'en': 'Main Category',
      'fa': 'دسته اصلی',
      'nl': 'Hoofd categorie',
    },
    'i2d479eh': {
      'en': '1 ',
      'fa': '۱',
      'nl': '1',
    },
    '30yqurbu': {
      'en': 'of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'jbvgtm1l': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    '5ih7nup2': {
      'en': 'What’s your\nnew post about?',
      'fa': 'پست جدیدت در مورد چیه؟',
      'nl': 'Waar gaat je\nnieuwe bericht over?',
    },
    'k4ql5elb': {
      'en': 'Voluntary Support',
      'fa': 'همیاری داوطلبانه',
      'nl': 'Vrijwillige ondersteuning',
    },
    'errx5eou': {
      'en': 'Offer or request support',
      'fa': 'پیشنهاد یا درخواست پشتیبانی یا کمک',
      'nl': 'Ondersteuning aanbieden of aanvragen',
    },
    '4qyffrty': {
      'en': 'Community Market',
      'fa': 'بازار محلی',
      'nl': 'Gemeenschapsmarkt',
    },
    '9exgqc2a': {
      'en': 'Sell, rent, transfer parcels, shops,..',
      'fa': 'فروش، اجاره،حمل بار، مغازه ها، ...',
      'nl': 'Verkoop, verhuur, overdracht van percelen, winkels,..',
    },
    'kaywgjyd': {
      'en': 'Premium Services',
      'fa': 'ارائه خدمات و کسب و کارها',
      'nl': 'Premiumdiensten',
    },
    'kyzdos39': {
      'en': 'Skilled professionals, helpers, experts',
      'fa': 'متخصصان ماهر، مددکاران، متخصصان',
      'nl': 'Vakkundige professionals, helpers, experts',
    },
    'riperam9': {
      'en': 'Events & \nAnnouncements',
      'fa': 'رویدادها و اطلاعیه‌ها',
      'nl': 'Evenementen en\nAankondigingen',
    },
    'tlce1sd2': {
      'en': 'Host or announce events',
      'fa': 'میزبانی رویدادها  یا اطلاعیه ها',
      'nl': 'Evenementen organiseren of aankondigen',
    },
    'beewftzt': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    'kg4285e0': {
      'en': 'Home',
      'fa': '',
      'nl': '',
    },
  },
  // ChatPage
  {
    'au6wzutq': {
      'en': 'Chats',
      'fa': 'چت‌ها',
      'nl': 'Chatten',
    },
    '4nojqmye': {
      'en': 'All',
      'fa': 'همه',
      'nl': 'Alle',
    },
    'e248wdxf': {
      'en': 'My Posts',
      'fa': 'پست‌های من',
      'nl': 'Mijn berichten',
    },
    'pspduh98': {
      'en': 'Other\'s Posts',
      'fa': 'پست‌های دیگران',
      'nl': 'van anderen',
    },
    '9bsrpmk4': {
      'en': 'Yekja',
      'fa': 'یکجا',
      'nl': 'Yekja',
    },
    'i9836zr0': {
      'en': 'Delete chat',
      'fa': 'حذف چت',
      'nl': 'Chat verwijderen',
    },
    'n958loab': {
      'en': 'Press confirm if you intend to delete this chat.',
      'fa': 'اگر قصد حذف این چت را دارید، تأیید را فشار دهید.',
      'nl': 'Klik op Bevestigen als u deze chat wilt verwijderen.',
    },
    '46z72kp3': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'lkl0kp7h': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    '5g28h2j2': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // SearchPage
  {
    'h96yelv3': {
      'en': 'Searh Results',
      'fa': 'نتایج جستجو',
      'nl': 'Zoekresultaten',
    },
    '1je8wpdn': {
      'en': 'Filter',
      'fa': 'فیلتر',
      'nl': 'Filter',
    },
    'qrvkaa77': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '7uu9uavl': {
      'en': 'Search',
      'fa': 'جستجو',
      'nl': 'Zoekopdracht',
    },
    'q4ar00pn': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
      'nl': 'Optie 1',
    },
    '0dfm2rcn': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'kd5mjjjg': {
      'en': 'Search',
      'fa': 'جستجو',
      'nl': 'Zoekopdracht',
    },
    '8b3no9i7': {
      'en': 'Option 1',
      'fa': 'گزینه ۱',
      'nl': 'Optie 1',
    },
    'gak00fpr': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // HomePage
  {
    'md4unc80': {
      'en': 'Search',
      'fa': 'جستجو',
      'nl': 'Zoekopdracht',
    },
    'qv9q21jt': {
      'en': 'Search is required',
      'fa': 'جستجو الزامی است',
      'nl': 'Zoeken is vereist',
    },
    'vzxdrsnm': {
      'en':
          'Please use only letters (English/Persian), spaces, a dot or underscore.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، نقطه یا زیرخط استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, een punt of onderstrepingsteken.',
    },
    'invzk7d6': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'uecq8i6w': {
      'en': 'What are you looking for today?',
      'fa': 'امروز دنبال چی هستی؟',
      'nl': 'Wat zoekt u vandaag?',
    },
    'rj83omaj': {
      'en': 'VOLUNTARY SUPPORT',
      'fa': 'حمایت داوطلبانه',
      'nl': 'VRIJWILLIGE STEUN',
    },
    'c8a9ytss': {
      'en': 'COMMUNITY MARKET',
      'fa': 'بازار محلی',
      'nl': 'GEMEENSCHAPSMARKT',
    },
    'yvetgowh': {
      'en': 'SKILLS & EXPERTISE',
      'fa': 'مهارت‌ها و تخصص‌ها',
      'nl': 'VAARDIGHEDEN & EXPERTISE',
    },
    'abmw58ok': {
      'en': 'EVENTS & ANNOUNCMENTS',
      'fa': 'رویدادها و اطلاعیه‌ها',
      'nl': 'EVENEMENTEN & AANKONDIGINGEN',
    },
    'pmzri2ub': {
      'en': 'Careers & Networking',
      'fa': 'فرصت‌های شغلی و شبکه‌سازی',
      'nl': 'Carrière & Netwerken',
    },
    'j3hbpsji': {
      'en': 'This feature is \nlaunching soon!',
      'fa': 'این قابلیت به زودی راه‌اندازی می‌شود!',
      'nl': 'Deze functie\nwordt binnenkort gelanceerd!',
    },
    's2nj1c3x': {
      'en': 'Businesses',
      'fa': 'کسب و کارها',
      'nl': 'Bedrijven',
    },
    'usbpkb74': {
      'en': 'Trending Categories',
      'fa': 'دسته بندی های پرطرفدار',
      'nl': 'Trending Categorieën',
    },
    'qd2458pn': {
      'en': 'News',
      'fa': 'اخبار',
      'nl': 'Nieuws',
    },
    '4827h0f4': {
      'en': 'How It Works?',
      'fa': 'نحوه کار با اپ در ۴ مرحله آسان',
      'nl': 'Hoe werkt het?',
    },
    'fsf3mcvr': {
      'en': 'Choose where your post belongs',
      'fa': 'انتخاب کنید که پست شما به کجا تعلق دارد',
      'nl': 'Kies waar je bericht thuishoort',
    },
    'xvibk9g9': {
      'en': 'Add details and pics',
      'fa': 'جزئیات و تصاویر را اضافه کنید',
      'nl': 'Voeg details en foto\'s toe',
    },
    '6jcii098': {
      'en': 'Say what you want in return',
      'fa': 'در عوض هرچی دلت میخواد بگو',
      'nl': 'Zeg wat je terug wilt',
    },
    'o4t933ga': {
      'en': 'Your post is live!',
      'fa': 'پست شما زنده است!',
      'nl': 'Jouw bericht staat online!',
    },
    'pfhno2h7': {
      'en': '1. Share an item, skill, or service',
      'fa': '۱. یک کالا، مهارت یا خدمات را به اشتراک بگذارید',
      'nl': '1. Deel een item, vaardigheid of dienst',
    },
    'v9eb6c1w': {
      'en':
          'For example, request or offer a room for rent, bike to sell, an expert to hire, announce an event, and so on.',
      'fa':
          'برای مثال، درخواست یا پیشنهاد اجاره اتاق، فروش دوچرخه، استخدام متخصص، اعلام یک رویداد و غیره.',
      'nl':
          'U kunt bijvoorbeeld een kamer te huur aanbieden, een fiets te koop aanbieden, een expert inhuren, een evenement aankondigen, enzovoort.',
    },
    '6s56pbb1': {
      'en': '2. Receive offers & discuss',
      'fa': '۲. دریافت پیشنهادات و بحث در مورد آنها',
      'nl': '2. Ontvang aanbiedingen en bespreek ze',
    },
    '0n59oasi': {
      'en':
          'If you receive an offer, discuss the details, clarify expectations, timing, and conditions until you both agree.',
      'fa':
          'اگر پیشنهادی دریافت کردید، جزئیات را مورد بحث قرار دهید، انتظارات، زمان‌بندی و شرایط را روشن کنید تا هر دو به توافق برسید.',
      'nl':
          'Als u een aanbod krijgt, bespreek dan de details, maak duidelijke afspraken over uw verwachtingen, de timing en de voorwaarden totdat u beiden akkoord gaat.',
    },
    'h0ay052s': {
      'en': '3. Meet up in person & finalize ',
      'fa': '۳. حضوری ملاقات کنید و نهایی کنید',
      'nl': '3. Ontmoet elkaar persoonlijk en rond af',
    },
    'iiu0tp23': {
      'en':
          'It’s always nice to meet in person, complete the exchange, and end it with a smile.',
      'fa':
          'همیشه خوب است که حضوری ملاقات کنید، تبادل نظر را کامل کنید و با لبخند آن را به پایان برسانید.',
      'nl':
          'Het is altijd leuk om elkaar persoonlijk te ontmoeten, de uitwisseling af te ronden en met een glimlach af te sluiten.',
    },
    '2mbe77a2': {
      'en': '4. Leave a review ',
      'fa': '۴. نظر بدهید',
      'nl': '4. Laat een recensie achter',
    },
    'r365vlqj': {
      'en': 'Build trust and make it easier for others to find you both.',
      'fa':
          'اعتماد ایجاد کنید و پیدا کردن شما دو نفر را برای دیگران آسان‌تر کنید.',
      'nl':
          'Bouw vertrouwen op en zorg dat anderen jullie makkelijker kunnen vinden.',
    },
    'gpiujku4': {
      'en': 'What’s Around You?',
      'fa': 'اطراف شما چه خبر است؟',
      'nl': 'Wat is er om je heen?',
    },
    '353k0b4j': {
      'en': 'Start',
      'fa': 'شروع',
      'nl': '',
    },
    '6lyr5um7': {
      'en': 'the community',
      'fa': 'خانواده‌ی بزرگ ما',
      'nl': '',
    },
    'x61e1a64': {
      'en': 'Change Mode',
      'fa': 'تغییر حالت',
      'nl': 'Wijzig modus',
    },
    'enkkcdol': {
      'en': 'Check FAQ',
      'fa': 'سوالات متداول',
      'nl': 'Bekijk de FAQ',
    },
    'gwt0vsq7': {
      'en': 'Contact Us',
      'fa': 'تماس با ما',
      'nl': 'Contact met ons',
    },
    'ospzi8mf': {
      'en': 'Log out',
      'fa': 'خروج از سیستم',
      'nl': 'Uitloggen',
    },
    'qv3strvd': {
      'en': '',
      'fa': '',
      'nl': '',
    },
  },
  // MainPage
  {
    'q6o9bjar': {
      'en': 'Market',
      'fa': 'بازار محلی',
      'nl': 'Gemeenschapsmarkt',
    },
    'z03svtjd': {
      'en': 'Sort by',
      'fa': 'مرتب سازی',
      'nl': 'Sorteren op',
    },
    'etjsqje0': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'dvxs0iu7': {
      'en': 'Recent',
      'fa': 'اخیر',
      'nl': 'Recent',
    },
    'x8u4gjyb': {
      'en': 'Popular',
      'fa': 'محبوب',
      'nl': 'Populair',
    },
    '7w4oeybw': {
      'en': 'Voluntary Support',
      'fa': 'پشتیبانی داوطلبانه',
      'nl': 'Vrijwillige ondersteuning',
    },
    'czt2og66': {
      'en': 'Sort by',
      'fa': 'مرتب سازی',
      'nl': 'Sorteren op',
    },
    '2lmf4r3c': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'q09sh78q': {
      'en': 'Recent',
      'fa': 'اخیر',
      'nl': 'Recent',
    },
    'c6z26gh2': {
      'en': 'Popular',
      'fa': 'محبوب',
      'nl': 'Populair',
    },
    'lfm1ojnf': {
      'en': 'Become a Volunteer',
      'fa': 'داوطلب شوید',
      'nl': 'Word vrijwilliger',
    },
    '1y5mye93': {
      'en': 'Services & Jobs',
      'fa': 'خدمات',
      'nl': 'Diensten',
    },
    'hpek7i7b': {
      'en': 'Sort by',
      'fa': 'مرتب سازی',
      'nl': 'Sorteren op',
    },
    '1vqz4ewc': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'mf3wf9bs': {
      'en': 'Recent',
      'fa': 'اخیر',
      'nl': 'Recent',
    },
    '0vfuan47': {
      'en': 'Popular',
      'fa': 'محبوب',
      'nl': 'Populair',
    },
    'm0ad92yp': {
      'en': 'Advertise a Job',
      'fa': 'آگهی استخدام',
      'nl': 'Adverteer een vacature',
    },
    'ijphs52w': {
      'en': 'Events & Announcements',
      'fa': 'رویدادها و اطلاعیه‌ها',
      'nl': 'Evenementen en aankondigingen',
    },
    'borgvgtn': {
      'en': 'Sort by',
      'fa': 'مرتب سازی',
      'nl': 'Sorteren op',
    },
    'bfohq53i': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'dc06nkgi': {
      'en': 'Recent',
      'fa': 'اخیر',
      'nl': 'Recent',
    },
    'i3smswcl': {
      'en': 'Popular',
      'fa': 'محبوب',
      'nl': 'Populair',
    },
    'acanui6t': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // ProfilePage
  {
    'wi68hahy': {
      'en': 'Likes',
      'fa': 'لایک‌ها',
      'nl': 'Vind-ik-leuks',
    },
    'jzc0o03k': {
      'en': '3',
      'fa': '۳',
      'nl': '3',
    },
    'dcb0abt1': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'Beoordelingen',
    },
    '2808vfr9': {
      'en': 'Posts',
      'fa': 'پست‌ها',
      'nl': 'Berichten',
    },
    'xt0uhk7r': {
      'en': 'See All',
      'fa': 'همه را ببینید',
      'nl': 'Alles zien',
    },
    'oq2hc9vq': {
      'en': 'Favorites',
      'fa': 'موارد دلخواه',
      'nl': 'Favorieten',
    },
    'fd2re1c8': {
      'en': 'See All',
      'fa': 'همه را ببینید',
      'nl': 'Alles zien',
    },
    'h7butxb7': {
      'en': 'Reviews',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'Beoordelingen',
    },
    '9wndti6n': {
      'en': 'See All',
      'fa': 'همه را ببینید',
      'nl': 'Alles zien',
    },
    'yq4fqtye': {
      'en': '',
      'fa': 'خانه',
      'nl': '',
    },
  },
  // ProfileEdit
  {
    '1tg5n8be': {
      'en': 'Personal',
      'fa': 'شخصی',
      'nl': 'Persoonlijk',
    },
    'eun17pjp': {
      'en': 'Personal Information',
      'fa': 'اطلاعات شخصی',
      'nl': 'Persoonlijke gegevens',
    },
    '516rrlak': {
      'en': 'User name',
      'fa': 'نام کاربری',
      'nl': 'Gebruikersnaam',
    },
    '6gbj58h2': {
      'en': 'A unique name to  display on your profile.',
      'fa': 'یک نام منحصر به فرد برای نمایش در پروفایل شما.',
      'nl': 'Een unieke naam die op uw profiel wordt weergegeven.',
    },
    'k8yaifxp': {
      'en': 'This field is required.',
      'fa': '',
      'nl': '',
    },
    'zi1ckidc': {
      'en': 'Minimum 3 letters are required.',
      'fa': '',
      'nl': '',
    },
    'bjz0w81s': {
      'en': 'Please use only letters (English/Persian), spaces, or underscore.',
      'fa': '',
      'nl': '',
    },
    '5uv7jgtj': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'i82qrrua': {
      'en': 'First name',
      'fa': 'نام کوچک',
      'nl': 'Voornaam',
    },
    '24aggfes': {
      'en': 'First name',
      'fa': 'نام کوچک',
      'nl': 'Voornaam',
    },
    'k1cds13e': {
      'en': 'Please use only letters (English/Persian) and spaces.',
      'fa': '',
      'nl': '',
    },
    'cy0b9vxh': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'si9fuiqf': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'nl': 'Achternaam',
    },
    '4nnyiwnp': {
      'en': 'Last name',
      'fa': 'نام خانوادگی',
      'nl': 'Achternaam',
    },
    '6jovzf1s': {
      'en': 'Please use only letters (English/Persian) and spaces.',
      'fa': 'لطفا فقط از حروف (انگلیسی/فارسی) و فاصله استفاده کنید.',
      'nl': 'Gebruik alleen letters (Engels/Perzisch) en spaties.',
    },
    'kwfhrqmb': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'og8w26in': {
      'en': 'Biography',
      'fa': 'زندگینامه',
      'nl': 'Biografie',
    },
    '1vdcvtwy': {
      'en': 'Let everyone know about you.',
      'fa': 'بگذارید همه از شما خبر داشته باشند.',
      'nl': 'Vertel iedereen over jezelf.',
    },
    'sd7ryerl': {
      'en':
          'Please use only letters (English/Persian), spaces, underscore, exclamation mark, question mark or dot.',
      'fa': '',
      'nl': '',
    },
    'hizsz38c': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'z3xwndw3': {
      'en': 'Contact Information',
      'fa': 'اطلاعات تماس',
      'nl': 'Contactgegevens',
    },
    '2hyki5q1': {
      'en': 'Email',
      'fa': 'شهر',
      'nl': 'Stad',
    },
    'uzu5pe2d': {
      'en': 'City',
      'fa': 'شهر',
      'nl': 'Stad',
    },
    'zzq7g7vx': {
      'en': 'Change Email',
      'fa': '',
      'nl': '',
    },
    'nbv3szt9': {
      'en': 'Change password',
      'fa': 'تغییر رمز عبور',
      'nl': 'Wachtwoord wijzigen',
    },
    '2r3qk0eg': {
      'en': 'PhoneNumber',
      'fa': 'شماره تلفن',
      'nl': 'Telefoonnummer',
    },
    'b8jc2zrs': {
      'en': '0612345678',
      'fa': '۰۶۱۲۳۴۵۶۷۸',
      'nl': '0612345678',
    },
    'ysvww2jk': {
      'en': 'phonenumber is required',
      'fa': '',
      'nl': '',
    },
    's3m0a7lo': {
      'en': 'Use a valid phone number. e.g 0612345678',
      'fa': '',
      'nl': '',
    },
    'akjaxpph': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '25ca7h3c': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'b4y4scus': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    '8dbe5t8r': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'ftwlpb6q': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'vi9dn7b7': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    '8ysj0tlv': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'c9fzxw25': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    '2fq6obmq': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'padtwd63': {
      'en': 'City',
      'fa': '',
      'nl': '',
    },
    'cvyikj5w': {
      'en': 'Social Media Links',
      'fa': 'لینک‌های رسانه‌های اجتماعی',
      'nl': 'Links naar sociale media',
    },
    'qne00b69': {
      'en': 'Instagram link',
      'fa': 'لینک اینستاگرام',
      'nl': 'Instagram-link',
    },
    'flzqxlxk': {
      'en': 'Instagram link',
      'fa': 'لینک اینستاگرام',
      'nl': 'Instagram-link',
    },
    'iwnn0krk': {
      'en': 'This is not a valid link.',
      'fa': 'این لینک معتبر نیست.',
      'nl': 'Dit is geen geldige link.',
    },
    '2cp2pl0l': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'mb8qxwm3': {
      'en': 'Save',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
    'j2hj0yzw': {
      'en': 'To delete your account, ',
      'fa': 'برای حذف حساب کاربری خود،',
      'nl': 'Om uw account te verwijderen,',
    },
    'ayyq9da0': {
      'en': 'click here.',
      'fa': 'اینجا کلیک کنید.',
      'nl': 'Klik hier.',
    },
    'c1ajh2vc': {
      'en': 'Are you sure you want to delete your account?',
      'fa': 'آیا مطمئن هستید که می‌خواهید حساب کاربری خود را حذف کنید؟',
      'nl': 'Weet u zeker dat u uw account wilt verwijderen?',
    },
    'cpxsrki1': {
      'en':
          'By confirming you cannot revive your account anymore. Would you confirm this?',
      'fa':
          'با تأیید اینکه دیگر نمی‌توانید حساب خود را احیا کنید، آیا این را تأیید می‌کنید؟',
      'nl':
          'Door te bevestigen kunt u uw account niet meer activeren. Wilt u dit bevestigen?',
    },
    '6a2fziro': {
      'en': 'Privacy Setting',
      'fa': 'تنظیمات حریم خصوصی',
      'nl': 'Privacy-instellingen',
    },
    '9gnchgjf': {
      'en': 'Allow users to see my profile photo.',
      'fa': 'به کاربران اجازه دهید عکس پروفایل من را ببینند.',
      'nl': 'Gebruikers toestaan mijn profielfoto te zien.',
    },
    'nnxca66f': {
      'en': 'Allow users to see my social media link.',
      'fa': 'به کاربران اجازه دهید لینک شبکه‌های اجتماعی من را ببینند.',
      'nl': 'Zorg dat gebruikers mijn link naar sociale media kunnen zien.',
    },
    '1g8re0aj': {
      'en': 'Allow users to see my favorites.',
      'fa': 'به کاربران اجازه دهید موارد دلخواه من را ببینند.',
      'nl': 'Gebruikers mijn favorieten laten zien.',
    },
    'qa16wop5': {
      'en': 'Allow users to call me.',
      'fa': 'به کاربران اجازه دهید با من تماس بگیرند.',
      'nl': 'Sta gebruikers toe mij te bellen.',
    },
    'i62uuxwh': {
      'en': 'Allow users to message me.',
      'fa': 'به کاربران اجازه دهید به من پیام بدهند.',
      'nl': 'Gebruikers toestaan mij een bericht te sturen.',
    },
    '34uhaw3r': {
      'en': 'Allow users to share my posts.',
      'fa': 'به کاربران اجازه دهید پست‌های من را به اشتراک بگذارند.',
      'nl': 'Gebruikers toestaan mijn berichten te delen.',
    },
    'yz5gspss': {
      'en': 'Agreed to the terms and privicy policy.',
      'fa': 'با شرایط و سیاست حفظ حریم خصوصی موافقت شد.',
      'nl': 'Ik ga akkoord met de voorwaarden en het privacybeleid.',
    },
    'niqgbb33': {
      'en': 'Save ',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
    '9w8zjkix': {
      'en': 'Terms & Conditions',
      'fa': 'شرایط و ضوابط',
      'nl': 'Algemene voorwaarden',
    },
    '0eqbpyfb': {
      'en': 'Last update:',
      'fa': 'آخرین به‌روزرسانی:',
      'nl': 'Laatste update:',
    },
    '86b9dl0z': {
      'en': ' 27/12/2023',
      'fa': '۲۷/۱۲/۲۰۲۳',
      'nl': '27/12/2023',
    },
    '5rxx4eqd': {
      'en':
          'Please read these terms of service, carefully before using our app operated by us.',
      'fa':
          'لطفاً قبل از استفاده از برنامه‌ای که توسط ما اداره می‌شود، این شرایط خدمات را با دقت مطالعه کنید.',
      'nl':
          'Lees deze servicevoorwaarden zorgvuldig door voordat u de door ons beheerde app gebruikt.',
    },
    'z6oq407a': {
      'en': 'Conditions of Uses',
      'fa': 'شرایط استفاده',
      'nl': 'Gebruiksvoorwaarden',
    },
    '4hmiyku9': {
      'en':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      'fa':
          'این یک واقعیت دیرینه است که خواننده هنگام نگاه کردن به طرح‌بندی یک صفحه، حواسش به محتوای خوانای آن پرت می‌شود. نکته استفاده از لورم ایپسوم این است که برخلاف استفاده از «محتوا اینجا، محتوا اینجا» توزیع حروف کم و بیش نرمالی دارد و باعث می‌شود مانند انگلیسی خوانا به نظر برسد.\n\nبسیاری از بسته‌های نشر رومیزی و ویرایشگرهای صفحات وب اکنون از لورم ایپسوم به عنوان متن مدل پیش‌فرض خود استفاده می‌کنند و جستجوی «لورم ایپسوم» بسیاری از وب‌سایت‌ها را که هنوز در مراحل ابتدایی خود هستند، آشکار می‌کند. نسخه‌های مختلفی در طول سال‌ها تکامل یافته‌اند، گاهی به طور تصادفی، گاهی به طور هدفمند (تزریق طنز و موارد مشابه).',
      'nl':
          'Het is een vaststaand feit dat een lezer wordt afgeleid door de leesbare inhoud van een pagina wanneer hij naar de lay-out kijkt. Het punt van het gebruik van Lorem Ipsum is dat het een min of meer normale letterverdeling heeft, in tegenstelling tot \'Inhoud hier, inhoud hier\', waardoor het op leesbaar Engels lijkt.\n\nVeel desktop publishing-pakketten en webpagina-editors gebruiken Lorem Ipsum nu als hun standaardmodeltekst, en een zoekopdracht naar \'lorem ipsum\' levert veel websites op die nog in de kinderschoenen staan. Verschillende versies zijn in de loop der jaren ontwikkeld, soms per ongeluk, soms expres (ingevoegde humor en dergelijke).',
    },
    'bugt9s1t': {
      'en': 'Types of data we collect',
      'fa': 'انواع داده‌هایی که جمع‌آوری می‌کنیم',
      'nl': 'Soorten gegevens die we verzamelen',
    },
    '7nzis5rd': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, matis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
      'nl':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Als u weet dat er een fringilla-accumsan is, is de vraag sem-sollicitudin lacus, ut interdum',
    },
    'fiujz5ly': {
      'en': 'Use of your personal data',
      'fa': 'استفاده از داده‌های شخصی شما',
      'nl': 'Gebruik van uw persoonsgegevens',
    },
    '874gf5jc': {
      'en':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum ',
      'fa':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, matis tellus. Sed dignissim، metus nec fringilla accumsan، risus sem sollicitudin lacus، ut interdum',
      'nl':
          'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Als u weet dat er een fringilla-accumsan is, is de vraag sem-sollicitudin lacus, ut interdum',
    },
    'stvk2rzm': {
      'en': 'Disclosure of your data',
      'fa': 'افشای داده‌های شما',
      'nl': 'Openbaarmaking van uw gegevens',
    },
    'gbbs7qhx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. ',
      'fa':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. تعلیق پرتیوم ویورا. Volutpat commodo sed egestas egestas fringillaphallus faucibus.',
      'nl':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut arbeid en dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus.',
    },
    '0ojqhq3i': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // DetailTransfer
  {
    '53yok1ze': {
      'en': 'Details',
      'fa': 'جزئیات',
      'nl': 'Details',
    },
    'efbqdxyq': {
      'en': '5',
      'fa': '۵',
      'nl': '5',
    },
    '4jcajawf': {
      'en': ' of ',
      'fa': ' از ',
      'nl': 'van',
    },
    'oocgfb2z': {
      'en': '6',
      'fa': '۶',
      'nl': '6',
    },
    '0kfmmt26': {
      'en': 'Details about your ',
      'fa': 'جزئیات مربوط به شما',
      'nl': 'Gegevens over uw',
    },
    'pjdod6a2': {
      'en': 'parcel transfer',
      'fa': 'انتقال بسته',
      'nl': 'pakketoverdracht',
    },
    'c5xl91u5': {
      'en': 'Helps others understand your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را درک کنند',
      'nl': 'Helpt anderen uw bericht te begrijpen',
    },
    'i9ek1mtu': {
      'en': 'Title',
      'fa': '',
      'nl': '',
    },
    '207su7nz': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    'ni0h27xl': {
      'en': 'Title',
      'fa': 'عنوان',
      'nl': 'Titel',
    },
    'o0yl8qgk': {
      'en': 'Description',
      'fa': '',
      'nl': '',
    },
    'bmqhw33p': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '9rn6699b': {
      'en': 'Description',
      'fa': 'توضیحات',
      'nl': 'Beschrijving',
    },
    '2klvlkbj': {
      'en': 'Location',
      'fa': '',
      'nl': '',
    },
    'eumdruhu': {
      'en': ' (Required)',
      'fa': '',
      'nl': '',
    },
    '0j0hu9om': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'w5u7muyo': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'pmi755th': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'mqdaf0xz': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    '90r5hlqz': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'ifd81ymq': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    '32rk6k7f': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    'ufjxpus7': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    'mjc2jgee': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'mx2qcch2': {
      'en': 'Route',
      'fa': 'مسیر',
      'nl': 'Route',
    },
    '4p3efajh': {
      'en': 'Origin Country',
      'fa': 'کشور مبدا',
      'nl': 'Land van herkomst',
    },
    'pgiv1iil': {
      'en': 'Iran',
      'fa': 'ایران',
      'nl': 'Iran',
    },
    'mf3ukxqk': {
      'en': 'Destination Country',
      'fa': 'کشور مقصد',
      'nl': 'Bestemmingsland',
    },
    '81ao91nl': {
      'en': 'Netherlands',
      'fa': 'هلند',
      'nl': 'Nederland',
    },
    '8czmix02': {
      'en': 'Origin City',
      'fa': 'شهر مبدا',
      'nl': 'Oorsprongsstad',
    },
    'rxrwrfwc': {
      'en': 'Tehran',
      'fa': 'تهران',
      'nl': 'Teheran',
    },
    '2ruq6n9f': {
      'en': 'Destination City',
      'fa': 'شهر مقصد',
      'nl': 'Bestemmingsstad',
    },
    'ydmwvk8k': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
      'nl': 'Amsterdam',
    },
    '4cm20vg2': {
      'en': 'Time',
      'fa': 'زمان',
      'nl': 'Tijd',
    },
    'k1tfu3tn': {
      'en': 'Travel date',
      'fa': 'تاریخ سفر',
      'nl': 'Reisdatum',
    },
    '8c7d25g2': {
      'en': 'Transfer deadline',
      'fa': 'آخرین مهلت ارسال',
      'nl': 'Overdracht deadline',
    },
    '5mk22mkm': {
      'en': 'Compensation',
      'fa': 'پاداش (اختیاری)',
      'nl': 'Compensatie',
    },
    'x07hv8wo': {
      'en': 'By Agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'hmgcb730': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ovlmtq3q': {
      'en': 'Please only use number.',
      'fa': '',
      'nl': '',
    },
    '7kwmj8h3': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'b36d4k0t': {
      'en': 'Negotiable:',
      'fa': 'قابل مذاکره:',
      'nl': 'Bespreekbaar:',
    },
    'q24c609n': {
      'en': 'Compensation',
      'fa': 'جبران محبت (اختیاری)',
      'nl': 'Compensatie',
    },
    'ynw1y4y4': {
      'en': 'By Agreement',
      'fa': ' توافقی',
      'nl': 'In overleg',
    },
    'xrz3o842': {
      'en': 'Under €20',
      'fa': 'زیر ۲۰ یورو',
      'nl': 'Onder €20',
    },
    '0wbq8c4f': {
      'en': '€20-€50',
      'fa': '۲۰ تا ۵۰ یورو',
      'nl': '€20-€50',
    },
    '8olxxpsa': {
      'en': '€50-€100',
      'fa': '۲۰ تا ۵۰ یورو',
      'nl': '€20-€50',
    },
    'rywl48mp': {
      'en': 'Above €100',
      'fa': 'بالای ۱۰۰ یورو',
      'nl': 'Boven €100',
    },
    '8r9pflc4': {
      'en': 'Parcel Specification',
      'fa': 'مشخصات بسته',
      'nl': 'Pakketspecificatie',
    },
    'zvct8vkt': {
      'en': 'Is document?',
      'fa': 'سند است؟',
      'nl': 'Is het document?',
    },
    'en3o4uoi': {
      'en': 'Is fragile?',
      'fa': 'شکستنی است؟',
      'nl': 'Is kwetsbaar?',
    },
    '2awv7gk8': {
      'en': 'Dimensions:',
      'fa': 'ابعاد:',
      'nl': 'Afmetingen:',
    },
    'flfcnj2p': {
      'en': 'Small (Fits Shoe Box)',
      'fa': 'کوچک (اندازه جعبه کفش)',
      'nl': 'Klein (past in schoenendoos)',
    },
    'wp0atsfe': {
      'en': 'Medium (Carry-on size)',
      'fa': 'متوسط (کابین سایز)',
      'nl': 'Medium (handbagage)',
    },
    'coqh7coj': {
      'en': 'Large (Check-in Luggage)',
      'fa': 'بزرگ (چمدان تحویلی)',
      'nl': 'Groot (incheckbagage)',
    },
    '3sz5rb3m': {
      'en': 'Weight:',
      'fa': 'وزن:',
      'nl': 'Gewicht:',
    },
    '875r75iq': {
      'en': 'Below 1 kg',
      'fa': 'زیر ۱ کیلو',
      'nl': 'Onder 1 kg',
    },
    '0ykdye2d': {
      'en': '1 to 3 kg',
      'fa': '۱ تا ۳ کیلو',
      'nl': '1 tot 3 kg',
    },
    '7kln8f15': {
      'en': '3 to 5 kg',
      'fa': '۳ تا ۵ کیلو',
      'nl': '3 tot 5 kg',
    },
    'f9eknq20': {
      'en': 'Above 10 kg',
      'fa': '۵ تا ۱۰ کیلو',
      'nl': '5 tot 10 kg',
    },
    'wquddr4w': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
    '9cw83pge': {
      'en': 'Some fields are left unfilled. Please try again.',
      'fa': 'بعضی از فیلدها پر نشده‌اند. لطفاً دوباره امتحان کنید.',
      'nl': 'Sommige velden zijn niet ingevuld. Probeer het opnieuw.',
    },
    'xn16hwg8': {
      'en': 'Post',
      'fa': 'پست',
      'nl': 'Na',
    },
  },
  // SignUpPage
  {
    'mfq18rlk': {
      'en': 'Create an account',
      'fa': 'ایجاد حساب کاربری',
      'nl': 'Een account aanmaken',
    },
    'r6x4yqnw': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'nl': 'Laten we beginnen door onderstaand formulier in te vullen.',
    },
    'totm38xv': {
      'en': 'Username',
      'fa': 'نام کاربری',
      'nl': 'Gebruikersnaam',
    },
    'g57bhyec': {
      'en': 'This field is required.',
      'fa': '',
      'nl': '',
    },
    'gyyzglsg': {
      'en': 'Minimum 3 characters are required.',
      'fa': '',
      'nl': '',
    },
    'mj06dfc0': {
      'en': 'Max characters reached.',
      'fa': '',
      'nl': '',
    },
    'o7uj5dgy': {
      'en':
          'Please use only letters (English/Persian), spaces, a dot or underscore.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، نقطه یا زیرخط استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, een punt of onderstrepingsteken.',
    },
    't1piq1l0': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'f1mymf8w': {
      'en': 'Email',
      'fa': 'ایمیل',
      'nl': 'E-mail',
    },
    'v31k1qg9': {
      'en': 'This field is required.',
      'fa': '',
      'nl': '',
    },
    'fhkvtejh': {
      'en': 'Please enter a valid email address.',
      'fa': '',
      'nl': '',
    },
    '88c6yeh5': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'zetaeoul': {
      'en': 'Password',
      'fa': 'رمز عبور',
      'nl': 'Wachtwoord',
    },
    '2pobt1h6': {
      'en': 'This field is required.',
      'fa': '',
      'nl': '',
    },
    'ixw153fz': {
      'en': 'Minimum 6 characters are required.',
      'fa': '',
      'nl': '',
    },
    '0ootosfw': {
      'en':
          '- At least one uppercase letter\n- At least one digit\n- At least 8 characters ',
      'fa': '',
      'nl': '',
    },
    'pkcgnk3b': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    '53qxhdtu': {
      'en': 'Confirm Password',
      'fa': 'تأیید رمز عبور',
      'nl': 'Bevestig wachtwoord',
    },
    'w8drzugt': {
      'en': 'Passwords do not match.',
      'fa': '',
      'nl': '',
    },
    'm1b3xvwl': {
      'en': 'I agree to the ',
      'fa': '',
      'nl': '',
    },
    'bdmdjui9': {
      'en': 'Terms and Privacy Policy',
      'fa': '',
      'nl': '',
    },
    '00jrevyh': {
      'en': 'Create Account',
      'fa': 'ایجاد حساب کاربری',
      'nl': 'Account aanmaken',
    },
    '7dtf9w99': {
      'en': 'OR',
      'fa': 'یا',
      'nl': 'OF',
    },
    'wico1una': {
      'en': 'Already have an account? ',
      'fa': 'قبلاً حساب کاربری دارید؟',
      'nl': 'Heeft u al een account?',
    },
    '2vbhldic': {
      'en': ' Sign In here',
      'fa': 'اینجا وارد شوید',
      'nl': 'Meld u hier aan',
    },
    '8a810abu': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // XXX_Busines
  {
    'zajqiw4o': {
      'en': 'FEATURE COMING SOON!',
      'fa': 'ویژگی به زودی!',
      'nl': 'Binnenkort verkrijgbaar!',
    },
    'xwctvd4f': {
      'en': 'Careers Hub',
      'fa': 'مرکز فرصت‌های شغلی',
      'nl': 'Carrièrecentrum',
    },
    'xhbs5o7r': {
      'en':
          'Explore diverse possibilities and connect with professionals and partners',
      'fa':
          'امکانات متنوع را بررسی کنید و با متخصصان و شرکا ارتباط برقرار کنید',
      'nl':
          'Ontdek diverse mogelijkheden en maak contact met professionals en partners',
    },
    'p2hugerr': {
      'en': 'WANT EARLY ACCESS?',
      'fa': 'دسترسی زودهنگام می‌خواهید؟',
      'nl': 'WILT U EERDER TOEGANG?',
    },
    'uaoh24at': {
      'en': 'Contact us to be among the first to explore:',
      'fa': 'برای اینکه جزو اولین نفرات باشید با ما تماس بگیرید:',
      'nl': 'Neem contact met ons op en ontdek als eerste het volgende:',
    },
    'dtqj9rbn': {
      'en': 'Advertise a job',
      'fa': 'آگهی استخدام',
      'nl': 'Een vacature adverteren',
    },
    'jcbv7cty': {
      'en': 'Request a job',
      'fa': 'درخواست شغل',
      'nl': 'Vraag een baan aan',
    },
    '1bdxjne1': {
      'en': 'Join or organize networking events',
      'fa': 'به رویدادهای شبکه‌سازی بپیوندید یا آنها را سازماندهی کنید',
      'nl': 'Neem deel aan of organiseer netwerkevenementen',
    },
    'a5yn183j': {
      'en': 'Start-up partnership and investment',
      'fa': 'مشارکت و سرمایه‌گذاری در استارت‌آپ',
      'nl': 'Start-up partnerschap en investering',
    },
    'np84zavh': {
      'en': 'Set up recruiters profiles',
      'fa': 'پروفایل‌های استخدام‌کنندگان را تنظیم کنید',
      'nl': 'Wervingsprofielen instellen',
    },
    'anv7agkz': {
      'en': 'JOIN THE WAITLLIST',
      'fa': 'به لیست منتظران بپیوندید',
      'nl': 'WORD LID VAN DE WACHTLIJST',
    },
    'r609wb85': {
      'en': 'Learn more about this feature',
      'fa': 'درباره این قابلیت بیشتر بدانید',
      'nl': 'Meer informatie over deze functie',
    },
    '50pq25q4': {
      'en': 'FEATURE COMING SOON!',
      'fa': 'ویژگی به زودی!',
      'nl': 'Binnenkort verkrijgbaar!',
    },
    'rtaxwxdf': {
      'en': 'Business Profiles',
      'fa': 'پروفایل‌های تجاری',
      'nl': 'Bedrijfsprofielen',
    },
    'hfs4im97': {
      'en':
          'We\'re working hard to bring you enhanced business profiles that will elevate your presence to connect with more customers.',
      'fa':
          'ما سخت تلاش می‌کنیم تا پروفایل‌های تجاری بهبود یافته‌ای را برای شما ارائه دهیم که حضور شما را برای ارتباط با مشتریان بیشتر ارتقا می‌دهد.',
      'nl':
          'We werken er hard aan om u verbeterde bedrijfsprofielen te bieden waarmee u uw aanwezigheid vergroot en meer klanten bereikt.',
    },
    'hto4gqs9': {
      'en': 'WANT TO BE AMONG THE FIRST?',
      'fa': 'می‌خواهید جزو اولین‌ها باشید؟',
      'nl': 'WIL JE BIJ DE EERSTE ZIJN?',
    },
    'tqoqdx82': {
      'en': 'Contact us to set up your profile',
      'fa': 'برای تنظیم پروفایل خود با ما تماس بگیرید',
      'nl': 'Neem contact met ons op om uw profiel in te stellen',
    },
    'vfcsauy8': {
      'en': 'CONTACT SUPPORT',
      'fa': 'تماس با پشتیبانی',
      'nl': 'CONTACT OPNEMEN MET ONDERSTEUNING',
    },
    'ufz7fqv9': {
      'en': 'See an example business profile',
      'fa': 'یک نمونه پروفایل تجاری را ببینید',
      'nl': 'Bekijk een voorbeeld van een bedrijfsprofiel',
    },
    'so9y3otl': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // News
  {
    'w7p064zc': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostPreview
  {
    'xd1m7vtn': {
      'en': 'PARTICIPANTS',
      'fa': 'شرکت‌کنندگان',
      'nl': 'DEELNEMERS',
    },
    'kq1qli0i': {
      'en': 'People who are going to this event.',
      'fa': 'افرادی که قرار است در این مراسم شرکت کنند.',
      'nl': 'Mensen die naar dit evenement gaan.',
    },
    'uaqcxwb9': {
      'en': 'Join Event',
      'fa': 'شرکت در رویداد',
      'nl': 'Deelnemen',
    },
    'x38gfydx': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'RECENSIES',
    },
    '5xowzjvx': {
      'en': 'Fresh start',
      'fa': 'شروع تازه',
      'nl': 'Nieuwe start',
    },
    'y0z6k9dl': {
      'en': 'Publish',
      'fa': 'منتشر کردن',
      'nl': 'Publiceren',
    },
    'mv96nsrq': {
      'en': 'Ready to Publish Your Post?',
      'fa': 'آماده انتشار پست خود هستید؟',
      'nl': 'Klaar om uw bericht te publiceren?',
    },
    'zou0thk2': {
      'en':
          'Note: Yekja never gets involved in your transactions. It is recommended to verify the identity of counterparty through mutual friends, business or student email, mobile phone, or LinkedIn page.',
      'fa':
          'توجه: یکجا هرگز در تراکنش‌های شما دخالت نمی‌کند. توصیه می‌شود هویت طرف مقابل را از طریق دوستان مشترک، ایمیل کاری یا دانشجویی، تلفن همراه یا صفحه لینکدین تأیید کنید.',
      'nl':
          'Let op: Yekja bemoeit zich nooit met uw transacties. Het is raadzaam de identiteit van de wederpartij te verifiëren via gemeenschappelijke vrienden, het e-mailadres van een bedrijf of student, een mobiel telefoonnummer of een LinkedIn-pagina.',
    },
    'eqlfruyj': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'wq33332n': {
      'en':
          'Post Limit Reached! You currently have 5 active posts. Please **delete an existing post** or **upgrade your subscription** to publish more.',
      'fa':
          'محدودیت ارسال پست به پایان رسید! شما در حال حاضر ۵ پست فعال دارید. لطفاً **یک پست موجود را حذف کنید** یا **اشتراک خود را ارتقا دهید** تا پست‌های بیشتری منتشر کنید.',
      'nl':
          'Berichtenlimiet bereikt! Je hebt momenteel 5 actieve berichten. **Verwijder een bestaand bericht** of **upgrade je abonnement** om er meer te plaatsen.',
    },
    'jm9epl0b': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    'g0htcucn': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostEn
  {
    'h7kcos98': {
      'en': 'PARTICIPANTS',
      'fa': 'شرکت‌کنندگان',
      'nl': 'DEELNEMERS',
    },
    'y2u4u1pq': {
      'en': 'People who are going to this event.',
      'fa': 'افرادی که قرار است در این مراسم شرکت کنند.',
      'nl': 'Mensen die naar dit evenement gaan.',
    },
    '7736op9e': {
      'en': 'Join Event',
      'fa': 'شرکت در رویداد',
      'nl': 'Deelnemen',
    },
    'svl0vrf6': {
      'en': 'Participating this event? ',
      'fa': 'شرکت در این رویداد؟',
      'nl': 'Neemt u deel aan dit evenement?',
    },
    'fhfeek0q': {
      'en': 'Please confirm if you\'d like to join this event!',
      'fa': 'لطفاً تأیید کنید که آیا مایل به شرکت در این رویداد هستید یا خیر!',
      'nl': 'Bevestig of je aan dit evenement wilt deelnemen!',
    },
    'mhimjjt0': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'zcd95z5z': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    '43kvoi9x': {
      'en': 'Leave Event',
      'fa': 'ترک رویداد',
      'nl': 'Verlaat evenement',
    },
    'gup7wrvf': {
      'en': 'Have you changed your mind?',
      'fa': 'نظرت عوض شده؟',
      'nl': 'Ben je van gedachten veranderd?',
    },
    'ogr98rn3': {
      'en':
          'You are currently a participant in this event. Please confirm if your plans changed. ',
      'fa':
          'شما در حال حاضر در این رویداد شرکت می‌کنید. لطفاً در صورت تغییر برنامه‌هایتان، تأیید کنید.',
      'nl':
          'U bent momenteel deelnemer aan dit evenement. Controleer of uw plannen zijn gewijzigd.',
    },
    '2hb08i9g': {
      'en': 'Cencel',
      'fa': 'سنسل',
      'nl': 'Cencel',
    },
    'xph0ye1c': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    '6y032xo5': {
      'en': 'Hide your profile image',
      'fa': 'تصویر پروفایل خود را مخفی کنید',
      'nl': 'Verberg je profielafbeelding',
    },
    'al4zq5em': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'RECENSIES',
    },
    'k7ur9txh': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostFa
  {
    '3soiowwq': {
      'en': 'PARTICIPANTS',
      'fa': 'شرکت‌کنندگان',
      'nl': 'DEELNEMERS',
    },
    '5tnx80uw': {
      'en': 'People who are going to this event.',
      'fa': 'افرادی که قرار است در این مراسم شرکت کنند.',
      'nl': 'Mensen die naar dit evenement gaan.',
    },
    'owhx5jkc': {
      'en': 'Join Event',
      'fa': 'شرکت در رویداد',
      'nl': 'Deelnemen',
    },
    'xx8qp86l': {
      'en': 'Participating this event? ',
      'fa': 'شرکت در این رویداد؟',
      'nl': 'Neemt u deel aan dit evenement?',
    },
    '4grhweks': {
      'en': 'Please confirm if you\'d like to join this event!',
      'fa': 'لطفاً تأیید کنید که آیا مایل به شرکت در این رویداد هستید یا خیر!',
      'nl': 'Bevestig of je aan dit evenement wilt deelnemen!',
    },
    '4hnoq098': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'k43nhob0': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    'dpuynhm9': {
      'en': 'Leave Event',
      'fa': 'ترک رویداد',
      'nl': 'Verlaat evenement',
    },
    'rjvk5gez': {
      'en': 'Have you changed your mind?',
      'fa': 'نظرت عوض شده؟',
      'nl': 'Ben je van gedachten veranderd?',
    },
    'g9aw80nt': {
      'en':
          'You are currently a participant in this event. Please confirm if your plans changed. ',
      'fa':
          'شما در حال حاضر در این رویداد شرکت می‌کنید. لطفاً در صورت تغییر برنامه‌هایتان، تأیید کنید.',
      'nl':
          'U bent momenteel deelnemer aan dit evenement. Controleer of uw plannen zijn gewijzigd.',
    },
    'cxemha4q': {
      'en': 'Cencel',
      'fa': 'سنسل',
      'nl': 'Cencel',
    },
    '7fo5fbpg': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    'c79y73jq': {
      'en': 'Hide your profile image',
      'fa': 'تصویر پروفایل خود را مخفی کنید',
      'nl': 'Verberg je profielafbeelding',
    },
    '0p7g3nq1': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'RECENSIES',
    },
    't0fw7rag': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // PostNL
  {
    'r65katy0': {
      'en': 'PARTICIPANTS',
      'fa': 'شرکت‌کنندگان',
      'nl': 'DEELNEMERS',
    },
    'pa21u83g': {
      'en': 'People who are going to this event.',
      'fa': 'افرادی که قرار است در این مراسم شرکت کنند.',
      'nl': 'Mensen die naar dit evenement gaan.',
    },
    'zjrf4zde': {
      'en': 'Join Event',
      'fa': 'شرکت در رویداد',
      'nl': 'Deelnemen',
    },
    'f9icfbpg': {
      'en': 'Participating this event? ',
      'fa': 'شرکت در این رویداد؟',
      'nl': 'Neemt u deel aan dit evenement?',
    },
    '1eox3zaq': {
      'en': 'Please confirm if you\'d like to join this event!',
      'fa': 'لطفاً تأیید کنید که آیا مایل به شرکت در این رویداد هستید یا خیر!',
      'nl': 'Bevestig of je aan dit evenement wilt deelnemen!',
    },
    's4l1854j': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'ebwexf78': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    '633uwuwk': {
      'en': 'Leave Event',
      'fa': 'ترک رویداد',
      'nl': 'Verlaat evenement',
    },
    '2xg817w9': {
      'en': 'Have you changed your mind?',
      'fa': 'نظرت عوض شده؟',
      'nl': 'Ben je van gedachten veranderd?',
    },
    'ccf05fs5': {
      'en':
          'You are currently a participant in this event. Please confirm if your plans changed. ',
      'fa':
          'شما در حال حاضر در این رویداد شرکت می‌کنید. لطفاً در صورت تغییر برنامه‌هایتان، تأیید کنید.',
      'nl':
          'U bent momenteel deelnemer aan dit evenement. Controleer of uw plannen zijn gewijzigd.',
    },
    '87mbi1yj': {
      'en': 'Cencel',
      'fa': 'سنسل',
      'nl': 'Cencel',
    },
    'cnfstlwt': {
      'en': 'Confirm',
      'fa': 'تأیید',
      'nl': 'Bevestigen',
    },
    '8quh1kln': {
      'en': 'Hide your profile image',
      'fa': 'تصویر پروفایل خود را مخفی کنید',
      'nl': 'Verberg je profielafbeelding',
    },
    '2trxbrdv': {
      'en': 'REVIEWS',
      'fa': 'نقد و بررسی‌ها',
      'nl': 'RECENSIES',
    },
    '7ksglak5': {
      'en': 'Home',
      'fa': 'خانه',
      'nl': 'Thuis',
    },
  },
  // BottonStandard
  {
    'bmqd8rae': {
      'en': 'Next',
      'fa': 'بعدی',
      'nl': 'Volgende',
    },
  },
  // profileCardComp
  {
    '600ony37': {
      'en': 'Trusted by 88 users',
      'fa': 'مورد اعتماد ۸۸ کاربر',
      'nl': 'Vertrouwd door 88 gebruikers',
    },
  },
  // Chat_delete_Archive
  {
    'd723qvl3': {
      'en': 'Archive Chat',
      'fa': 'بایگانی گفتگو',
      'nl': 'Archief Chat',
    },
    'l9et7p23': {
      'en': 'Delete Chat',
      'fa': 'حذف چت',
      'nl': 'Chat verwijderen',
    },
    'sa505oyx': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
  },
  // FeedBack
  {
    'p3u8bq3i': {
      'en': 'Your feedback submitted',
      'fa': 'بازخورد شما ارسال شد',
      'nl': 'Uw feedback is verzonden',
    },
    'h5p2gsrr': {
      'en': 'Your review has been submitted \nsuccessfully.',
      'fa': 'نقد شما با موفقیت ارسال شد.',
      'nl': 'Uw beoordeling is succesvol verzonden.',
    },
    '2w8dd6cq': {
      'en': 'Ok',
      'fa': 'باشه',
      'nl': 'OK',
    },
  },
  // Title
  {
    '6ic7t8mm': {
      'en': 'Give your post short a title',
      'fa': 'برای پست کوتاه خود عنوان انتخاب کنید',
      'nl': 'Geef je bericht een korte titel',
    },
    'y2fp32ac': {
      'en': 'E.g. Second-hand carpet from Tabriz',
      'fa': 'مثلاً فرش دست دوم تبریز',
      'nl': 'Bijvoorbeeld tweedehands tapijt uit Tabriz',
    },
    '209gk34d': {
      'en': 'Title is required',
      'fa': 'عنوان الزامی است',
      'nl': 'Titel is vereist',
    },
    'vjdguyso': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، زیرخط یا نقطه استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, onderstrepingstekens en punten.',
    },
    '5el7c4ac': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'the65glr': {
      'en': 'Save',
      'fa': '',
      'nl': '',
    },
  },
  // Description
  {
    'y55bc5uf': {
      'en': 'Give your post a clear description',
      'fa': 'برای پست خود توضیح واضحی بنویسید',
      'nl': 'Geef je bericht een duidelijke beschrijving',
    },
    '0luhlo2r': {
      'en': 'Write here...',
      'fa': 'اینجا بنویس...',
      'nl': 'Schrijf hier...',
    },
    '36tl1mm1': {
      'en': 'Please use only letters, numbers, underscore or dot.',
      'fa':
          'لطفاً فقط از حروف (انگلیسی/فارسی)، فاصله، زیرخط یا نقطه استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, onderstrepingstekens en punten.',
    },
    'pn656ddb': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'zd83miev': {
      'en': 'Save',
      'fa': '',
      'nl': '',
    },
  },
  // Delivery
  {
    'hfiypjxf': {
      'en': 'Set your delivery options',
      'fa': 'گزینه‌های تحویل خود را تنظیم کنید',
      'nl': 'Stel uw bezorgopties in',
    },
    'nh0pws5w': {
      'en': 'Does delivery apply?',
      'fa': 'آیا تحویل اعمال می‌شود؟',
      'nl': 'Is er sprake van bezorging?',
    },
    'fqknrw4a': {
      'en': 'What is your preferred delivery option?',
      'fa': 'گزینه تحویل مورد نظر شما چیست؟',
      'nl': 'Wat is uw favoriete bezorgoptie?',
    },
    'wzk88een': {
      'en': 'Free Delivery',
      'fa': 'تحویل رایگان',
      'nl': 'Gratis bezorging',
    },
    'qwds3g6m': {
      'en': 'Send by PostNL',
      'fa': 'ارسال از طریق PostNL',
      'nl': 'Versturen via PostNL',
    },
    'blxf3obc': {
      'en': 'Pick-up only',
      'fa': 'فقط تحویل حضوری',
      'nl': 'Alleen afhalen',
    },
    'csy436p7': {
      'en': 'By agreement',
      'fa': 'طبق توافق',
      'nl': 'In overleg',
    },
    'u30ejxny': {
      'en': 'Save',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
  },
  // Reporting_popup
  {
    'kg3w5j6w': {
      'en': 'You are about to report ',
      'fa': 'شما در شرف گزارش دادن هستید',
      'nl': 'U staat op het punt om te rapporteren',
    },
    '2pjit2x3': {
      'en': '. Please provide your reason below.',
      'fa': 'لطفا دلیل خود را در زیر ارائه دهید.',
      'nl': 'Geef hieronder uw reden op.',
    },
    '68d6jx0a': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '8r0yy5sr': {
      'en': 'Reason',
      'fa': 'دلیل',
      'nl': 'Reden',
    },
    '2iknl0nt': {
      'en': 'I would like to report this post/profile because..',
      'fa': 'من می‌خواهم این پست/پروفایل را گزارش کنم زیرا..',
      'nl': 'Ik wil dit bericht/profiel rapporteren omdat...',
    },
    'fq4r8mbk': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    '4f0rzqyy': {
      'en': 'Report',
      'fa': 'گزارش',
      'nl': 'Rapport',
    },
  },
  // Profile_setting
  {
    'uc7ythtx': {
      'en': 'Edit Profile',
      'fa': 'ویرایش پروفایل',
      'nl': 'Profiel bewerken',
    },
    'ux5iqynl': {
      'en': 'Terms & Conditions',
      'fa': 'شرایط و ضوابط',
      'nl': 'Algemene voorwaarden',
    },
    'ks3vswcp': {
      'en': 'Share Profile',
      'fa': 'اشتراک‌گذاری پروفایل',
      'nl': 'Profiel delen',
    },
    'ha2x8rnw': {
      'en': 'Contact Us',
      'fa': 'تماس با ما',
      'nl': 'Neem contact met ons op',
    },
    '81n9awh1': {
      'en': 'Log Out',
      'fa': 'خروج',
      'nl': 'Uitloggen',
    },
    '5r4wo0co': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
  },
  // ReviewCard
  {
    'wdd96ugv': {
      'en': 'Comunication',
      'fa': 'ارتباطات',
      'nl': 'Communicatie',
    },
    'qc660x4w': {
      'en': ' Quality',
      'fa': 'کیفیت',
      'nl': 'Kwaliteit',
    },
    'igw49v8r': {
      'en': 'Reliability',
      'fa': 'قابلیت اطمینان',
      'nl': 'Betrouwbaarheid',
    },
    'fnbjhk24': {
      'en': 'Fairness',
      'fa': 'انصاف',
      'nl': 'Eerlijkheid',
    },
    '3i80oi0s': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'nl': 'Lees verder',
    },
    'qlrzst3v': {
      'en': 'Read less',
      'fa': 'کمتر بخوانید',
      'nl': 'Lees minder',
    },
  },
  // ReviewCard_small
  {
    'd6l96odj': {
      'en': 'Comunication',
      'fa': 'ارتباطات',
      'nl': 'Communicatie',
    },
    'p9fq8o0p': {
      'en': ' Quality',
      'fa': 'کیفیت',
      'nl': 'Kwaliteit',
    },
    'vv9ma3w1': {
      'en': 'Reliability',
      'fa': 'قابلیت اطمینان',
      'nl': 'Betrouwbaarheid',
    },
    'j4xtcwnz': {
      'en': 'Fairness',
      'fa': 'انصاف',
      'nl': 'Eerlijkheid',
    },
    'c6g53hr2': {
      'en': 'Read more',
      'fa': 'ادامه مطلب',
      'nl': 'Lees verder',
    },
    'dehvy8to': {
      'en': 'Read less',
      'fa': 'کمتر بخوانید',
      'nl': 'Lees minder',
    },
  },
  // Undo
  {
    'zj7g28ts': {
      'en': 'Undo',
      'fa': 'لغو',
      'nl': 'Ongedaan maken',
    },
  },
  // YekjaScorePopUp
  {
    'x4t1poso': {
      'en': 'Yekja Level',
      'fa': 'سطح یکجا',
      'nl': 'Yekja-niveau',
    },
    'tccfkwh8': {
      'en': 'Total Points',
      'fa': 'مجموع امتیازات',
      'nl': 'Totaal aantal punten',
    },
    'rg6yq5rd': {
      'en': '10',
      'fa': '۱۰',
      'nl': '10',
    },
    '1fgfwxor': {
      'en': '90 pts to next level',
      'fa': '۹۰ امتیاز تا مرحله بعد',
      'nl': '90 punten naar het volgende niveau',
    },
    'x8y52jsy': {
      'en': 'Dena',
      'fa': 'دنا',
      'nl': 'Dena',
    },
    'uju72slx': {
      'en': 'Sabalan',
      'fa': 'سبلان',
      'nl': 'Sabalan',
    },
    '9oprtrph': {
      'en': 'Alam Kooh',
      'fa': 'علم کوه',
      'nl': 'Alam Kooh',
    },
    'n5fv9i65': {
      'en': 'Damavand',
      'fa': 'دماوند',
      'nl': 'Damavand',
    },
    'riofot9y': {
      'en': 'Welcome onboard ',
      'fa': 'به داخل خوش آمدید',
      'nl': 'Welkom aan boord',
    },
    '0ydazef5': {
      'en':
          'You\'ve just joined Yekja! Start by completing your profile, creating your first listing or offering help to earn points.',
      'fa':
          'شما همین الان به یکجا پیوستید! با تکمیل پروفایل خود، ایجاد اولین آگهی یا ارائه کمک برای کسب امتیاز شروع کنید.',
      'nl':
          'Je bent net lid geworden van Yekja! Begin met het voltooien van je profiel, het maken van je eerste vermelding of het aanbieden van hulp bij het verdienen van punten.',
    },
    'pm8axn5i': {
      'en': 'Complete profile (+5)',
      'fa': 'مشخصات کامل (+5)',
      'nl': 'Volledig profiel (+5)',
    },
    '8rbjz4a2': {
      'en': 'Create first post (+3)',
      'fa': 'ایجاد اولین پست (+3)',
      'nl': 'Eerste bericht maken (+3)',
    },
    'm274lwcs': {
      'en': 'Recent Contributions',
      'fa': 'مشارکت‌های اخیر',
      'nl': 'Recente bijdragen',
    },
    'jwv0s37y': {
      'en': '+10 ',
      'fa': '+10',
      'nl': '+10',
    },
    'c85wa8iq': {
      'en': 'Welcome points',
      'fa': 'نقاط خوشامدگویی',
      'nl': 'Welkomstpunten',
    },
    'si2ij889': {
      'en': '2h ago',
      'fa': '۲ ساعت پیش',
      'nl': '2 uur geleden',
    },
    'll3tfsg2': {
      'en': '+20 (Locked)',
      'fa': '+۲۰ (قفل شده)',
      'nl': '+20 (Vergrendeld)',
    },
    'k9no7per': {
      'en': ' Early Adopter',
      'fa': 'پذیرنده اولیه',
      'nl': 'Vroege adoptant',
    },
    'xsrkjudl': {
      'en': '2h ago',
      'fa': '۲ ساعت پیش',
      'nl': '2 uur geleden',
    },
    'bomwqsri': {
      'en': 'See how points work',
      'fa': 'ببینید امتیازها چگونه کار می‌کنند',
      'nl': 'Bekijk hoe punten werken',
    },
  },
  // Comunication_Bar
  {
    'kign2ryz': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'cehxi79j': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '8f99d8cs': {
      'en': '',
      'fa': '',
      'nl': '',
    },
  },
  // MainHeaderCore
  {
    'zgdhiey6': {
      'en': '10',
      'fa': '۱۰',
      'nl': '10',
    },
  },
  // NavBarCore
  {
    'lmrhij3e': {
      'en': 'Complete profile before posting',
      'fa': 'تکمیل پروفایل پیش از ثبت آگهی',
      'nl': 'Vul je profiel in voordat je het plaatst',
    },
    '91puj2om': {
      'en':
          'Take 2 minutes to add your info and start posting with maximum visibility.',
      'fa':
          'در چند دقیقه اطلاعات خود را وارد کنید تا آگهی‌تان برای دیگران قابل‌نمایش شود.',
      'nl':
          'Neem 2 minuten de tijd om uw gegevens toe te voegen en begin met posten met maximale zichtbaarheid.',
    },
    't1t4f6fq': {
      'en': 'Cancel',
      'fa': 'لغو',
      'nl': 'Annuleren',
    },
    'l1hz8qip': {
      'en': 'Go ',
      'fa': 'برو',
      'nl': 'Gaan',
    },
  },
  // shoutOutCard
  {
    'r6m3h1jr': {
      'en': '+10 Points',
      'fa': '+۱۰ امتیاز',
      'nl': '+10 punten',
    },
  },
  // City
  {
    '75lheyde': {
      'en': 'Select post location',
      'fa': 'انتخاب محل پست',
      'nl': 'Selecteer berichtlocatie',
    },
    '7933j7f6': {
      'en': 'Help people nearby find your post easier',
      'fa': 'به افراد نزدیک کمک کنید تا پست شما را راحت‌تر پیدا کنند',
      'nl': 'Help mensen in de buurt om uw bericht gemakkelijker te vinden',
    },
    'cv8cyjah': {
      'en': 'Which city is the most relevant for your listing?',
      'fa': 'کدام شهر برای لیست شما بیشترین ارتباط را دارد؟',
      'nl': 'Welke stad is het meest relevant voor uw vermelding?',
    },
    'eloa7nty': {
      'en': 'Select',
      'fa': 'انتخاب کنید',
      'nl': 'Selecteer',
    },
    'aeb0aszu': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'n9csc84z': {
      'en': 'None',
      'fa': 'هیچکدام',
      'nl': 'Geen',
    },
    'fmxkukhm': {
      'en': 'Per day',
      'fa': 'در هر روز',
      'nl': 'Per dag',
    },
    'gscjbddc': {
      'en': 'Per night',
      'fa': 'به ازای هر شب',
      'nl': 'Per nacht',
    },
    'ntbalyzj': {
      'en': 'Per week',
      'fa': 'در هر هفته',
      'nl': 'Per week',
    },
    '6igkwhjn': {
      'en': 'Per month',
      'fa': 'در هر ماه',
      'nl': 'Per maand',
    },
    '8pmjhzcv': {
      'en': 'Per year',
      'fa': 'در هر سال',
      'nl': 'Per jaar',
    },
    'cwasdfnt': {
      'en': 'Save',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
  },
  // ReviewAndRating
  {
    'bgtfx9oz': {
      'en': 'Would you like to share your experience about this member?',
      'fa': 'آیا مایلید تجربه خود را در مورد این عضو به اشتراک بگذارید؟',
      'nl': 'Wilt u uw ervaring over dit lid delen?',
    },
    'bc2ugybz': {
      'en': 'Communication',
      'fa': 'ارتباطات',
      'nl': 'Mededeling',
    },
    '1wffczog': {
      'en': 'Reliability',
      'fa': 'قابلیت اطمینان',
      'nl': 'Betrouwbaarheid',
    },
    '3hk4ajr8': {
      'en': 'Quality',
      'fa': 'کیفیت',
      'nl': 'Kwaliteit',
    },
    '69tqvojl': {
      'en': 'Fairness',
      'fa': 'انصاف',
      'nl': 'Eerlijkheid',
    },
    'ixl4pva7': {
      'en': 'Review note',
      'fa': 'یادداشت بررسی',
      'nl': 'Beoordelingsnotitie',
    },
    'sc2b19jg': {
      'en':
          'Please use only letters (English/Persian), spaces, dot or underscore.',
      'fa':
          'لطفا فقط از حروف (انگلیسی/فارسی)، فاصله، نقطه یا زیرخط استفاده کنید.',
      'nl':
          'Gebruik alleen letters (Engels/Perzisch), spaties, punten en onderstrepingstekens.',
    },
    'duslkxf6': {
      'en': 'Please choose an option from the dropdown',
      'fa': 'لطفا یک گزینه را از منوی کشویی انتخاب کنید',
      'nl': 'Kies een optie uit de keuzelijst',
    },
    'q9biojw1': {
      'en': 'Submit',
      'fa': 'ارسال',
      'nl': 'Indienen',
    },
  },
  // verifyCode
  {
    'hy8t8fp9': {
      'en': 'A confimation code was sent via email.',
      'fa': 'یک کد تایید از طریق ایمیل ارسال شد.',
      'nl': 'Er is een bevestigingscode per e-mail verzonden.',
    },
    'unuifogx': {
      'en': 'Wrong or expired code!',
      'fa': 'کد اشتباه یا منقضی شده!',
      'nl': 'Onjuiste of verlopen code!',
    },
    're93hvjq': {
      'en': 'Pease enter  valid code',
      'fa': 'لطفا کد معتبر را وارد کنید',
      'nl': 'Voer alstublieft een geldige code in',
    },
    'vra2s4j2': {
      'en': 'Resend',
      'fa': 'ارسال مجدد',
      'nl': 'Opnieuw verzenden',
    },
    '62qr2zha': {
      'en': 'Verify Now',
      'fa': 'اکنون تأیید کنید',
      'nl': 'Nu verifiëren',
    },
  },
  // Cat
  {
    '2sh31bj5': {
      'en': 'Select the category\nbest fitting your post',
      'fa': 'دسته بندی متناسب با پست خود را انتخاب کنید',
      'nl': 'Selecteer de categorie die het beste bij je bericht past',
    },
  },
  // SubCat
  {
    's5qf1eaq': {
      'en': 'Which category\nfits your post best?',
      'fa': 'کدام دسته بندی  با\nپست شما مطابقت دارد؟',
      'nl': 'Welke categorie past het beste bij jouw bericht?',
    },
    's3fm07uu': {
      'en': 'Helps others find your post',
      'fa': 'به دیگران کمک می‌کند تا پست شما را پیدا کنند',
      'nl': 'Helpt anderen uw bericht te vinden',
    },
  },
  // Calendar
  {
    '4ryihxff': {
      'en': 'Insert the relevant date',
      'fa': 'تاریخ مربوطه را وارد کنید',
      'nl': 'Vul de relevante datum in',
    },
    'cr5tb9k4': {
      'en': 'Save',
      'fa': 'ذخیره',
      'nl': 'Redden',
    },
  },
  // ErrorComp
  {
    '9a3o272s': {
      'en': 'Close',
      'fa': 'بستن',
      'nl': 'Dichtbij',
    },
  },
  // ItemCard_JobRequest
  {
    'q027rqkh': {
      'en': 'Ali-2025',
      'fa': 'علی-۲۰۲۵',
      'nl': 'Ali-2025',
    },
    'apycgmbi': {
      'en': 'Amsterdam',
      'fa': 'آمستردام',
      'nl': 'Amsterdam',
    },
    'tzhecu0o': {
      'en': 'Subcategory',
      'fa': 'زیرشاخه',
      'nl': 'Subcategorie',
    },
    'bjin0bz7': {
      'en': 'Baby-sitting job request',
      'fa': 'درخواست کار نگهداری از کودک',
      'nl': 'Aanvraag voor een oppasbaan',
    },
    'u7kwjo4d': {
      'en':
          'Description for someone looking for a job.  and he is amazing and all. Description for someone looking for a job. Description for someone looking for a job. Description for someone looking for a job. Description for someone looking for a job. ',
      'fa':
          'توضیحات برای کسی که دنبال کار می‌گردد. و او فوق‌العاده است و از این حرف‌ها. توضیحات برای کسی که دنبال کار می‌گردد. توضیحات برای کسی که دنبال کار می‌گردد. توضیحات برای کسی که دنبال کار می‌گردد. توضیحات برای کسی که دنبال کار می‌گردد.',
      'nl':
          'Beschrijving voor iemand die op zoek is naar een baan. En hij is geweldig en zo. Beschrijving voor iemand die op zoek is naar een baan. Beschrijving voor iemand die op zoek is naar een baan. Beschrijving voor iemand die op zoek is naar een baan. Beschrijving voor iemand die op zoek is naar een baan.',
    },
    'w7fidcvb': {
      'en': 'Dec 21, 2025',
      'fa': '۲۱ دسامبر ۲۰۲۵',
      'nl': '21 december 2025',
    },
    'wlcvvwpw': {
      'en': '0',
      'fa': '0',
      'nl': '0',
    },
  },
  // Terms_popup
  {
    'w7tnoy2a': {
      'en': 'Terms and Privacy Policy',
      'fa': '',
      'nl': '',
    },
    'xiiybaze': {
      'en': 'Main Header',
      'fa': '',
      'nl': '',
    },
    'psnuzzq3': {
      'en':
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      'fa': '',
      'nl': '',
    },
  },
  // filterComp
  {
    '39m80n6c': {
      'en': 'Sort by',
      'fa': 'مرتب سازی بر اساس',
      'nl': 'Sorteren op',
    },
    'rmxru5tr': {
      'en': 'Recent first',
      'fa': 'اول اخیر',
      'nl': 'Recente eerste',
    },
    'e5ksnrbu': {
      'en': 'Popularity',
      'fa': 'محبوبیت',
      'nl': 'Populariteit',
    },
    '6mlgkdcp': {
      'en': 'Main Category',
      'fa': 'دسته اصلی',
      'nl': 'Hoofd categorie',
    },
    'jug5o44h': {
      'en': 'Voluntray Support',
      'fa': 'همیاری داوطلبانه',
      'nl': 'Vrijwillige ondersteuning',
    },
    'myphja0c': {
      'en': 'Market',
      'fa': 'بازار',
      'nl': 'Markt',
    },
    '67tk0h49': {
      'en': 'Services',
      'fa': 'خدمات',
      'nl': 'Diensten',
    },
    'pczy2tae': {
      'en': 'Events',
      'fa': 'رویدادها',
      'nl': 'Evenementen',
    },
    'vomy1zvs': {
      'en': 'Category',
      'fa': 'دسته بندی',
      'nl': 'Categorie',
    },
    'oxm7whsh': {
      'en': 'Prefrences',
      'fa': 'اولویت‌ها',
      'nl': 'Voorkeuren',
    },
    '049of0yw': {
      'en': 'Has Images',
      'fa': 'دارای تصاویر',
      'nl': 'Heeft afbeeldingen',
    },
    'z1n4754v': {
      'en': 'Yekja Certified',
      'fa': 'دارای گواهینامه یکجا',
      'nl': 'Yekja gecertificeerd',
    },
    '1k0o4qcd': {
      'en': 'Highly Rated Users',
      'fa': 'کاربران با امتیاز بالا',
      'nl': 'Hoog gewaardeerde gebruikers',
    },
    'znbsze95': {
      'en': 'Location',
      'fa': 'مکان',
      'nl': 'Locatie',
    },
    'ba1i6j7a': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'eawvpykz': {
      'en': 'Anywhere in NL   ',
      'fa': 'هر کجای هلند',
      'nl': 'Overal in NL',
    },
    'uvve2iu3': {
      'en': 'Search...',
      'fa': 'جستجو...',
      'nl': 'Zoekopdracht...',
    },
    'w34s76kb': {
      'en': 'Search',
      'fa': 'جستجو',
      'nl': 'Zoekopdracht',
    },
    'qq5pvrob': {
      'en': 'Clear all filters',
      'fa': 'پاک کردن همه فیلترها',
      'nl': 'Wis alle filters',
    },
  },
  // ItemCard_Global
  {
    'vpd49szk': {
      'en': ' experience',
      'fa': ' تجربه',
      'nl': 'van ervaring',
    },
    '6h0218xd': {
      'en': 'Deadline: ',
      'fa': 'مهلت:',
      'nl': 'Termijn:',
    },
    'tdw1ixid': {
      'en': 'Deadline: ',
      'fa': 'مهلت:',
      'nl': 'Termijn:',
    },
    'jzq5a1x5': {
      'en': 'Amount: ',
      'fa': 'تعداد:',
      'nl': 'Hoeveelheid:',
    },
    'zgyxpe94': {
      'en': 'Rate: ',
      'fa': 'نرخ :',
      'nl': 'Tarief:',
    },
    'sb5jusz4': {
      'en': 'Accepts Partial',
      'fa': 'جزئی را می‌پذیرد',
      'nl': 'Accepteert gedeeltelijk',
    },
    'zok8shky': {
      'en': 'Negotiable',
      'fa': 'قابل مذاکره',
      'nl': 'Bespreekbaar',
    },
    'jxlxlioj': {
      'en': 'Asking price:  ',
      'fa': ' قیمت پیشنهادی: ',
      'nl': 'Vraagprijs:',
    },
    'inm3m0av': {
      'en': 'going',
      'fa': 'رفتن',
      'nl': 'gaan',
    },
    'x3f5blyy': {
      'en': 'City:',
      'fa': 'شهر:',
      'nl': 'Stad:',
    },
    'd8qll1yl': {
      'en': 'Capacity:',
      'fa': 'ظرفیت:',
      'nl': 'Capaciteit:',
    },
    'ivh9ys6v': {
      'en': 'Starts',
      'fa': 'شروع می‌شود',
      'nl': 'Begint',
    },
    'ynjjmp1u': {
      'en': 'Ends:',
      'fa': 'پایان‌ها:',
      'nl': 'Einde:',
    },
    '0qhi38vm': {
      'en': 'See participants',
      'fa': 'ببین کی میره؟',
      'nl': 'Bekijk deelnemers',
    },
    'c6gb4wdd': {
      'en': 'From: ',
      'fa': 'از:',
      'nl': 'Van:',
    },
    '8x2p1xmy': {
      'en': 'Until: ',
      'fa': 'تا:',
      'nl': 'Tot:',
    },
  },
  // Intend
  {
    '87p6u5kq': {
      'en': 'One-time offer or \nongoing service?',
      'fa': 'پیشنهاد یک‌باره یا خدمات مداوم؟',
      'nl': 'Eenmalige aanbieding of\ndoorlopende service?',
    },
    'dwu25dhe': {
      'en':
          'You’re offering your services. Choose whether this service should appear once or stay visible long-term.',
      'fa':
          'شما خدمات خود را ارائه می‌دهید. انتخاب کنید که آیا این سرویس یک بار نمایش داده شود یا برای مدت طولانی قابل مشاهده باشد.',
      'nl':
          'Je biedt je diensten aan. Kies of deze dienst éénmalig wordt weergegeven of langdurig zichtbaar blijft.',
    },
    'rbaxj0aw': {
      'en': 'One-time post',
      'fa': 'پست موقت',
      'nl': 'Eenmalige post',
    },
    'l36q8klt': {
      'en':
          'One-time posts are great for short projects or temporary availability — they stay visible for a limited period (4 weeks).',
      'fa':
          'پست‌های موقت  برای پروژه‌های کوتاه‌مدت یا دسترسی موقت عالی هستند - آن‌ها برای مدت محدودی (۴ هفته) قابل مشاهده هستند.',
      'nl':
          'Eenmalige berichten zijn ideaal voor korte projecten of tijdelijke beschikbaarheid: ze blijven gedurende een beperkte periode zichtbaar (4 weken).',
    },
    'x2t6sox5': {
      'en': 'Permanent post',
      'fa': 'پست دائمی',
      'nl': 'Permanente post',
    },
    'fxdlkfht': {
      'en':
          'Ideal for professionals or businesses who want steady visibility. Available free with a ',
      'fa':
          'ایده‌آل برای متخصصان یا کسب‌وکارهایی که می‌خواهند دید ثابتی داشته باشند. به صورت رایگان با ... در دسترس است.',
      'nl':
          'Ideaal voor professionals of bedrijven die een stabiele zichtbaarheid wensen. Gratis verkrijgbaar bij een',
    },
    's8z12quc': {
      'en': 'business account',
      'fa': 'حساب تجاری',
      'nl': 'zakelijke rekening',
    },
    'ubs0tesc': {
      'en': ', and your post will appear higher in searches.',
      'fa': 'و پست شما در جستجوها بالاتر نمایش داده شود.',
      'nl': ', en uw bericht zal hoger in de zoekresultaten verschijnen.',
    },
    '0ti2vese': {
      'en': 'Business Accounts Not Yet Available',
      'fa': 'حساب‌های تجاری هنوز در دسترس نیستند',
      'nl': 'Zakelijke rekeningen nog niet beschikbaar',
    },
    'ig7cdm4x': {
      'en':
          'Business mode is on its way. Toet early access when it launches — we’ll notify you first.',
      'fa': 'حساب تجاری در راه است. ',
      'nl':
          'Zakelijke rekeningen komt er binnenkort aan. Wil je vroege toegang? We laten het je als eerste weten zodra het wordt gelanceerd.',
    },
    'hyiq7xhv': {
      'en': 'No Thanks',
      'fa': 'نه ممنون',
      'nl': 'Nee bedankt',
    },
    'f5su6tso': {
      'en': 'Join',
      'fa': 'عضویت',
      'nl': 'Meedoen',
    },
    'k51z1wp5': {
      'en': 'Organizing or Announcing?',
      'fa': 'سازماندهی یا اطلاع رسانی؟',
      'nl': 'Organiseren of aankondigen?',
    },
    'cis7ye7m': {
      'en':
          'You are creating a post in Events. Are you posting to host an event or simply announce it?',
      'fa':
          'شما در حال ایجاد یک پست در بخش رویدادها هستید. آیا قصد دارید میزبان یک رویداد باشید یا صرفاً آن را اعلام کنید؟',
      'nl':
          'Je maakt een bericht aan in Evenementen. Plaats je een bericht om een evenement te organiseren of kondig je het gewoon aan?',
    },
    '0qa2lmef': {
      'en': 'Event Hosting',
      'fa': 'میزبانی رویداد',
      'nl': 'Evenementenhosting',
    },
    'o0w7qsn1': {
      'en':
          'If you’re organizing, you’ll gather participants or manage sign-ups.',
      'fa':
          'اگر در حال سازماندهی هستید، شرکت‌کنندگان را جمع‌آوری می‌کنید یا ثبت‌نام‌ها را مدیریت می‌کنید.',
      'nl':
          'Als organisator bent u verantwoordelijk voor het verzamelen van deelnemers en het beheren van inschrijvingen.',
    },
    'hbcxot75': {
      'en': 'Event Announcement',
      'fa': 'اطلاعیه رویداد',
      'nl': 'Aankondiging van een evenement',
    },
    'mit9srh5': {
      'en':
          'If you’re announcing, you’re just sharing info about an existing event.',
      'fa':
          'اگر اعلام می‌کنید، فقط اطلاعات مربوط به یک رویداد موجود را به اشتراک می‌گذارید.',
      'nl':
          'Als je een evenement aankondigt, deel je alleen informatie over een bestaand evenement.',
    },
    'm7sd9g39': {
      'en': 'Buying or selling?',
      'fa': 'خرید یا فروش؟',
      'nl': 'Kopen of verkopen?',
    },
    'r4r5264v': {
      'en':
          'You are creating a post for currency exchanges. Do you want to buy or sell Euros (or USD)?',
      'fa':
          'شما در حال ایجاد یک پست برای مبادلات ارزی هستید. آیا می‌خواهید یورو (یا دلار آمریکا) بخرید یا بفروشید؟',
      'nl':
          'U maakt een bericht aan over valutawissels. Wilt u euro\'s (of dollars) kopen of verkopen?',
    },
    '6e97ilzn': {
      'en':
          'Buying or selling currency is based on mutual trust. Build your trust score to trade with confidence.',
      'fa':
          'خرید یا فروش ارز بر اساس اعتماد متقابل است. امتیاز اعتماد خود را افزایش دهید تا با اطمینان معامله کنید.',
      'nl':
          'Het kopen of verkopen van valuta is gebaseerd op wederzijds vertrouwen. Vergroot uw vertrouwensscore om met vertrouwen te handelen.',
    },
    '2bi43c0v': {
      'en': 'Buy Request',
      'fa': 'درخواست خرید',
      'nl': 'Koopverzoek',
    },
    '9j7vpkxv': {
      'en': 'Sell Request',
      'fa': 'درخواست فروش',
      'nl': 'Verkoopverzoek',
    },
    'aro253vy': {
      'en': 'Swap or Borrow?',
      'fa': 'مبادله یا درخواست امانتی؟',
      'nl': 'Ruilen of lenen?',
    },
    'ucg59vkw': {
      'en': 'Swap items or borrow them. Choose what you need.',
      'fa':
          'می‌توانید وسایل را معاوضه کنید یا قرض بگیرید. گزینه مناسب را انتخاب کنید.',
      'nl': 'Ruil items of leen ze. Kies wat je nodig hebt.',
    },
    '9pfxl1r8': {
      'en': 'Swap Request',
      'fa': 'درخواست سوآپ',
      'nl': 'Ruilverzoek',
    },
    'h1uwpunn': {
      'en':
          'If you have things you don’t use—books, clothes, tools, home items—you can swap them for something you actually need. It’s fun, sustainable, and saves money.',
      'fa':
          'اگر وسایلی دارید که دیگر استفاده نمی‌کنید—کتاب، لباس، ابزار، یا وسایل خانه—می‌توانید آن‌ها را با چیزهایی که نیاز دارید معاوضه کنید. هم جذاب است، هم اقتصادی و هم سازگار با محیط‌زیست.',
      'nl':
          'Heb je spullen die je niet meer gebruikt—boeken, kleding, gereedschap, of huishoudelijke items? Ruil ze voor iets dat je wél nodig hebt. Leuk, duurzaam en kostenbesparend.',
    },
    'vkzuu1uf': {
      'en': 'Borrow Request',
      'fa': 'درخواست امانت',
      'nl': 'Leenaanvraag',
    },
    'm6ugg9ka': {
      'en':
          'If you only need something temporarily—like a drill, suitcase, heater, or a book—you can request to borrow it instead of buying new. Someone nearby may be happy to share.',
      'fa':
          'اگر فقط برای مدت کوتاهی چیزی لازم دارید—مثل دریل، چمدان، بخاری یا یک کتاب—می‌توانید درخواست قرض بگذارید. معمولاً کسی هست که با خوشحالی آن را به اشتراک بگذارد.',
      'nl':
          'Heb je iets maar voor even nodig—zoals een boormachine, koffer, kachel of boek? Plaats een leenverzoek. Vaak wil iemand in de buurt het graag delen.',
    },
    '8ddqfevw': {
      'en': 'Offer or request?',
      'fa': 'پیشنهاد یا درخواست؟',
      'nl': 'Aanbod of verzoek?',
    },
    'm08mwdqw': {
      'en':
          'Offer to carry a parcel or request someone to bring yours. Choose what you need.',
      'fa':
          'یا جا برای حمل بار دارید، یا می‌خواهید کسی بسته‌تان را بیاورد. گزینه مناسب را انتخاب کنید.',
      'nl':
          'Bied aan om een pakket mee te nemen of vraag iemand jouw pakket te brengen. Kies wat je nodig hebt.',
    },
    'wm227gps': {
      'en': 'Offer Transfer',
      'fa': ' پیشنهاد حمل بار',
      'nl': 'Aanbod Overdracht',
    },
    'iq8b44u5': {
      'en':
          'If you’re travelling and have extra luggage space, you can offer to carry someone’s parcel (free or paid).',
      'fa':
          'اگر در سفر جا دارید، می‌توانید حمل بسته‌ی دیگران را پیشنهاد دهید (رایگان یا با هزینه).',
      'nl':
          'Als je reist en extra ruimte hebt, kun je aanbieden een pakket mee te nemen (gratis of tegen betaling).',
    },
    'tdg171hr': {
      'en': 'Request Transfer',
      'fa': 'درخواست  حمل بار',
      'nl': 'Verzoek om overdracht',
    },
    'k77wbpot': {
      'en':
          'If you need someone to bring your parcel from another city or country, you can request it (they may do it free or for a fee).',
      'fa':
          'اگر می‌خواهید کسی بسته‌تان را از شهری یا کشوری دیگر بیاورد، می‌توانید درخواست بگذارید (ممکن است رایگان یا با هزینه باشد).',
      'nl':
          'Als je iemand nodig hebt om jouw pakket uit een andere stad of land mee te nemen, kun je een verzoek plaatsen (gratis of tegen vergoeding).',
    },
    '1aooss4m': {
      'en': 'Offer or request?',
      'fa': 'پیشنهاد یا درخواست؟',
      'nl': 'Aanbod of verzoek?',
    },
    'ndrnheb5': {
      'en':
          'Offer help (as volunteer) or request support. Choose what you need.',
      'fa':
          'شما می‌توانید داوطلب ارائه کمک شوید یا درخواست کمک کنید. گزینه مناسب را انتخاب کنید.',
      'nl': 'Bied hulp aan of vraag om ondersteuning. Kies wat je nodig hebt.',
    },
    't0dr4r39': {
      'en': 'Offer Help',
      'fa': 'پیشنهاد کمک',
      'nl': 'Hulp aanbieden',
    },
    'ufz6eh50': {
      'en':
          'If you have time to help—like daily tasks, elderly care, newcomer support, or companionship—you can offer assistance (volunteer).',
      'fa':
          'اگر وقت دارید در کارهایی مثل امور روزمره، مراقبت از سالمند، کمک به تازه‌واردها یا همراهی کمک کنید، می‌توانید کمک خود را پیشنهاد دهید (داوطلبانه).',
      'nl':
          'Als je tijd hebt om te helpen—zoals dagelijkse taken, ouderenzorg, ondersteuning van nieuwkomers of gezelschap—kun je jouw hulp aanbieden (vrijwillig).',
    },
    'muizxt8j': {
      'en': 'Request Help',
      'fa': 'درخواست کمک',
      'nl': 'Hulp aanvragen',
    },
    '36ruc8te': {
      'en':
          'If you need support with anything, you can request help from community members (free).',
      'fa':
          'اگر در هر موردی به پشتیبانی نیاز دارید، می‌توانید از اعضای گروه (رایگان) درخواست کمک کنید.',
      'nl':
          'Als u ergens ondersteuning bij nodig hebt, kunt u gratis om hulp vragen bij de communityleden.',
    },
    'mnl4jxcy': {
      'en': 'Offer or request?',
      'fa': 'پیشنهاد یا درخواست؟',
      'nl': 'Aanbod of verzoek?',
    },
    'rirenr5j': {
      'en': 'Offer a place for rent or request one. Choose what you need.',
      'fa':
          'می‌توانید یک مکان را برای اجاره بگذارید یا درخواست اجاره کنید. گزینه مناسب را انتخاب کنید.',
      'nl': 'Bied een huurplek aan of vraag er één. Kies wat je nodig hebt.',
    },
    'axyp5zr2': {
      'en': 'Rental Offer',
      'fa': 'پیشنهاد اجاره',
      'nl': 'Huuraanbieding',
    },
    'ev9qliyl': {
      'en':
          'If you have something to rent out—like an apartment, room, studio, parking spot, or storage—you can offer it for short-term, long-term, or sublet.',
      'fa':
          'اگر چیزی برای اجاره دارید - مانند آپارتمان، اتاق، استودیو، پارکینگ یا انبار - می‌توانید آن را برای کوتاه‌مدت، بلندمدت یا اجاره فرعی ارائه دهید.',
      'nl':
          'Als u iets te verhuren heeft, zoals een appartement, kamer, studio, parkeerplaats of opslagruimte, kunt u dit voor korte of lange termijn aanbieden, of onderverhuren.',
    },
    '3opc2xmk': {
      'en': 'Rental Request',
      'fa': 'درخواست اجاره',
      'nl': 'Huuraanvraag',
    },
    'd1vm1ovv': {
      'en':
          'If you’re looking to rent—whether a room, apartment, vacation stay, or a small storage space—you can request a rental that fits your need.',
      'fa':
          'اگر دنبال اجاره هستید—چه اتاق، آپارتمان، اقامت کوتاه‌مدت یا حتی یک فضای کوچک برای انبار—می‌توانید درخواست اجاره بگذارید.',
      'nl':
          'Als je iets wilt huren—bijvoorbeeld een kamer, appartement, vakantieverblijf of een kleine opslagruimte—kun je een huurverzoek plaatsen.',
    },
    'bs7jlax1': {
      'en': 'Offer or request?',
      'fa': 'پیشنهاد یا درخواست؟',
      'nl': 'Aanbod of verzoek?',
    },
    'u2idimt5': {
      'en': 'Offer your ticket or request one. Choose what you need.',
      'fa':
          'می‌توانید بلیت‌تان را برای فروش ارائه دهید یا درخواست بلیت کنید. گزینه مناسب را انتخاب کنید.',
      'nl': 'Bied je ticket aan of vraag er een aan. Kies wat je nodig hebt.',
    },
    '3qefnafa': {
      'en': 'Offer Ticket',
      'fa': 'پیشنهاد فروش بلیط ',
      'nl': 'Aanbiedingsticket',
    },
    's1cuk5xl': {
      'en':
          'If you can’t attend an event anymore, you can offer your ticket—concerts, workshops, festivals, anything—so someone else can enjoy it.',
      'fa':
          'اگر دیگر نمی‌توانید در یک رویداد شرکت کنید، می‌توانید بلیت خود را برای دیگران بگذارید—کنسرت، ورکشاپ، فستیوال یا هر رویداد دیگر—تا شخص دیگری از آن لذت ببرد.',
      'nl':
          'Kun je niet meer naar een evenement? Bied je ticket aan—voor concerten, workshops, festivals, noem maar op—en maak iemand anders blij.',
    },
    'mfecrevr': {
      'en': 'Request Ticket',
      'fa': 'درخواست  خرید یا معاوضه بلیط ',
      'nl': 'Ticket aanvragen',
    },
    'qjiypnee': {
      'en':
          'If you’re looking for a ticket to an event you want to join, you can request one—maybe someone has an extra or can’t go and will pass it on.',
      'fa':
          'اگر به‌دنبال بلیت رویدادی هستید که دوست دارید شرکت کنید، می‌توانید درخواست بگذارید—شاید کسی بلیت اضافی دارد یا نمی‌تواند برود.',
      'nl':
          'Zoek je een ticket voor een evenement waar je graag heen wilt? Plaats een verzoek—misschien heeft iemand een extra ticket of kan die niet meer gaan.',
    },
  },
  // PostDetailColumn
  {
    '3gufl5xa': {
      'en': 'Post type',
      'fa': 'نوع پست',
      'nl': 'Post type',
    },
    '77ds1n0c': {
      'en': 'Experience (years)',
      'fa': 'سابقه  (سال)',
      'nl': 'Ervaring (jaar)',
    },
    '79sc5lds': {
      'en': 'Service model',
      'fa': 'مدل خدمات',
      'nl': 'Servicemodel',
    },
    'eak3bknm': {
      'en': 'Languages',
      'fa': 'زبان‌ها',
      'nl': 'Taal',
    },
    '2abmumu6': {
      'en': 'Rates',
      'fa': 'نرخ',
      'nl': 'Tarieven',
    },
    'tutw2z0k': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'id5zuegs': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'l1r4x8tp': {
      'en': 'Suupport (',
      'fa': 'همیاری (',
      'nl': 'Ondersteuning (',
    },
    'xbn6j3gl': {
      'en': ')',
      'fa': ')',
      'nl': ')',
    },
    'vs0wrubx': {
      'en': 'Deadline',
      'fa': 'آخرین مهلت',
      'nl': 'Opzegtermijn',
    },
    '5pr104m5': {
      'en': 'Compensation',
      'fa': 'نحوه جبران',
      'nl': 'Compensatie',
    },
    'l0eqlcnb': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'gdphtsss': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    'yopog44d': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'rqegm8nq': {
      'en': 'Transfer Parcels (',
      'fa': 'حمل بار (',
      'nl': 'Pakketten verzending (',
    },
    '0qf8t8dv': {
      'en': ')',
      'fa': ')',
      'nl': ')',
    },
    '2mmpwvhv': {
      'en': 'From',
      'fa': 'مبدأ',
      'nl': 'Van',
    },
    'ljl94ajq': {
      'en': ', ',
      'fa': '،',
      'nl': ',',
    },
    'u3zpy6oy': {
      'en': 'To',
      'fa': 'مقصد',
      'nl': 'Naar',
    },
    '7nntto0m': {
      'en': ', ',
      'fa': '،',
      'nl': ',',
    },
    '2vvozi1j': {
      'en': 'Deadline',
      'fa': 'مهلت ارسال',
      'nl': 'Termijn',
    },
    'b8hlktmf': {
      'en': 'Travel date',
      'fa': 'تاریخ سفر',
      'nl': 'Reisdatum',
    },
    'z9jxcuqb': {
      'en': 'Parcel weight',
      'fa': 'وزن بسته',
      'nl': 'Pakketgewicht',
    },
    'lnsxk44o': {
      'en': 'Parcel dimensions',
      'fa': 'ابعاد بسته',
      'nl': 'Pakketafmetingen',
    },
    'y4pdtbn3': {
      'en': 'Compensation method',
      'fa': 'روش جبران',
      'nl': 'Compensatiemethode',
    },
    '5cq1nnvu': {
      'en': 'Fragile',
      'fa': 'شکستنی',
      'nl': 'Breekbaar',
    },
    'bryl5kx5': {
      'en': 'Document',
      'fa': ' مدارک',
      'nl': 'Document',
    },
    'y3bhovjo': {
      'en': 'Negotiation open',
      'fa': 'قابل مذاکره',
      'nl': 'Onderhandeling',
    },
    'xpje26ac': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'smqen6g0': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'n8amqmgo': {
      'en': 'Currency',
      'fa': 'نوع ارز',
      'nl': 'Munteenheid',
    },
    'yeqvz0zv': {
      'en': 'Quantity',
      'fa': 'تعداد',
      'nl': 'Hoeveelheid',
    },
    'zzna3g26': {
      'en': 'Transfer method',
      'fa': 'روش انتقال',
      'nl': 'Overdrachtsmethode',
    },
    'ck4lilmz': {
      'en': 'Asking price',
      'fa': 'قیمت درخواستی',
      'nl': 'Vraagprijs',
    },
    'z0dbitoi': {
      'en': 'Accepts Partial',
      'fa': 'جزئی را می‌پذیرد',
      'nl': 'Accepteert gedeeltelijk',
    },
    'd48murkx': {
      'en': 'Negotiable',
      'fa': 'قابل مذاکره',
      'nl': 'Bespreekbaar',
    },
    '81wy7b6t': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'ygnibftn': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    '1ob5z2xk': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'opejho9m': {
      'en': 'Event date',
      'fa': 'زمان شروع',
      'nl': 'Evenement start',
    },
    '2qu0fh9r': {
      'en': 'Ticket quantity',
      'fa': 'تعداد بلیط',
      'nl': 'Tickethoeveelheid',
    },
    'wo2gqcmq': {
      'en': 'Venue name',
      'fa': 'نام محل برگزاری',
      'nl': 'Locatienaam',
    },
    'wca0vk13': {
      'en': 'Asking price',
      'fa': 'قیمت درخواستی',
      'nl': 'Vraagprijs',
    },
    '992wq66i': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'ap2jrhx8': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    'pi410mx3': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'iszlza42': {
      'en': 'Event start',
      'fa': 'زمان شروع',
      'nl': 'Evenement start',
    },
    '1wuovwv0': {
      'en': 'Event end',
      'fa': 'زمان پایان',
      'nl': 'Einde evenement',
    },
    'ji4gaf5h': {
      'en': 'Repeat frequency',
      'fa': 'تکرار رویدادا',
      'nl': 'Herhalingsfrequentie',
    },
    '3d40vc0f': {
      'en': 'Venue name',
      'fa': 'نام محل برگزاری',
      'nl': 'Locatienaam',
    },
    'kbovix0y': {
      'en': 'Venue address',
      'fa': 'آدرس محل برگزاری',
      'nl': 'Adres van de locatie',
    },
    '0gq3g0iz': {
      'en': 'Asking price',
      'fa': 'قیمت درخواستی',
      'nl': 'Vraagprijs',
    },
    'pp5bzjck': {
      'en': 'Event Capacity:',
      'fa': 'ظرفیت رویداد:',
      'nl': 'Evenementcapaciteit:',
    },
    '64flubdh': {
      'en': 'Poeple Going:',
      'fa': ' شرکت کنندگان',
      'nl': 'Mensen die gaan:',
    },
    'vngxcz6a': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    '7fqfh9xo': {
      'en': 'Delivery Method',
      'fa': 'روش تحویل',
      'nl': 'Leveringsmethode',
    },
    '45inycji': {
      'en': 'Condition',
      'fa': 'وضعیت کالا',
      'nl': 'Voorwaarde',
    },
    'x8rk31fo': {
      'en': 'Asking Price',
      'fa': 'قیمت درخواستی',
      'nl': 'Vraagprijs',
    },
    'g40ymq9o': {
      'en': '(Negotiable)',
      'fa': '(قابل مذاکره)',
      'nl': '(Bespreekbaar)',
    },
    'bobhqusw': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'tgi5tjwn': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    'c6garnwk': {
      'en': 'Delivery Method',
      'fa': 'روش تحویل',
      'nl': 'Leveringsmethode',
    },
    '5tghzbmk': {
      'en': 'Condition',
      'fa': 'وضعیت کالا',
      'nl': 'Voorwaarde',
    },
    '9him87ni': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    'rru4idzo': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    '8ejj2jju': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'c1nc0mco': {
      'en': 'Borrow Duration (days)',
      'fa': 'مدت زمان امانت (روز)',
      'nl': 'Leenduur (dagen)',
    },
    'qgj36reo': {
      'en': 'Deadline',
      'fa': 'مهلت',
      'nl': 'Termijn',
    },
    '6gaukhct': {
      'en': 'Delivery Method',
      'fa': 'روش تحویل',
      'nl': 'Leveringsmethode',
    },
    'v1s94yxn': {
      'en': 'Compensation',
      'fa': 'نحوه جبران',
      'nl': 'Compensatie',
    },
    '9xki1jrr': {
      'en': 'Allows cash adjustment',
      'fa': 'امکان تسویه نقدی',
      'nl': 'Contante bijbetaling?',
    },
    'esf51foj': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
    '464v12ey': {
      'en': 'MY EXCHANGE WISH',
      'fa': 'لیست خواسته‌های من برای تبادل (کالا به کالا)',
      'nl': 'MIJN RUILVENSWENS',
    },
    '4h7ca0k7': {
      'en': 'User wants to',
      'fa': 'نوع پست (قصد کاربر)',
      'nl': 'Gebruiker wil',
    },
    'ermdih4u': {
      'en': 'Rental (',
      'fa': 'اجاره (',
      'nl': 'Verhuur (',
    },
    '95vb90nj': {
      'en': ')',
      'fa': ')',
      'nl': ')',
    },
    'zuqkc559': {
      'en': 'Start Date',
      'fa': 'تاریخ شروع',
      'nl': 'Startdatum',
    },
    'qreh4a9l': {
      'en': 'End Date',
      'fa': 'تاریخ پایان',
      'nl': 'Einddatum',
    },
    'njax37em': {
      'en': 'Rental Type',
      'fa': 'نوع اجاره',
      'nl': 'Huurtype',
    },
    'p77qnt5a': {
      'en': 'Total Area',
      'fa': 'مساحت کل',
      'nl': 'Totale oppervlakte',
    },
    'kkl3a877': {
      'en': 'Deposit',
      'fa': 'پیش پرداخت',
      'nl': 'Borg',
    },
    'kjtooik0': {
      'en': 'Asking Price',
      'fa': 'قیمت درخواستی',
      'nl': 'Vraagprijs',
    },
    'jc4jispe': {
      'en': '(Negotiable)',
      'fa': '(قابل مذاکره)',
      'nl': '(Bespreekbaar)',
    },
    'w5q2qoh9': {
      'en': 'Registration',
      'fa': 'امکان رجیستر',
      'nl': 'Registratie',
    },
    'eekiynt0': {
      'en': 'Furnished',
      'fa': 'مبله',
      'nl': 'Gemeubileerd',
    },
    'wpdl6xsl': {
      'en': 'Incl. Utilities',
      'fa': 'شامل هزینه شارژ',
      'nl': 'Inclusief kosten',
    },
    '114p6pc4': {
      'en': 'DESCRIPTION',
      'fa': 'توضیحات',
      'nl': 'BESCHRIJVING',
    },
  },
  // Miscellaneous
  {
    'omgha2t3': {
      'en': 'Title2',
      'fa': 'عنوان۲',
      'nl': '',
    },
    'vwju2ofj': {
      'en': 'Title1',
      'fa': 'عنوان1',
      'nl': '',
    },
    '01ollrk2': {
      'en': 'Body',
      'fa': 'بدن',
      'nl': '',
    },
    'gey4csry': {
      'en': 'Button',
      'fa': 'دکمه',
      'nl': '',
    },
    'wxhwpq6v': {
      'en': 'LargeTitle',
      'fa': 'عنوان بزرگ',
      'nl': '',
    },
    'deb88d30': {
      'en': 'Label here...',
      'fa': 'اینجا برچسب بزنید...',
      'nl': '',
    },
    'h41az18a': {
      'en': 'email',
      'fa': 'ایمیل',
      'nl': '',
    },
    '57flb0js': {
      'en': 'Search',
      'fa': 'جستجو',
      'nl': '',
    },
    'n0cs6n6z': {
      'en': 'Title3',
      'fa': 'عنوان۳',
      'nl': '',
    },
    'h88a5tf5': {
      'en': 'Headline',
      'fa': 'تیتر',
      'nl': '',
    },
    'rw2ih3s4': {
      'en': 'Headline2',
      'fa': 'تیتر۲',
      'nl': '',
    },
    'hmubrdhh': {
      'en': '',
      'fa':
          'برای گرفتن عکس یا فیلم، این برنامه نیاز به اجازه دسترسی به دوربین دارد.',
      'nl':
          'Om een foto of video te kunnen maken, heeft deze app toestemming nodig om toegang te krijgen tot de camera.',
    },
    'vytmfyvk': {
      'en': '',
      'fa':
          'برای آپلود داده‌ها، این برنامه نیاز به اجازه دسترسی به کتابخانه عکس دارد.',
      'nl':
          'Om gegevens te kunnen uploaden, heeft deze app toestemming nodig om toegang te krijgen tot de fotobibliotheek.',
    },
    'qiets397': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    't346prrm': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '47cwmfra': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'bkzk0pzb': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'v3j12ef2': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '50mnjf3u': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '97f9hqh2': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'h6sangyj': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'bxg3335f': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'gnals2t1': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'oinkk0nb': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '8uj1a0jo': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'k6bh436e': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '559g1o1z': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'xr7mbqkh': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ft2472v6': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'mj6xv7lw': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'kefve5uc': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'd72qv7bu': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'fgjdu6a7': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'simsyf4s': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '33jz49ad': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '25nm38fm': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    '7e31vege': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'ju3vxdoi': {
      'en': '',
      'fa': '',
      'nl': '',
    },
    'v8tch3nt': {
      'en': '',
      'fa': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
