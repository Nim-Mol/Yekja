import '../database.dart';

class DetailsTicketSwapTable extends SupabaseTable<DetailsTicketSwapRow> {
  @override
  String get tableName => 'details_ticket_swap';

  @override
  DetailsTicketSwapRow createRow(Map<String, dynamic> data) =>
      DetailsTicketSwapRow(data);
}

class DetailsTicketSwapRow extends SupabaseDataRow {
  DetailsTicketSwapRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DetailsTicketSwapTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get intend => getField<String>('intend')!;
  set intend(String value) => setField<String>('intend', value);

  int get ticketsQty => getField<int>('tickets_qty')!;
  set ticketsQty(int value) => setField<int>('tickets_qty', value);

  String? get ticketType => getField<String>('ticket_type');
  set ticketType(String? value) => setField<String>('ticket_type', value);

  String? get section => getField<String>('section');
  set section(String? value) => setField<String>('section', value);

  String? get rowLabel => getField<String>('row_label');
  set rowLabel(String? value) => setField<String>('row_label', value);

  String? get seatNumbers => getField<String>('seat_numbers');
  set seatNumbers(String? value) => setField<String>('seat_numbers', value);

  DateTime? get eventDatetime => getField<DateTime>('event_datetime');
  set eventDatetime(DateTime? value) =>
      setField<DateTime>('event_datetime', value);

  String? get venueName => getField<String>('venue_name');
  set venueName(String? value) => setField<String>('venue_name', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  String? get priceText => getField<String>('price_text');
  set priceText(String? value) => setField<String>('price_text', value);

  bool get openForSwap => getField<bool>('open_for_swap')!;
  set openForSwap(bool value) => setField<bool>('open_for_swap', value);

  String? get wishlistText => getField<String>('wishlist_text');
  set wishlistText(String? value) => setField<String>('wishlist_text', value);
}
