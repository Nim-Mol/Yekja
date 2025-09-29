import '../database.dart';

class MarketLikesTable extends SupabaseTable<MarketLikesRow> {
  @override
  String get tableName => 'market_likes';

  @override
  MarketLikesRow createRow(Map<String, dynamic> data) => MarketLikesRow(data);
}

class MarketLikesRow extends SupabaseDataRow {
  MarketLikesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarketLikesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);
}
