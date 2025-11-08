// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostModelStruct extends BaseStruct {
  PostModelStruct({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ownerId,
    String? title,
    String? description,
    int? subCatId,
    String? subCatName,
    int? catId,
    String? catName,
    int? mainCatId,
    String? mainCatName,
    String? city,
    int? postLikes,
    bool? reported,
    List<String>? images,
    String? intend,
    int? price,
    bool? isNegotiable,
    String? condition,
    String? deliveryMethod,
    bool? openForSwap,
    String? wishlistText,
    int? ticketsQty,
    String? ticketType,
    DateTime? eventDatetime,
    String? venueName,
    String? currency,
    int? amount,
    bool? allowPartial,
    String? method,
    String? originCountry,
    String? originCity,
    String? destinationCountry,
    String? destinationCity,
    bool? isDocument,
    String? weightKg,
    String? dimensionsText,
    bool? isFragile,
    DateTime? travelDate,
    DateTime? deadline,
    String? rentalType,
    String? priceText,
    String? pricePeriod,
    int? deposit,
    String? depositText,
    DateTime? availableFrom,
    DateTime? availableUntil,
    bool? furnished,
    bool? utilitiesIncluded,
    bool? registrationPossible,
    String? compensationType,
    int? durationMin,
    DateTime? eventStartsAt,
    DateTime? eventEndsAt,
    DateTime? rsvpDeadline,
    bool? repeats,
    String? venueAddress,
    String? onlineUrl,
    int? capacity,
    int? totalArea,
    bool? allowCashAdjustment,
    String? repeatsText,
    int? nGoing,
    String? serviceMode,
    String? experienceYears,
    List<String>? languages,
    double? review,
    int? ratings,
  })  : _id = id,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _ownerId = ownerId,
        _title = title,
        _description = description,
        _subCatId = subCatId,
        _subCatName = subCatName,
        _catId = catId,
        _catName = catName,
        _mainCatId = mainCatId,
        _mainCatName = mainCatName,
        _city = city,
        _postLikes = postLikes,
        _reported = reported,
        _images = images,
        _intend = intend,
        _price = price,
        _isNegotiable = isNegotiable,
        _condition = condition,
        _deliveryMethod = deliveryMethod,
        _openForSwap = openForSwap,
        _wishlistText = wishlistText,
        _ticketsQty = ticketsQty,
        _ticketType = ticketType,
        _eventDatetime = eventDatetime,
        _venueName = venueName,
        _currency = currency,
        _amount = amount,
        _allowPartial = allowPartial,
        _method = method,
        _originCountry = originCountry,
        _originCity = originCity,
        _destinationCountry = destinationCountry,
        _destinationCity = destinationCity,
        _isDocument = isDocument,
        _weightKg = weightKg,
        _dimensionsText = dimensionsText,
        _isFragile = isFragile,
        _travelDate = travelDate,
        _deadline = deadline,
        _rentalType = rentalType,
        _priceText = priceText,
        _pricePeriod = pricePeriod,
        _deposit = deposit,
        _depositText = depositText,
        _availableFrom = availableFrom,
        _availableUntil = availableUntil,
        _furnished = furnished,
        _utilitiesIncluded = utilitiesIncluded,
        _registrationPossible = registrationPossible,
        _compensationType = compensationType,
        _durationMin = durationMin,
        _eventStartsAt = eventStartsAt,
        _eventEndsAt = eventEndsAt,
        _rsvpDeadline = rsvpDeadline,
        _repeats = repeats,
        _venueAddress = venueAddress,
        _onlineUrl = onlineUrl,
        _capacity = capacity,
        _totalArea = totalArea,
        _allowCashAdjustment = allowCashAdjustment,
        _repeatsText = repeatsText,
        _nGoing = nGoing,
        _serviceMode = serviceMode,
        _experienceYears = experienceYears,
        _languages = languages,
        _review = review,
        _ratings = ratings;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "sub_cat_id" field.
  int? _subCatId;
  int get subCatId => _subCatId ?? 0;
  set subCatId(int? val) => _subCatId = val;

  void incrementSubCatId(int amount) => subCatId = subCatId + amount;

  bool hasSubCatId() => _subCatId != null;

  // "sub_cat_name" field.
  String? _subCatName;
  String get subCatName => _subCatName ?? '';
  set subCatName(String? val) => _subCatName = val;

  bool hasSubCatName() => _subCatName != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  // "main_cat_id" field.
  int? _mainCatId;
  int get mainCatId => _mainCatId ?? 0;
  set mainCatId(int? val) => _mainCatId = val;

  void incrementMainCatId(int amount) => mainCatId = mainCatId + amount;

  bool hasMainCatId() => _mainCatId != null;

  // "main_cat_name" field.
  String? _mainCatName;
  String get mainCatName => _mainCatName ?? '';
  set mainCatName(String? val) => _mainCatName = val;

  bool hasMainCatName() => _mainCatName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "post_likes" field.
  int? _postLikes;
  int get postLikes => _postLikes ?? 0;
  set postLikes(int? val) => _postLikes = val;

  void incrementPostLikes(int amount) => postLikes = postLikes + amount;

  bool hasPostLikes() => _postLikes != null;

  // "reported" field.
  bool? _reported;
  bool get reported => _reported ?? false;
  set reported(bool? val) => _reported = val;

  bool hasReported() => _reported != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "intend" field.
  String? _intend;
  String get intend => _intend ?? '';
  set intend(String? val) => _intend = val;

  bool hasIntend() => _intend != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "is_negotiable" field.
  bool? _isNegotiable;
  bool get isNegotiable => _isNegotiable ?? false;
  set isNegotiable(bool? val) => _isNegotiable = val;

  bool hasIsNegotiable() => _isNegotiable != null;

  // "condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  set condition(String? val) => _condition = val;

  bool hasCondition() => _condition != null;

  // "delivery_method" field.
  String? _deliveryMethod;
  String get deliveryMethod => _deliveryMethod ?? '';
  set deliveryMethod(String? val) => _deliveryMethod = val;

  bool hasDeliveryMethod() => _deliveryMethod != null;

  // "open_for_swap" field.
  bool? _openForSwap;
  bool get openForSwap => _openForSwap ?? false;
  set openForSwap(bool? val) => _openForSwap = val;

  bool hasOpenForSwap() => _openForSwap != null;

  // "wishlist_text" field.
  String? _wishlistText;
  String get wishlistText => _wishlistText ?? '';
  set wishlistText(String? val) => _wishlistText = val;

  bool hasWishlistText() => _wishlistText != null;

  // "tickets_qty" field.
  int? _ticketsQty;
  int get ticketsQty => _ticketsQty ?? 0;
  set ticketsQty(int? val) => _ticketsQty = val;

  void incrementTicketsQty(int amount) => ticketsQty = ticketsQty + amount;

  bool hasTicketsQty() => _ticketsQty != null;

  // "ticket_type" field.
  String? _ticketType;
  String get ticketType => _ticketType ?? '';
  set ticketType(String? val) => _ticketType = val;

  bool hasTicketType() => _ticketType != null;

  // "event_datetime" field.
  DateTime? _eventDatetime;
  DateTime? get eventDatetime => _eventDatetime;
  set eventDatetime(DateTime? val) => _eventDatetime = val;

  bool hasEventDatetime() => _eventDatetime != null;

  // "venue_name" field.
  String? _venueName;
  String get venueName => _venueName ?? '';
  set venueName(String? val) => _venueName = val;

  bool hasVenueName() => _venueName != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "allow_partial" field.
  bool? _allowPartial;
  bool get allowPartial => _allowPartial ?? false;
  set allowPartial(bool? val) => _allowPartial = val;

  bool hasAllowPartial() => _allowPartial != null;

  // "method" field.
  String? _method;
  String get method => _method ?? '';
  set method(String? val) => _method = val;

  bool hasMethod() => _method != null;

  // "origin_country" field.
  String? _originCountry;
  String get originCountry => _originCountry ?? '';
  set originCountry(String? val) => _originCountry = val;

  bool hasOriginCountry() => _originCountry != null;

  // "origin_city" field.
  String? _originCity;
  String get originCity => _originCity ?? '';
  set originCity(String? val) => _originCity = val;

  bool hasOriginCity() => _originCity != null;

  // "destination_country" field.
  String? _destinationCountry;
  String get destinationCountry => _destinationCountry ?? '';
  set destinationCountry(String? val) => _destinationCountry = val;

  bool hasDestinationCountry() => _destinationCountry != null;

  // "destination_city" field.
  String? _destinationCity;
  String get destinationCity => _destinationCity ?? '';
  set destinationCity(String? val) => _destinationCity = val;

  bool hasDestinationCity() => _destinationCity != null;

  // "is_document" field.
  bool? _isDocument;
  bool get isDocument => _isDocument ?? false;
  set isDocument(bool? val) => _isDocument = val;

  bool hasIsDocument() => _isDocument != null;

  // "weight_kg" field.
  String? _weightKg;
  String get weightKg => _weightKg ?? '';
  set weightKg(String? val) => _weightKg = val;

  bool hasWeightKg() => _weightKg != null;

  // "dimensions_text" field.
  String? _dimensionsText;
  String get dimensionsText => _dimensionsText ?? '';
  set dimensionsText(String? val) => _dimensionsText = val;

  bool hasDimensionsText() => _dimensionsText != null;

  // "is_fragile" field.
  bool? _isFragile;
  bool get isFragile => _isFragile ?? false;
  set isFragile(bool? val) => _isFragile = val;

  bool hasIsFragile() => _isFragile != null;

  // "travel_date" field.
  DateTime? _travelDate;
  DateTime? get travelDate => _travelDate;
  set travelDate(DateTime? val) => _travelDate = val;

  bool hasTravelDate() => _travelDate != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  set deadline(DateTime? val) => _deadline = val;

  bool hasDeadline() => _deadline != null;

  // "rental_type" field.
  String? _rentalType;
  String get rentalType => _rentalType ?? '';
  set rentalType(String? val) => _rentalType = val;

  bool hasRentalType() => _rentalType != null;

  // "price_text" field.
  String? _priceText;
  String get priceText => _priceText ?? '';
  set priceText(String? val) => _priceText = val;

  bool hasPriceText() => _priceText != null;

  // "price_period" field.
  String? _pricePeriod;
  String get pricePeriod => _pricePeriod ?? '';
  set pricePeriod(String? val) => _pricePeriod = val;

  bool hasPricePeriod() => _pricePeriod != null;

  // "deposit" field.
  int? _deposit;
  int get deposit => _deposit ?? 0;
  set deposit(int? val) => _deposit = val;

  void incrementDeposit(int amount) => deposit = deposit + amount;

  bool hasDeposit() => _deposit != null;

  // "deposit_text" field.
  String? _depositText;
  String get depositText => _depositText ?? '';
  set depositText(String? val) => _depositText = val;

  bool hasDepositText() => _depositText != null;

  // "available_from" field.
  DateTime? _availableFrom;
  DateTime? get availableFrom => _availableFrom;
  set availableFrom(DateTime? val) => _availableFrom = val;

  bool hasAvailableFrom() => _availableFrom != null;

  // "available_until" field.
  DateTime? _availableUntil;
  DateTime? get availableUntil => _availableUntil;
  set availableUntil(DateTime? val) => _availableUntil = val;

  bool hasAvailableUntil() => _availableUntil != null;

  // "furnished" field.
  bool? _furnished;
  bool get furnished => _furnished ?? false;
  set furnished(bool? val) => _furnished = val;

  bool hasFurnished() => _furnished != null;

  // "utilities_included" field.
  bool? _utilitiesIncluded;
  bool get utilitiesIncluded => _utilitiesIncluded ?? false;
  set utilitiesIncluded(bool? val) => _utilitiesIncluded = val;

  bool hasUtilitiesIncluded() => _utilitiesIncluded != null;

  // "registration_possible" field.
  bool? _registrationPossible;
  bool get registrationPossible => _registrationPossible ?? false;
  set registrationPossible(bool? val) => _registrationPossible = val;

  bool hasRegistrationPossible() => _registrationPossible != null;

  // "compensation_type" field.
  String? _compensationType;
  String get compensationType => _compensationType ?? '';
  set compensationType(String? val) => _compensationType = val;

  bool hasCompensationType() => _compensationType != null;

  // "duration_min" field.
  int? _durationMin;
  int get durationMin => _durationMin ?? 0;
  set durationMin(int? val) => _durationMin = val;

  void incrementDurationMin(int amount) => durationMin = durationMin + amount;

  bool hasDurationMin() => _durationMin != null;

  // "event_starts_at" field.
  DateTime? _eventStartsAt;
  DateTime? get eventStartsAt => _eventStartsAt;
  set eventStartsAt(DateTime? val) => _eventStartsAt = val;

  bool hasEventStartsAt() => _eventStartsAt != null;

  // "event_ends_at" field.
  DateTime? _eventEndsAt;
  DateTime? get eventEndsAt => _eventEndsAt;
  set eventEndsAt(DateTime? val) => _eventEndsAt = val;

  bool hasEventEndsAt() => _eventEndsAt != null;

  // "rsvp_deadline" field.
  DateTime? _rsvpDeadline;
  DateTime? get rsvpDeadline => _rsvpDeadline;
  set rsvpDeadline(DateTime? val) => _rsvpDeadline = val;

  bool hasRsvpDeadline() => _rsvpDeadline != null;

  // "repeats" field.
  bool? _repeats;
  bool get repeats => _repeats ?? false;
  set repeats(bool? val) => _repeats = val;

  bool hasRepeats() => _repeats != null;

  // "venue_address" field.
  String? _venueAddress;
  String get venueAddress => _venueAddress ?? '';
  set venueAddress(String? val) => _venueAddress = val;

  bool hasVenueAddress() => _venueAddress != null;

  // "online_url" field.
  String? _onlineUrl;
  String get onlineUrl => _onlineUrl ?? '';
  set onlineUrl(String? val) => _onlineUrl = val;

  bool hasOnlineUrl() => _onlineUrl != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  set capacity(int? val) => _capacity = val;

  void incrementCapacity(int amount) => capacity = capacity + amount;

  bool hasCapacity() => _capacity != null;

  // "total_area" field.
  int? _totalArea;
  int get totalArea => _totalArea ?? 0;
  set totalArea(int? val) => _totalArea = val;

  void incrementTotalArea(int amount) => totalArea = totalArea + amount;

  bool hasTotalArea() => _totalArea != null;

  // "allow_cash_adjustment" field.
  bool? _allowCashAdjustment;
  bool get allowCashAdjustment => _allowCashAdjustment ?? true;
  set allowCashAdjustment(bool? val) => _allowCashAdjustment = val;

  bool hasAllowCashAdjustment() => _allowCashAdjustment != null;

  // "repeats_text" field.
  String? _repeatsText;
  String get repeatsText => _repeatsText ?? 'One-off';
  set repeatsText(String? val) => _repeatsText = val;

  bool hasRepeatsText() => _repeatsText != null;

  // "n_going" field.
  int? _nGoing;
  int get nGoing => _nGoing ?? 0;
  set nGoing(int? val) => _nGoing = val;

  void incrementNGoing(int amount) => nGoing = nGoing + amount;

  bool hasNGoing() => _nGoing != null;

  // "service_mode" field.
  String? _serviceMode;
  String get serviceMode => _serviceMode ?? '';
  set serviceMode(String? val) => _serviceMode = val;

  bool hasServiceMode() => _serviceMode != null;

  // "experience_years" field.
  String? _experienceYears;
  String get experienceYears => _experienceYears ?? '';
  set experienceYears(String? val) => _experienceYears = val;

  bool hasExperienceYears() => _experienceYears != null;

  // "languages" field.
  List<String>? _languages;
  List<String> get languages => _languages ?? const [];
  set languages(List<String>? val) => _languages = val;

  void updateLanguages(Function(List<String>) updateFn) {
    updateFn(_languages ??= []);
  }

  bool hasLanguages() => _languages != null;

  // "review" field.
  double? _review;
  double get review => _review ?? 0.0;
  set review(double? val) => _review = val;

  void incrementReview(double amount) => review = review + amount;

  bool hasReview() => _review != null;

  // "ratings" field.
  int? _ratings;
  int get ratings => _ratings ?? 0;
  set ratings(int? val) => _ratings = val;

  void incrementRatings(int amount) => ratings = ratings + amount;

  bool hasRatings() => _ratings != null;

  static PostModelStruct fromMap(Map<String, dynamic> data) => PostModelStruct(
        id: data['id'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        ownerId: data['owner_id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        subCatId: castToType<int>(data['sub_cat_id']),
        subCatName: data['sub_cat_name'] as String?,
        catId: castToType<int>(data['cat_id']),
        catName: data['cat_name'] as String?,
        mainCatId: castToType<int>(data['main_cat_id']),
        mainCatName: data['main_cat_name'] as String?,
        city: data['city'] as String?,
        postLikes: castToType<int>(data['post_likes']),
        reported: data['reported'] as bool?,
        images: getDataList(data['images']),
        intend: data['intend'] as String?,
        price: castToType<int>(data['price']),
        isNegotiable: data['is_negotiable'] as bool?,
        condition: data['condition'] as String?,
        deliveryMethod: data['delivery_method'] as String?,
        openForSwap: data['open_for_swap'] as bool?,
        wishlistText: data['wishlist_text'] as String?,
        ticketsQty: castToType<int>(data['tickets_qty']),
        ticketType: data['ticket_type'] as String?,
        eventDatetime: data['event_datetime'] as DateTime?,
        venueName: data['venue_name'] as String?,
        currency: data['currency'] as String?,
        amount: castToType<int>(data['amount']),
        allowPartial: data['allow_partial'] as bool?,
        method: data['method'] as String?,
        originCountry: data['origin_country'] as String?,
        originCity: data['origin_city'] as String?,
        destinationCountry: data['destination_country'] as String?,
        destinationCity: data['destination_city'] as String?,
        isDocument: data['is_document'] as bool?,
        weightKg: data['weight_kg'] as String?,
        dimensionsText: data['dimensions_text'] as String?,
        isFragile: data['is_fragile'] as bool?,
        travelDate: data['travel_date'] as DateTime?,
        deadline: data['deadline'] as DateTime?,
        rentalType: data['rental_type'] as String?,
        priceText: data['price_text'] as String?,
        pricePeriod: data['price_period'] as String?,
        deposit: castToType<int>(data['deposit']),
        depositText: data['deposit_text'] as String?,
        availableFrom: data['available_from'] as DateTime?,
        availableUntil: data['available_until'] as DateTime?,
        furnished: data['furnished'] as bool?,
        utilitiesIncluded: data['utilities_included'] as bool?,
        registrationPossible: data['registration_possible'] as bool?,
        compensationType: data['compensation_type'] as String?,
        durationMin: castToType<int>(data['duration_min']),
        eventStartsAt: data['event_starts_at'] as DateTime?,
        eventEndsAt: data['event_ends_at'] as DateTime?,
        rsvpDeadline: data['rsvp_deadline'] as DateTime?,
        repeats: data['repeats'] as bool?,
        venueAddress: data['venue_address'] as String?,
        onlineUrl: data['online_url'] as String?,
        capacity: castToType<int>(data['capacity']),
        totalArea: castToType<int>(data['total_area']),
        allowCashAdjustment: data['allow_cash_adjustment'] as bool?,
        repeatsText: data['repeats_text'] as String?,
        nGoing: castToType<int>(data['n_going']),
        serviceMode: data['service_mode'] as String?,
        experienceYears: data['experience_years'] as String?,
        languages: getDataList(data['languages']),
        review: castToType<double>(data['review']),
        ratings: castToType<int>(data['ratings']),
      );

  static PostModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PostModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'owner_id': _ownerId,
        'title': _title,
        'description': _description,
        'sub_cat_id': _subCatId,
        'sub_cat_name': _subCatName,
        'cat_id': _catId,
        'cat_name': _catName,
        'main_cat_id': _mainCatId,
        'main_cat_name': _mainCatName,
        'city': _city,
        'post_likes': _postLikes,
        'reported': _reported,
        'images': _images,
        'intend': _intend,
        'price': _price,
        'is_negotiable': _isNegotiable,
        'condition': _condition,
        'delivery_method': _deliveryMethod,
        'open_for_swap': _openForSwap,
        'wishlist_text': _wishlistText,
        'tickets_qty': _ticketsQty,
        'ticket_type': _ticketType,
        'event_datetime': _eventDatetime,
        'venue_name': _venueName,
        'currency': _currency,
        'amount': _amount,
        'allow_partial': _allowPartial,
        'method': _method,
        'origin_country': _originCountry,
        'origin_city': _originCity,
        'destination_country': _destinationCountry,
        'destination_city': _destinationCity,
        'is_document': _isDocument,
        'weight_kg': _weightKg,
        'dimensions_text': _dimensionsText,
        'is_fragile': _isFragile,
        'travel_date': _travelDate,
        'deadline': _deadline,
        'rental_type': _rentalType,
        'price_text': _priceText,
        'price_period': _pricePeriod,
        'deposit': _deposit,
        'deposit_text': _depositText,
        'available_from': _availableFrom,
        'available_until': _availableUntil,
        'furnished': _furnished,
        'utilities_included': _utilitiesIncluded,
        'registration_possible': _registrationPossible,
        'compensation_type': _compensationType,
        'duration_min': _durationMin,
        'event_starts_at': _eventStartsAt,
        'event_ends_at': _eventEndsAt,
        'rsvp_deadline': _rsvpDeadline,
        'repeats': _repeats,
        'venue_address': _venueAddress,
        'online_url': _onlineUrl,
        'capacity': _capacity,
        'total_area': _totalArea,
        'allow_cash_adjustment': _allowCashAdjustment,
        'repeats_text': _repeatsText,
        'n_going': _nGoing,
        'service_mode': _serviceMode,
        'experience_years': _experienceYears,
        'languages': _languages,
        'review': _review,
        'ratings': _ratings,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'owner_id': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'sub_cat_id': serializeParam(
          _subCatId,
          ParamType.int,
        ),
        'sub_cat_name': serializeParam(
          _subCatName,
          ParamType.String,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
        'cat_name': serializeParam(
          _catName,
          ParamType.String,
        ),
        'main_cat_id': serializeParam(
          _mainCatId,
          ParamType.int,
        ),
        'main_cat_name': serializeParam(
          _mainCatName,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'post_likes': serializeParam(
          _postLikes,
          ParamType.int,
        ),
        'reported': serializeParam(
          _reported,
          ParamType.bool,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'intend': serializeParam(
          _intend,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'is_negotiable': serializeParam(
          _isNegotiable,
          ParamType.bool,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.String,
        ),
        'delivery_method': serializeParam(
          _deliveryMethod,
          ParamType.String,
        ),
        'open_for_swap': serializeParam(
          _openForSwap,
          ParamType.bool,
        ),
        'wishlist_text': serializeParam(
          _wishlistText,
          ParamType.String,
        ),
        'tickets_qty': serializeParam(
          _ticketsQty,
          ParamType.int,
        ),
        'ticket_type': serializeParam(
          _ticketType,
          ParamType.String,
        ),
        'event_datetime': serializeParam(
          _eventDatetime,
          ParamType.DateTime,
        ),
        'venue_name': serializeParam(
          _venueName,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'allow_partial': serializeParam(
          _allowPartial,
          ParamType.bool,
        ),
        'method': serializeParam(
          _method,
          ParamType.String,
        ),
        'origin_country': serializeParam(
          _originCountry,
          ParamType.String,
        ),
        'origin_city': serializeParam(
          _originCity,
          ParamType.String,
        ),
        'destination_country': serializeParam(
          _destinationCountry,
          ParamType.String,
        ),
        'destination_city': serializeParam(
          _destinationCity,
          ParamType.String,
        ),
        'is_document': serializeParam(
          _isDocument,
          ParamType.bool,
        ),
        'weight_kg': serializeParam(
          _weightKg,
          ParamType.String,
        ),
        'dimensions_text': serializeParam(
          _dimensionsText,
          ParamType.String,
        ),
        'is_fragile': serializeParam(
          _isFragile,
          ParamType.bool,
        ),
        'travel_date': serializeParam(
          _travelDate,
          ParamType.DateTime,
        ),
        'deadline': serializeParam(
          _deadline,
          ParamType.DateTime,
        ),
        'rental_type': serializeParam(
          _rentalType,
          ParamType.String,
        ),
        'price_text': serializeParam(
          _priceText,
          ParamType.String,
        ),
        'price_period': serializeParam(
          _pricePeriod,
          ParamType.String,
        ),
        'deposit': serializeParam(
          _deposit,
          ParamType.int,
        ),
        'deposit_text': serializeParam(
          _depositText,
          ParamType.String,
        ),
        'available_from': serializeParam(
          _availableFrom,
          ParamType.DateTime,
        ),
        'available_until': serializeParam(
          _availableUntil,
          ParamType.DateTime,
        ),
        'furnished': serializeParam(
          _furnished,
          ParamType.bool,
        ),
        'utilities_included': serializeParam(
          _utilitiesIncluded,
          ParamType.bool,
        ),
        'registration_possible': serializeParam(
          _registrationPossible,
          ParamType.bool,
        ),
        'compensation_type': serializeParam(
          _compensationType,
          ParamType.String,
        ),
        'duration_min': serializeParam(
          _durationMin,
          ParamType.int,
        ),
        'event_starts_at': serializeParam(
          _eventStartsAt,
          ParamType.DateTime,
        ),
        'event_ends_at': serializeParam(
          _eventEndsAt,
          ParamType.DateTime,
        ),
        'rsvp_deadline': serializeParam(
          _rsvpDeadline,
          ParamType.DateTime,
        ),
        'repeats': serializeParam(
          _repeats,
          ParamType.bool,
        ),
        'venue_address': serializeParam(
          _venueAddress,
          ParamType.String,
        ),
        'online_url': serializeParam(
          _onlineUrl,
          ParamType.String,
        ),
        'capacity': serializeParam(
          _capacity,
          ParamType.int,
        ),
        'total_area': serializeParam(
          _totalArea,
          ParamType.int,
        ),
        'allow_cash_adjustment': serializeParam(
          _allowCashAdjustment,
          ParamType.bool,
        ),
        'repeats_text': serializeParam(
          _repeatsText,
          ParamType.String,
        ),
        'n_going': serializeParam(
          _nGoing,
          ParamType.int,
        ),
        'service_mode': serializeParam(
          _serviceMode,
          ParamType.String,
        ),
        'experience_years': serializeParam(
          _experienceYears,
          ParamType.String,
        ),
        'languages': serializeParam(
          _languages,
          ParamType.String,
          isList: true,
        ),
        'review': serializeParam(
          _review,
          ParamType.double,
        ),
        'ratings': serializeParam(
          _ratings,
          ParamType.int,
        ),
      }.withoutNulls;

  static PostModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        ownerId: deserializeParam(
          data['owner_id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        subCatId: deserializeParam(
          data['sub_cat_id'],
          ParamType.int,
          false,
        ),
        subCatName: deserializeParam(
          data['sub_cat_name'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
        catName: deserializeParam(
          data['cat_name'],
          ParamType.String,
          false,
        ),
        mainCatId: deserializeParam(
          data['main_cat_id'],
          ParamType.int,
          false,
        ),
        mainCatName: deserializeParam(
          data['main_cat_name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        postLikes: deserializeParam(
          data['post_likes'],
          ParamType.int,
          false,
        ),
        reported: deserializeParam(
          data['reported'],
          ParamType.bool,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        intend: deserializeParam(
          data['intend'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        isNegotiable: deserializeParam(
          data['is_negotiable'],
          ParamType.bool,
          false,
        ),
        condition: deserializeParam(
          data['condition'],
          ParamType.String,
          false,
        ),
        deliveryMethod: deserializeParam(
          data['delivery_method'],
          ParamType.String,
          false,
        ),
        openForSwap: deserializeParam(
          data['open_for_swap'],
          ParamType.bool,
          false,
        ),
        wishlistText: deserializeParam(
          data['wishlist_text'],
          ParamType.String,
          false,
        ),
        ticketsQty: deserializeParam(
          data['tickets_qty'],
          ParamType.int,
          false,
        ),
        ticketType: deserializeParam(
          data['ticket_type'],
          ParamType.String,
          false,
        ),
        eventDatetime: deserializeParam(
          data['event_datetime'],
          ParamType.DateTime,
          false,
        ),
        venueName: deserializeParam(
          data['venue_name'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        allowPartial: deserializeParam(
          data['allow_partial'],
          ParamType.bool,
          false,
        ),
        method: deserializeParam(
          data['method'],
          ParamType.String,
          false,
        ),
        originCountry: deserializeParam(
          data['origin_country'],
          ParamType.String,
          false,
        ),
        originCity: deserializeParam(
          data['origin_city'],
          ParamType.String,
          false,
        ),
        destinationCountry: deserializeParam(
          data['destination_country'],
          ParamType.String,
          false,
        ),
        destinationCity: deserializeParam(
          data['destination_city'],
          ParamType.String,
          false,
        ),
        isDocument: deserializeParam(
          data['is_document'],
          ParamType.bool,
          false,
        ),
        weightKg: deserializeParam(
          data['weight_kg'],
          ParamType.String,
          false,
        ),
        dimensionsText: deserializeParam(
          data['dimensions_text'],
          ParamType.String,
          false,
        ),
        isFragile: deserializeParam(
          data['is_fragile'],
          ParamType.bool,
          false,
        ),
        travelDate: deserializeParam(
          data['travel_date'],
          ParamType.DateTime,
          false,
        ),
        deadline: deserializeParam(
          data['deadline'],
          ParamType.DateTime,
          false,
        ),
        rentalType: deserializeParam(
          data['rental_type'],
          ParamType.String,
          false,
        ),
        priceText: deserializeParam(
          data['price_text'],
          ParamType.String,
          false,
        ),
        pricePeriod: deserializeParam(
          data['price_period'],
          ParamType.String,
          false,
        ),
        deposit: deserializeParam(
          data['deposit'],
          ParamType.int,
          false,
        ),
        depositText: deserializeParam(
          data['deposit_text'],
          ParamType.String,
          false,
        ),
        availableFrom: deserializeParam(
          data['available_from'],
          ParamType.DateTime,
          false,
        ),
        availableUntil: deserializeParam(
          data['available_until'],
          ParamType.DateTime,
          false,
        ),
        furnished: deserializeParam(
          data['furnished'],
          ParamType.bool,
          false,
        ),
        utilitiesIncluded: deserializeParam(
          data['utilities_included'],
          ParamType.bool,
          false,
        ),
        registrationPossible: deserializeParam(
          data['registration_possible'],
          ParamType.bool,
          false,
        ),
        compensationType: deserializeParam(
          data['compensation_type'],
          ParamType.String,
          false,
        ),
        durationMin: deserializeParam(
          data['duration_min'],
          ParamType.int,
          false,
        ),
        eventStartsAt: deserializeParam(
          data['event_starts_at'],
          ParamType.DateTime,
          false,
        ),
        eventEndsAt: deserializeParam(
          data['event_ends_at'],
          ParamType.DateTime,
          false,
        ),
        rsvpDeadline: deserializeParam(
          data['rsvp_deadline'],
          ParamType.DateTime,
          false,
        ),
        repeats: deserializeParam(
          data['repeats'],
          ParamType.bool,
          false,
        ),
        venueAddress: deserializeParam(
          data['venue_address'],
          ParamType.String,
          false,
        ),
        onlineUrl: deserializeParam(
          data['online_url'],
          ParamType.String,
          false,
        ),
        capacity: deserializeParam(
          data['capacity'],
          ParamType.int,
          false,
        ),
        totalArea: deserializeParam(
          data['total_area'],
          ParamType.int,
          false,
        ),
        allowCashAdjustment: deserializeParam(
          data['allow_cash_adjustment'],
          ParamType.bool,
          false,
        ),
        repeatsText: deserializeParam(
          data['repeats_text'],
          ParamType.String,
          false,
        ),
        nGoing: deserializeParam(
          data['n_going'],
          ParamType.int,
          false,
        ),
        serviceMode: deserializeParam(
          data['service_mode'],
          ParamType.String,
          false,
        ),
        experienceYears: deserializeParam(
          data['experience_years'],
          ParamType.String,
          false,
        ),
        languages: deserializeParam<String>(
          data['languages'],
          ParamType.String,
          true,
        ),
        review: deserializeParam(
          data['review'],
          ParamType.double,
          false,
        ),
        ratings: deserializeParam(
          data['ratings'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PostModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostModelStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        ownerId == other.ownerId &&
        title == other.title &&
        description == other.description &&
        subCatId == other.subCatId &&
        subCatName == other.subCatName &&
        catId == other.catId &&
        catName == other.catName &&
        mainCatId == other.mainCatId &&
        mainCatName == other.mainCatName &&
        city == other.city &&
        postLikes == other.postLikes &&
        reported == other.reported &&
        listEquality.equals(images, other.images) &&
        intend == other.intend &&
        price == other.price &&
        isNegotiable == other.isNegotiable &&
        condition == other.condition &&
        deliveryMethod == other.deliveryMethod &&
        openForSwap == other.openForSwap &&
        wishlistText == other.wishlistText &&
        ticketsQty == other.ticketsQty &&
        ticketType == other.ticketType &&
        eventDatetime == other.eventDatetime &&
        venueName == other.venueName &&
        currency == other.currency &&
        amount == other.amount &&
        allowPartial == other.allowPartial &&
        method == other.method &&
        originCountry == other.originCountry &&
        originCity == other.originCity &&
        destinationCountry == other.destinationCountry &&
        destinationCity == other.destinationCity &&
        isDocument == other.isDocument &&
        weightKg == other.weightKg &&
        dimensionsText == other.dimensionsText &&
        isFragile == other.isFragile &&
        travelDate == other.travelDate &&
        deadline == other.deadline &&
        rentalType == other.rentalType &&
        priceText == other.priceText &&
        pricePeriod == other.pricePeriod &&
        deposit == other.deposit &&
        depositText == other.depositText &&
        availableFrom == other.availableFrom &&
        availableUntil == other.availableUntil &&
        furnished == other.furnished &&
        utilitiesIncluded == other.utilitiesIncluded &&
        registrationPossible == other.registrationPossible &&
        compensationType == other.compensationType &&
        durationMin == other.durationMin &&
        eventStartsAt == other.eventStartsAt &&
        eventEndsAt == other.eventEndsAt &&
        rsvpDeadline == other.rsvpDeadline &&
        repeats == other.repeats &&
        venueAddress == other.venueAddress &&
        onlineUrl == other.onlineUrl &&
        capacity == other.capacity &&
        totalArea == other.totalArea &&
        allowCashAdjustment == other.allowCashAdjustment &&
        repeatsText == other.repeatsText &&
        nGoing == other.nGoing &&
        serviceMode == other.serviceMode &&
        experienceYears == other.experienceYears &&
        listEquality.equals(languages, other.languages) &&
        review == other.review &&
        ratings == other.ratings;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        updatedAt,
        ownerId,
        title,
        description,
        subCatId,
        subCatName,
        catId,
        catName,
        mainCatId,
        mainCatName,
        city,
        postLikes,
        reported,
        images,
        intend,
        price,
        isNegotiable,
        condition,
        deliveryMethod,
        openForSwap,
        wishlistText,
        ticketsQty,
        ticketType,
        eventDatetime,
        venueName,
        currency,
        amount,
        allowPartial,
        method,
        originCountry,
        originCity,
        destinationCountry,
        destinationCity,
        isDocument,
        weightKg,
        dimensionsText,
        isFragile,
        travelDate,
        deadline,
        rentalType,
        priceText,
        pricePeriod,
        deposit,
        depositText,
        availableFrom,
        availableUntil,
        furnished,
        utilitiesIncluded,
        registrationPossible,
        compensationType,
        durationMin,
        eventStartsAt,
        eventEndsAt,
        rsvpDeadline,
        repeats,
        venueAddress,
        onlineUrl,
        capacity,
        totalArea,
        allowCashAdjustment,
        repeatsText,
        nGoing,
        serviceMode,
        experienceYears,
        languages,
        review,
        ratings
      ]);
}

PostModelStruct createPostModelStruct({
  String? id,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? ownerId,
  String? title,
  String? description,
  int? subCatId,
  String? subCatName,
  int? catId,
  String? catName,
  int? mainCatId,
  String? mainCatName,
  String? city,
  int? postLikes,
  bool? reported,
  String? intend,
  int? price,
  bool? isNegotiable,
  String? condition,
  String? deliveryMethod,
  bool? openForSwap,
  String? wishlistText,
  int? ticketsQty,
  String? ticketType,
  DateTime? eventDatetime,
  String? venueName,
  String? currency,
  int? amount,
  bool? allowPartial,
  String? method,
  String? originCountry,
  String? originCity,
  String? destinationCountry,
  String? destinationCity,
  bool? isDocument,
  String? weightKg,
  String? dimensionsText,
  bool? isFragile,
  DateTime? travelDate,
  DateTime? deadline,
  String? rentalType,
  String? priceText,
  String? pricePeriod,
  int? deposit,
  String? depositText,
  DateTime? availableFrom,
  DateTime? availableUntil,
  bool? furnished,
  bool? utilitiesIncluded,
  bool? registrationPossible,
  String? compensationType,
  int? durationMin,
  DateTime? eventStartsAt,
  DateTime? eventEndsAt,
  DateTime? rsvpDeadline,
  bool? repeats,
  String? venueAddress,
  String? onlineUrl,
  int? capacity,
  int? totalArea,
  bool? allowCashAdjustment,
  String? repeatsText,
  int? nGoing,
  String? serviceMode,
  String? experienceYears,
  double? review,
  int? ratings,
}) =>
    PostModelStruct(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      ownerId: ownerId,
      title: title,
      description: description,
      subCatId: subCatId,
      subCatName: subCatName,
      catId: catId,
      catName: catName,
      mainCatId: mainCatId,
      mainCatName: mainCatName,
      city: city,
      postLikes: postLikes,
      reported: reported,
      intend: intend,
      price: price,
      isNegotiable: isNegotiable,
      condition: condition,
      deliveryMethod: deliveryMethod,
      openForSwap: openForSwap,
      wishlistText: wishlistText,
      ticketsQty: ticketsQty,
      ticketType: ticketType,
      eventDatetime: eventDatetime,
      venueName: venueName,
      currency: currency,
      amount: amount,
      allowPartial: allowPartial,
      method: method,
      originCountry: originCountry,
      originCity: originCity,
      destinationCountry: destinationCountry,
      destinationCity: destinationCity,
      isDocument: isDocument,
      weightKg: weightKg,
      dimensionsText: dimensionsText,
      isFragile: isFragile,
      travelDate: travelDate,
      deadline: deadline,
      rentalType: rentalType,
      priceText: priceText,
      pricePeriod: pricePeriod,
      deposit: deposit,
      depositText: depositText,
      availableFrom: availableFrom,
      availableUntil: availableUntil,
      furnished: furnished,
      utilitiesIncluded: utilitiesIncluded,
      registrationPossible: registrationPossible,
      compensationType: compensationType,
      durationMin: durationMin,
      eventStartsAt: eventStartsAt,
      eventEndsAt: eventEndsAt,
      rsvpDeadline: rsvpDeadline,
      repeats: repeats,
      venueAddress: venueAddress,
      onlineUrl: onlineUrl,
      capacity: capacity,
      totalArea: totalArea,
      allowCashAdjustment: allowCashAdjustment,
      repeatsText: repeatsText,
      nGoing: nGoing,
      serviceMode: serviceMode,
      experienceYears: experienceYears,
      review: review,
      ratings: ratings,
    );
