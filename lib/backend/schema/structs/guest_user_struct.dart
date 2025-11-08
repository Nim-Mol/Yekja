// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestUserStruct extends BaseStruct {
  GuestUserStruct({
    String? sessionId,
    String? device,
    DateTime? deviceTime,
    LatLng? deviceLoc,
  })  : _sessionId = sessionId,
        _device = device,
        _deviceTime = deviceTime,
        _deviceLoc = deviceLoc;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "Device" field.
  String? _device;
  String get device => _device ?? '';
  set device(String? val) => _device = val;

  bool hasDevice() => _device != null;

  // "DeviceTime" field.
  DateTime? _deviceTime;
  DateTime? get deviceTime => _deviceTime;
  set deviceTime(DateTime? val) => _deviceTime = val;

  bool hasDeviceTime() => _deviceTime != null;

  // "DeviceLoc" field.
  LatLng? _deviceLoc;
  LatLng? get deviceLoc => _deviceLoc;
  set deviceLoc(LatLng? val) => _deviceLoc = val;

  bool hasDeviceLoc() => _deviceLoc != null;

  static GuestUserStruct fromMap(Map<String, dynamic> data) => GuestUserStruct(
        sessionId: data['sessionId'] as String?,
        device: data['Device'] as String?,
        deviceTime: data['DeviceTime'] as DateTime?,
        deviceLoc: data['DeviceLoc'] as LatLng?,
      );

  static GuestUserStruct? maybeFromMap(dynamic data) => data is Map
      ? GuestUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sessionId': _sessionId,
        'Device': _device,
        'DeviceTime': _deviceTime,
        'DeviceLoc': _deviceLoc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sessionId': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'Device': serializeParam(
          _device,
          ParamType.String,
        ),
        'DeviceTime': serializeParam(
          _deviceTime,
          ParamType.DateTime,
        ),
        'DeviceLoc': serializeParam(
          _deviceLoc,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static GuestUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestUserStruct(
        sessionId: deserializeParam(
          data['sessionId'],
          ParamType.String,
          false,
        ),
        device: deserializeParam(
          data['Device'],
          ParamType.String,
          false,
        ),
        deviceTime: deserializeParam(
          data['DeviceTime'],
          ParamType.DateTime,
          false,
        ),
        deviceLoc: deserializeParam(
          data['DeviceLoc'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'GuestUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GuestUserStruct &&
        sessionId == other.sessionId &&
        device == other.device &&
        deviceTime == other.deviceTime &&
        deviceLoc == other.deviceLoc;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([sessionId, device, deviceTime, deviceLoc]);
}

GuestUserStruct createGuestUserStruct({
  String? sessionId,
  String? device,
  DateTime? deviceTime,
  LatLng? deviceLoc,
}) =>
    GuestUserStruct(
      sessionId: sessionId,
      device: device,
      deviceTime: deviceTime,
      deviceLoc: deviceLoc,
    );
