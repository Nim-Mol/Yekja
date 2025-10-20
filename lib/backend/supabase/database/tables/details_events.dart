import '../database.dart';

class DetailsEventsTable extends SupabaseTable<DetailsEventsRow> {
  @override
  String get tableName => 'details_events';

  @override
  DetailsEventsRow createRow(Map<String, dynamic> data) =>
      DetailsEventsRow(data);
}

class DetailsEventsRow extends SupabaseDataRow {
  DetailsEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsEventsTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String? get intend => getField<String>('intend');
  set intend(String? value) => setField<String>('intend', value);

  DateTime get eventStartsAt => getField<DateTime>('event_starts_at')!;
  set eventStartsAt(DateTime value) =>
      setField<DateTime>('event_starts_at', value);

  DateTime? get eventEndsAt => getField<DateTime>('event_ends_at');
  set eventEndsAt(DateTime? value) =>
      setField<DateTime>('event_ends_at', value);

  DateTime? get rsvpDeadline => getField<DateTime>('rsvp_deadline');
  set rsvpDeadline(DateTime? value) =>
      setField<DateTime>('rsvp_deadline', value);

  String? get repeats => getField<String>('repeats');
  set repeats(String? value) => setField<String>('repeats', value);

  String? get locationMode => getField<String>('location_mode');
  set locationMode(String? value) => setField<String>('location_mode', value);

  String? get venueName => getField<String>('venue_name');
  set venueName(String? value) => setField<String>('venue_name', value);

  String? get venueAddress => getField<String>('venue_address');
  set venueAddress(String? value) => setField<String>('venue_address', value);

  String? get onlineUrl => getField<String>('online_url');
  set onlineUrl(String? value) => setField<String>('online_url', value);

  String? get externalUrl => getField<String>('external_url');
  set externalUrl(String? value) => setField<String>('external_url', value);

  int? get capacity => getField<int>('capacity');
  set capacity(int? value) => setField<int>('capacity', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  String? get compensationType => getField<String>('compensation_type');
  set compensationType(String? value) =>
      setField<String>('compensation_type', value);
}
