import '../database.dart';

class ViewUserChatsTable extends SupabaseTable<ViewUserChatsRow> {
  @override
  String get tableName => 'view_user_chats';

  @override
  ViewUserChatsRow createRow(Map<String, dynamic> data) =>
      ViewUserChatsRow(data);
}

class ViewUserChatsRow extends SupabaseDataRow {
  ViewUserChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserChatsTable();

  int? get chatId => getField<int>('chat_id');
  set chatId(int? value) => setField<int>('chat_id', value);

  DateTime? get chatCreatedAt => getField<DateTime>('chat_created_at');
  set chatCreatedAt(DateTime? value) =>
      setField<DateTime>('chat_created_at', value);

  String? get chatSender => getField<String>('chat_sender');
  set chatSender(String? value) => setField<String>('chat_sender', value);

  String? get chatRecipient => getField<String>('chat_recipient');
  set chatRecipient(String? value) => setField<String>('chat_recipient', value);

  String? get chatPostId => getField<String>('chat_post_id');
  set chatPostId(String? value) => setField<String>('chat_post_id', value);

  String? get chatSendername => getField<String>('chat_sendername');
  set chatSendername(String? value) =>
      setField<String>('chat_sendername', value);

  String? get postOwnerId => getField<String>('post_owner_id');
  set postOwnerId(String? value) => setField<String>('post_owner_id', value);

  String? get senderAvatar => getField<String>('sender_avatar');
  set senderAvatar(String? value) => setField<String>('sender_avatar', value);

  String? get ownerUsername => getField<String>('owner_username');
  set ownerUsername(String? value) => setField<String>('owner_username', value);

  String? get ownerAvatar => getField<String>('owner_avatar');
  set ownerAvatar(String? value) => setField<String>('owner_avatar', value);

  int? get unseenCount => getField<int>('unseen_count');
  set unseenCount(int? value) => setField<int>('unseen_count', value);

  String? get postImage => getField<String>('post_image');
  set postImage(String? value) => setField<String>('post_image', value);

  String? get postTitle => getField<String>('post_title');
  set postTitle(String? value) => setField<String>('post_title', value);
}
