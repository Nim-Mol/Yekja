import '../database.dart';

class PostCreateMuxTblTable extends SupabaseTable<PostCreateMuxTblRow> {
  @override
  String get tableName => 'post_create_mux_tbl';

  @override
  PostCreateMuxTblRow createRow(Map<String, dynamic> data) =>
      PostCreateMuxTblRow(data);
}

class PostCreateMuxTblRow extends SupabaseDataRow {
  PostCreateMuxTblRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostCreateMuxTblTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get subCatId => getField<int>('sub_cat_id');
  set subCatId(int? value) => setField<int>('sub_cat_id', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String get detailTable => getField<String>('detail_table')!;
  set detailTable(String value) => setField<String>('detail_table', value);

  dynamic get details => getField<dynamic>('details');
  set details(dynamic value) => setField<dynamic>('details', value);
}
