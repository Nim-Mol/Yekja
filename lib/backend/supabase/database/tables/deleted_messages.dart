import '../database.dart';

class DeletedMessagesTable extends SupabaseTable<DeletedMessagesRow> {
  @override
  String get tableName => 'deleted_messages';

  @override
  DeletedMessagesRow createRow(Map<String, dynamic> data) =>
      DeletedMessagesRow(data);
}

class DeletedMessagesRow extends SupabaseDataRow {
  DeletedMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeletedMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get chatId => getField<int>('chat_id')!;
  set chatId(int value) => setField<int>('chat_id', value);

  String? get messageText => getField<String>('message_text');
  set messageText(String? value) => setField<String>('message_text', value);

  String? get sentBy => getField<String>('sentBy');
  set sentBy(String? value) => setField<String>('sentBy', value);

  bool get isImg => getField<bool>('is_img')!;
  set isImg(bool value) => setField<bool>('is_img', value);

  String? get imgMessage => getField<String>('img_message');
  set imgMessage(String? value) => setField<String>('img_message', value);

  bool get seen => getField<bool>('seen')!;
  set seen(bool value) => setField<bool>('seen', value);

  bool get userOnline => getField<bool>('userOnline')!;
  set userOnline(bool value) => setField<bool>('userOnline', value);

  String get recipient => getField<String>('recipient')!;
  set recipient(String value) => setField<String>('recipient', value);

  bool get isReview => getField<bool>('is_review')!;
  set isReview(bool value) => setField<bool>('is_review', value);

  bool? get postOwnerReviewSubmited =>
      getField<bool>('post_owner_Review_submited');
  set postOwnerReviewSubmited(bool? value) =>
      setField<bool>('post_owner_Review_submited', value);

  bool? get customerReviewSubmited =>
      getField<bool>('customer_Review_submited');
  set customerReviewSubmited(bool? value) =>
      setField<bool>('customer_Review_submited', value);

  bool? get postOwnerReviewSent => getField<bool>('post_owner_Review_sent');
  set postOwnerReviewSent(bool? value) =>
      setField<bool>('post_owner_Review_sent', value);

  bool? get customerReviewSent => getField<bool>('customer_Review_sent');
  set customerReviewSent(bool? value) =>
      setField<bool>('customer_Review_sent', value);

  DateTime get deletedAt => getField<DateTime>('deleted_at')!;
  set deletedAt(DateTime value) => setField<DateTime>('deleted_at', value);
}
