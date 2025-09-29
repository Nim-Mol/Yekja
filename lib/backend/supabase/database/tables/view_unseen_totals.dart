import '../database.dart';

class ViewUnseenTotalsTable extends SupabaseTable<ViewUnseenTotalsRow> {
  @override
  String get tableName => 'view_unseen_totals';

  @override
  ViewUnseenTotalsRow createRow(Map<String, dynamic> data) =>
      ViewUnseenTotalsRow(data);
}

class ViewUnseenTotalsRow extends SupabaseDataRow {
  ViewUnseenTotalsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUnseenTotalsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get unseenMessages => getField<int>('unseen_messages');
  set unseenMessages(int? value) => setField<int>('unseen_messages', value);

  int? get chatsWithUnseen => getField<int>('chats_with_unseen');
  set chatsWithUnseen(int? value) => setField<int>('chats_with_unseen', value);
}
