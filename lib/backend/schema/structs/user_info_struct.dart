// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    String? userId,
    String? userName,
    String? name,
    String? lastName,
    String? avatar,
    String? city,
    List<String>? userFavs,
    List<String>? reportedList,
    int? unseenChats,
    int? unseenMessages,
    String? role,
  })  : _userId = userId,
        _userName = userName,
        _name = name,
        _lastName = lastName,
        _avatar = avatar,
        _city = city,
        _userFavs = userFavs,
        _reportedList = reportedList,
        _unseenChats = unseenChats,
        _unseenMessages = unseenMessages,
        _role = role;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "Avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "userFavs" field.
  List<String>? _userFavs;
  List<String> get userFavs => _userFavs ?? const [];
  set userFavs(List<String>? val) => _userFavs = val;

  void updateUserFavs(Function(List<String>) updateFn) {
    updateFn(_userFavs ??= []);
  }

  bool hasUserFavs() => _userFavs != null;

  // "reportedList" field.
  List<String>? _reportedList;
  List<String> get reportedList => _reportedList ?? const [];
  set reportedList(List<String>? val) => _reportedList = val;

  void updateReportedList(Function(List<String>) updateFn) {
    updateFn(_reportedList ??= []);
  }

  bool hasReportedList() => _reportedList != null;

  // "unseen_chats" field.
  int? _unseenChats;
  int get unseenChats => _unseenChats ?? 0;
  set unseenChats(int? val) => _unseenChats = val;

  void incrementUnseenChats(int amount) => unseenChats = unseenChats + amount;

  bool hasUnseenChats() => _unseenChats != null;

  // "unseen_messages" field.
  int? _unseenMessages;
  int get unseenMessages => _unseenMessages ?? 0;
  set unseenMessages(int? val) => _unseenMessages = val;

  void incrementUnseenMessages(int amount) =>
      unseenMessages = unseenMessages + amount;

  bool hasUnseenMessages() => _unseenMessages != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        userId: data['userId'] as String?,
        userName: data['userName'] as String?,
        name: data['name'] as String?,
        lastName: data['lastName'] as String?,
        avatar: data['Avatar'] as String?,
        city: data['city'] as String?,
        userFavs: getDataList(data['userFavs']),
        reportedList: getDataList(data['reportedList']),
        unseenChats: castToType<int>(data['unseen_chats']),
        unseenMessages: castToType<int>(data['unseen_messages']),
        role: data['Role'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'userName': _userName,
        'name': _name,
        'lastName': _lastName,
        'Avatar': _avatar,
        'city': _city,
        'userFavs': _userFavs,
        'reportedList': _reportedList,
        'unseen_chats': _unseenChats,
        'unseen_messages': _unseenMessages,
        'Role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'Avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'userFavs': serializeParam(
          _userFavs,
          ParamType.String,
          isList: true,
        ),
        'reportedList': serializeParam(
          _reportedList,
          ParamType.String,
          isList: true,
        ),
        'unseen_chats': serializeParam(
          _unseenChats,
          ParamType.int,
        ),
        'unseen_messages': serializeParam(
          _unseenMessages,
          ParamType.int,
        ),
        'Role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['Avatar'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        userFavs: deserializeParam<String>(
          data['userFavs'],
          ParamType.String,
          true,
        ),
        reportedList: deserializeParam<String>(
          data['reportedList'],
          ParamType.String,
          true,
        ),
        unseenChats: deserializeParam(
          data['unseen_chats'],
          ParamType.int,
          false,
        ),
        unseenMessages: deserializeParam(
          data['unseen_messages'],
          ParamType.int,
          false,
        ),
        role: deserializeParam(
          data['Role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserInfoStruct &&
        userId == other.userId &&
        userName == other.userName &&
        name == other.name &&
        lastName == other.lastName &&
        avatar == other.avatar &&
        city == other.city &&
        listEquality.equals(userFavs, other.userFavs) &&
        listEquality.equals(reportedList, other.reportedList) &&
        unseenChats == other.unseenChats &&
        unseenMessages == other.unseenMessages &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        userName,
        name,
        lastName,
        avatar,
        city,
        userFavs,
        reportedList,
        unseenChats,
        unseenMessages,
        role
      ]);
}

UserInfoStruct createUserInfoStruct({
  String? userId,
  String? userName,
  String? name,
  String? lastName,
  String? avatar,
  String? city,
  int? unseenChats,
  int? unseenMessages,
  String? role,
}) =>
    UserInfoStruct(
      userId: userId,
      userName: userName,
      name: name,
      lastName: lastName,
      avatar: avatar,
      city: city,
      unseenChats: unseenChats,
      unseenMessages: unseenMessages,
      role: role,
    );
