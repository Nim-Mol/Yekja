import '../database.dart';

class NewsTable extends SupabaseTable<NewsRow> {
  @override
  String get tableName => 'news';

  @override
  NewsRow createRow(Map<String, dynamic> data) => NewsRow(data);
}

class NewsRow extends SupabaseDataRow {
  NewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get headerFrontEn => getField<String>('header_front_en');
  set headerFrontEn(String? value) =>
      setField<String>('header_front_en', value);

  String? get headerFrontNl => getField<String>('header_front_nl');
  set headerFrontNl(String? value) =>
      setField<String>('header_front_nl', value);

  String? get headerFrontFa => getField<String>('header_front_fa');
  set headerFrontFa(String? value) =>
      setField<String>('header_front_fa', value);

  String? get hintFrontEn => getField<String>('hint_front_en');
  set hintFrontEn(String? value) => setField<String>('hint_front_en', value);

  String? get hintFrontNl => getField<String>('hint_front_nl');
  set hintFrontNl(String? value) => setField<String>('hint_front_nl', value);

  String? get hintFrontFa => getField<String>('hint_front_fa');
  set hintFrontFa(String? value) => setField<String>('hint_front_fa', value);

  String? get headerBackEn => getField<String>('header_back_en');
  set headerBackEn(String? value) => setField<String>('header_back_en', value);

  String? get headerBackNl => getField<String>('header_back_nl');
  set headerBackNl(String? value) => setField<String>('header_back_nl', value);

  String? get headerBackFa => getField<String>('header_back_fa');
  set headerBackFa(String? value) => setField<String>('header_back_fa', value);

  String? get hintBackEn => getField<String>('hint_back_en');
  set hintBackEn(String? value) => setField<String>('hint_back_en', value);

  String? get hintBackNl => getField<String>('hint_back_nl');
  set hintBackNl(String? value) => setField<String>('hint_back_nl', value);

  String? get hintBackFa => getField<String>('hint_back_fa');
  set hintBackFa(String? value) => setField<String>('hint_back_fa', value);

  String? get actionTextEn => getField<String>('action_text_en');
  set actionTextEn(String? value) => setField<String>('action_text_en', value);

  String? get actionTextNl => getField<String>('action_text_nl');
  set actionTextNl(String? value) => setField<String>('action_text_nl', value);

  String? get actionTextFa => getField<String>('action_text_fa');
  set actionTextFa(String? value) => setField<String>('action_text_fa', value);

  String? get imageFront => getField<String>('image_front');
  set imageFront(String? value) => setField<String>('image_front', value);

  String? get imageBack => getField<String>('image_back');
  set imageBack(String? value) => setField<String>('image_back', value);

  String? get imageBackground => getField<String>('image_background');
  set imageBackground(String? value) =>
      setField<String>('image_background', value);

  int? get imageX => getField<int>('image_x');
  set imageX(int? value) => setField<int>('image_x', value);

  int? get imageY => getField<int>('image_y');
  set imageY(int? value) => setField<int>('image_y', value);

  int get headerSize => getField<int>('header_size')!;
  set headerSize(int value) => setField<int>('header_size', value);

  int get hintSize => getField<int>('hint_size')!;
  set hintSize(int value) => setField<int>('hint_size', value);

  String? get headerFontFamily => getField<String>('header_font_family');
  set headerFontFamily(String? value) =>
      setField<String>('header_font_family', value);

  String? get hintFontFamily => getField<String>('hint_font_family');
  set hintFontFamily(String? value) =>
      setField<String>('hint_font_family', value);
}
