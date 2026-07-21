// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayAttendanceResponse {

@JsonKey(name: "id") int? get id;@JsonKey(name: "date") String? get date;@JsonKey(name: "status") String? get status;@JsonKey(name: "has_active_break") bool? get hasActiveBreak;@JsonKey(name: "notes") String? get notes;@JsonKey(name: "check_in") AttendancePunchResponse? get checkIn;@JsonKey(name: "check_out") AttendancePunchResponse? get checkOut;@JsonKey(name: "durations") AttendanceDurationsResponse? get durations;
/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayAttendanceResponseCopyWith<TodayAttendanceResponse> get copyWith => _$TodayAttendanceResponseCopyWithImpl<TodayAttendanceResponse>(this as TodayAttendanceResponse, _$identity);

  /// Serializes this TodayAttendanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayAttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.durations, durations) || other.durations == durations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasActiveBreak,notes,checkIn,checkOut,durations);

@override
String toString() {
  return 'TodayAttendanceResponse(id: $id, date: $date, status: $status, hasActiveBreak: $hasActiveBreak, notes: $notes, checkIn: $checkIn, checkOut: $checkOut, durations: $durations)';
}


}

/// @nodoc
abstract mixin class $TodayAttendanceResponseCopyWith<$Res>  {
  factory $TodayAttendanceResponseCopyWith(TodayAttendanceResponse value, $Res Function(TodayAttendanceResponse) _then) = _$TodayAttendanceResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "notes") String? notes,@JsonKey(name: "check_in") AttendancePunchResponse? checkIn,@JsonKey(name: "check_out") AttendancePunchResponse? checkOut,@JsonKey(name: "durations") AttendanceDurationsResponse? durations
});


$AttendancePunchResponseCopyWith<$Res>? get checkIn;$AttendancePunchResponseCopyWith<$Res>? get checkOut;$AttendanceDurationsResponseCopyWith<$Res>? get durations;

}
/// @nodoc
class _$TodayAttendanceResponseCopyWithImpl<$Res>
    implements $TodayAttendanceResponseCopyWith<$Res> {
  _$TodayAttendanceResponseCopyWithImpl(this._self, this._then);

  final TodayAttendanceResponse _self;
  final $Res Function(TodayAttendanceResponse) _then;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? notes = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? durations = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as AttendancePunchResponse?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as AttendancePunchResponse?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsResponse?,
  ));
}
/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendancePunchResponseCopyWith<$Res>? get checkIn {
    if (_self.checkIn == null) {
    return null;
  }

  return $AttendancePunchResponseCopyWith<$Res>(_self.checkIn!, (value) {
    return _then(_self.copyWith(checkIn: value));
  });
}/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendancePunchResponseCopyWith<$Res>? get checkOut {
    if (_self.checkOut == null) {
    return null;
  }

  return $AttendancePunchResponseCopyWith<$Res>(_self.checkOut!, (value) {
    return _then(_self.copyWith(checkOut: value));
  });
}/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceDurationsResponseCopyWith<$Res>? get durations {
    if (_self.durations == null) {
    return null;
  }

  return $AttendanceDurationsResponseCopyWith<$Res>(_self.durations!, (value) {
    return _then(_self.copyWith(durations: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayAttendanceResponse].
extension TodayAttendanceResponsePatterns on TodayAttendanceResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayAttendanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayAttendanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayAttendanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "check_in")  AttendancePunchResponse? checkIn, @JsonKey(name: "check_out")  AttendancePunchResponse? checkOut, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.checkIn,_that.checkOut,_that.durations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "check_in")  AttendancePunchResponse? checkIn, @JsonKey(name: "check_out")  AttendancePunchResponse? checkOut, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)  $default,) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse():
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.checkIn,_that.checkOut,_that.durations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "check_in")  AttendancePunchResponse? checkIn, @JsonKey(name: "check_out")  AttendancePunchResponse? checkOut, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)?  $default,) {final _that = this;
switch (_that) {
case _TodayAttendanceResponse() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.checkIn,_that.checkOut,_that.durations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayAttendanceResponse implements TodayAttendanceResponse {
  const _TodayAttendanceResponse({@JsonKey(name: "id") this.id, @JsonKey(name: "date") this.date, @JsonKey(name: "status") this.status, @JsonKey(name: "has_active_break") this.hasActiveBreak, @JsonKey(name: "notes") this.notes, @JsonKey(name: "check_in") this.checkIn, @JsonKey(name: "check_out") this.checkOut, @JsonKey(name: "durations") this.durations});
  factory _TodayAttendanceResponse.fromJson(Map<String, dynamic> json) => _$TodayAttendanceResponseFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "has_active_break") final  bool? hasActiveBreak;
@override@JsonKey(name: "notes") final  String? notes;
@override@JsonKey(name: "check_in") final  AttendancePunchResponse? checkIn;
@override@JsonKey(name: "check_out") final  AttendancePunchResponse? checkOut;
@override@JsonKey(name: "durations") final  AttendanceDurationsResponse? durations;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayAttendanceResponseCopyWith<_TodayAttendanceResponse> get copyWith => __$TodayAttendanceResponseCopyWithImpl<_TodayAttendanceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayAttendanceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayAttendanceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.durations, durations) || other.durations == durations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasActiveBreak,notes,checkIn,checkOut,durations);

@override
String toString() {
  return 'TodayAttendanceResponse(id: $id, date: $date, status: $status, hasActiveBreak: $hasActiveBreak, notes: $notes, checkIn: $checkIn, checkOut: $checkOut, durations: $durations)';
}


}

/// @nodoc
abstract mixin class _$TodayAttendanceResponseCopyWith<$Res> implements $TodayAttendanceResponseCopyWith<$Res> {
  factory _$TodayAttendanceResponseCopyWith(_TodayAttendanceResponse value, $Res Function(_TodayAttendanceResponse) _then) = __$TodayAttendanceResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "notes") String? notes,@JsonKey(name: "check_in") AttendancePunchResponse? checkIn,@JsonKey(name: "check_out") AttendancePunchResponse? checkOut,@JsonKey(name: "durations") AttendanceDurationsResponse? durations
});


@override $AttendancePunchResponseCopyWith<$Res>? get checkIn;@override $AttendancePunchResponseCopyWith<$Res>? get checkOut;@override $AttendanceDurationsResponseCopyWith<$Res>? get durations;

}
/// @nodoc
class __$TodayAttendanceResponseCopyWithImpl<$Res>
    implements _$TodayAttendanceResponseCopyWith<$Res> {
  __$TodayAttendanceResponseCopyWithImpl(this._self, this._then);

  final _TodayAttendanceResponse _self;
  final $Res Function(_TodayAttendanceResponse) _then;

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? notes = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? durations = freezed,}) {
  return _then(_TodayAttendanceResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as AttendancePunchResponse?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as AttendancePunchResponse?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsResponse?,
  ));
}

/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendancePunchResponseCopyWith<$Res>? get checkIn {
    if (_self.checkIn == null) {
    return null;
  }

  return $AttendancePunchResponseCopyWith<$Res>(_self.checkIn!, (value) {
    return _then(_self.copyWith(checkIn: value));
  });
}/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendancePunchResponseCopyWith<$Res>? get checkOut {
    if (_self.checkOut == null) {
    return null;
  }

  return $AttendancePunchResponseCopyWith<$Res>(_self.checkOut!, (value) {
    return _then(_self.copyWith(checkOut: value));
  });
}/// Create a copy of TodayAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceDurationsResponseCopyWith<$Res>? get durations {
    if (_self.durations == null) {
    return null;
  }

  return $AttendanceDurationsResponseCopyWith<$Res>(_self.durations!, (value) {
    return _then(_self.copyWith(durations: value));
  });
}
}


/// @nodoc
mixin _$AttendancePunchResponse {

@JsonKey(name: "time") String? get time;@JsonKey(name: "location") String? get location;@JsonKey(name: "ip") String? get ip;
/// Create a copy of AttendancePunchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendancePunchResponseCopyWith<AttendancePunchResponse> get copyWith => _$AttendancePunchResponseCopyWithImpl<AttendancePunchResponse>(this as AttendancePunchResponse, _$identity);

  /// Serializes this AttendancePunchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendancePunchResponse&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,location,ip);

@override
String toString() {
  return 'AttendancePunchResponse(time: $time, location: $location, ip: $ip)';
}


}

/// @nodoc
abstract mixin class $AttendancePunchResponseCopyWith<$Res>  {
  factory $AttendancePunchResponseCopyWith(AttendancePunchResponse value, $Res Function(AttendancePunchResponse) _then) = _$AttendancePunchResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "time") String? time,@JsonKey(name: "location") String? location,@JsonKey(name: "ip") String? ip
});




}
/// @nodoc
class _$AttendancePunchResponseCopyWithImpl<$Res>
    implements $AttendancePunchResponseCopyWith<$Res> {
  _$AttendancePunchResponseCopyWithImpl(this._self, this._then);

  final AttendancePunchResponse _self;
  final $Res Function(AttendancePunchResponse) _then;

/// Create a copy of AttendancePunchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? location = freezed,Object? ip = freezed,}) {
  return _then(_self.copyWith(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendancePunchResponse].
extension AttendancePunchResponsePatterns on AttendancePunchResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendancePunchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendancePunchResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendancePunchResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttendancePunchResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendancePunchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttendancePunchResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "time")  String? time, @JsonKey(name: "location")  String? location, @JsonKey(name: "ip")  String? ip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendancePunchResponse() when $default != null:
return $default(_that.time,_that.location,_that.ip);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "time")  String? time, @JsonKey(name: "location")  String? location, @JsonKey(name: "ip")  String? ip)  $default,) {final _that = this;
switch (_that) {
case _AttendancePunchResponse():
return $default(_that.time,_that.location,_that.ip);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "time")  String? time, @JsonKey(name: "location")  String? location, @JsonKey(name: "ip")  String? ip)?  $default,) {final _that = this;
switch (_that) {
case _AttendancePunchResponse() when $default != null:
return $default(_that.time,_that.location,_that.ip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendancePunchResponse implements AttendancePunchResponse {
  const _AttendancePunchResponse({@JsonKey(name: "time") this.time, @JsonKey(name: "location") this.location, @JsonKey(name: "ip") this.ip});
  factory _AttendancePunchResponse.fromJson(Map<String, dynamic> json) => _$AttendancePunchResponseFromJson(json);

@override@JsonKey(name: "time") final  String? time;
@override@JsonKey(name: "location") final  String? location;
@override@JsonKey(name: "ip") final  String? ip;

/// Create a copy of AttendancePunchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendancePunchResponseCopyWith<_AttendancePunchResponse> get copyWith => __$AttendancePunchResponseCopyWithImpl<_AttendancePunchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendancePunchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendancePunchResponse&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,location,ip);

@override
String toString() {
  return 'AttendancePunchResponse(time: $time, location: $location, ip: $ip)';
}


}

/// @nodoc
abstract mixin class _$AttendancePunchResponseCopyWith<$Res> implements $AttendancePunchResponseCopyWith<$Res> {
  factory _$AttendancePunchResponseCopyWith(_AttendancePunchResponse value, $Res Function(_AttendancePunchResponse) _then) = __$AttendancePunchResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "time") String? time,@JsonKey(name: "location") String? location,@JsonKey(name: "ip") String? ip
});




}
/// @nodoc
class __$AttendancePunchResponseCopyWithImpl<$Res>
    implements _$AttendancePunchResponseCopyWith<$Res> {
  __$AttendancePunchResponseCopyWithImpl(this._self, this._then);

  final _AttendancePunchResponse _self;
  final $Res Function(_AttendancePunchResponse) _then;

/// Create a copy of AttendancePunchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? location = freezed,Object? ip = freezed,}) {
  return _then(_AttendancePunchResponse(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceDurationsResponse {

@JsonKey(name: "worked") DurationValueResponse? get worked;@JsonKey(name: "overtime") DurationValueResponse? get overtime;@JsonKey(name: "breaks") DurationValueResponse? get breaks;
/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDurationsResponseCopyWith<AttendanceDurationsResponse> get copyWith => _$AttendanceDurationsResponseCopyWithImpl<AttendanceDurationsResponse>(this as AttendanceDurationsResponse, _$identity);

  /// Serializes this AttendanceDurationsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDurationsResponse&&(identical(other.worked, worked) || other.worked == worked)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.breaks, breaks) || other.breaks == breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,worked,overtime,breaks);

@override
String toString() {
  return 'AttendanceDurationsResponse(worked: $worked, overtime: $overtime, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class $AttendanceDurationsResponseCopyWith<$Res>  {
  factory $AttendanceDurationsResponseCopyWith(AttendanceDurationsResponse value, $Res Function(AttendanceDurationsResponse) _then) = _$AttendanceDurationsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "worked") DurationValueResponse? worked,@JsonKey(name: "overtime") DurationValueResponse? overtime,@JsonKey(name: "breaks") DurationValueResponse? breaks
});


$DurationValueResponseCopyWith<$Res>? get worked;$DurationValueResponseCopyWith<$Res>? get overtime;$DurationValueResponseCopyWith<$Res>? get breaks;

}
/// @nodoc
class _$AttendanceDurationsResponseCopyWithImpl<$Res>
    implements $AttendanceDurationsResponseCopyWith<$Res> {
  _$AttendanceDurationsResponseCopyWithImpl(this._self, this._then);

  final AttendanceDurationsResponse _self;
  final $Res Function(AttendanceDurationsResponse) _then;

/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? worked = freezed,Object? overtime = freezed,Object? breaks = freezed,}) {
  return _then(_self.copyWith(
worked: freezed == worked ? _self.worked : worked // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,breaks: freezed == breaks ? _self.breaks : breaks // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,
  ));
}
/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get worked {
    if (_self.worked == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.worked!, (value) {
    return _then(_self.copyWith(worked: value));
  });
}/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get overtime {
    if (_self.overtime == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.overtime!, (value) {
    return _then(_self.copyWith(overtime: value));
  });
}/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get breaks {
    if (_self.breaks == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.breaks!, (value) {
    return _then(_self.copyWith(breaks: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceDurationsResponse].
extension AttendanceDurationsResponsePatterns on AttendanceDurationsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDurationsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDurationsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDurationsResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDurationsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDurationsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDurationsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "worked")  DurationValueResponse? worked, @JsonKey(name: "overtime")  DurationValueResponse? overtime, @JsonKey(name: "breaks")  DurationValueResponse? breaks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDurationsResponse() when $default != null:
return $default(_that.worked,_that.overtime,_that.breaks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "worked")  DurationValueResponse? worked, @JsonKey(name: "overtime")  DurationValueResponse? overtime, @JsonKey(name: "breaks")  DurationValueResponse? breaks)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDurationsResponse():
return $default(_that.worked,_that.overtime,_that.breaks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "worked")  DurationValueResponse? worked, @JsonKey(name: "overtime")  DurationValueResponse? overtime, @JsonKey(name: "breaks")  DurationValueResponse? breaks)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDurationsResponse() when $default != null:
return $default(_that.worked,_that.overtime,_that.breaks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceDurationsResponse implements AttendanceDurationsResponse {
  const _AttendanceDurationsResponse({@JsonKey(name: "worked") this.worked, @JsonKey(name: "overtime") this.overtime, @JsonKey(name: "breaks") this.breaks});
  factory _AttendanceDurationsResponse.fromJson(Map<String, dynamic> json) => _$AttendanceDurationsResponseFromJson(json);

@override@JsonKey(name: "worked") final  DurationValueResponse? worked;
@override@JsonKey(name: "overtime") final  DurationValueResponse? overtime;
@override@JsonKey(name: "breaks") final  DurationValueResponse? breaks;

/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDurationsResponseCopyWith<_AttendanceDurationsResponse> get copyWith => __$AttendanceDurationsResponseCopyWithImpl<_AttendanceDurationsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceDurationsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDurationsResponse&&(identical(other.worked, worked) || other.worked == worked)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.breaks, breaks) || other.breaks == breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,worked,overtime,breaks);

@override
String toString() {
  return 'AttendanceDurationsResponse(worked: $worked, overtime: $overtime, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDurationsResponseCopyWith<$Res> implements $AttendanceDurationsResponseCopyWith<$Res> {
  factory _$AttendanceDurationsResponseCopyWith(_AttendanceDurationsResponse value, $Res Function(_AttendanceDurationsResponse) _then) = __$AttendanceDurationsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "worked") DurationValueResponse? worked,@JsonKey(name: "overtime") DurationValueResponse? overtime,@JsonKey(name: "breaks") DurationValueResponse? breaks
});


@override $DurationValueResponseCopyWith<$Res>? get worked;@override $DurationValueResponseCopyWith<$Res>? get overtime;@override $DurationValueResponseCopyWith<$Res>? get breaks;

}
/// @nodoc
class __$AttendanceDurationsResponseCopyWithImpl<$Res>
    implements _$AttendanceDurationsResponseCopyWith<$Res> {
  __$AttendanceDurationsResponseCopyWithImpl(this._self, this._then);

  final _AttendanceDurationsResponse _self;
  final $Res Function(_AttendanceDurationsResponse) _then;

/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? worked = freezed,Object? overtime = freezed,Object? breaks = freezed,}) {
  return _then(_AttendanceDurationsResponse(
worked: freezed == worked ? _self.worked : worked // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,breaks: freezed == breaks ? _self.breaks : breaks // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,
  ));
}

/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get worked {
    if (_self.worked == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.worked!, (value) {
    return _then(_self.copyWith(worked: value));
  });
}/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get overtime {
    if (_self.overtime == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.overtime!, (value) {
    return _then(_self.copyWith(overtime: value));
  });
}/// Create a copy of AttendanceDurationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get breaks {
    if (_self.breaks == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.breaks!, (value) {
    return _then(_self.copyWith(breaks: value));
  });
}
}


/// @nodoc
mixin _$DurationValueResponse {

@JsonKey(name: "total_seconds") int? get totalSeconds;@JsonKey(name: "formatted") String? get formatted;
/// Create a copy of DurationValueResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<DurationValueResponse> get copyWith => _$DurationValueResponseCopyWithImpl<DurationValueResponse>(this as DurationValueResponse, _$identity);

  /// Serializes this DurationValueResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DurationValueResponse&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSeconds,formatted);

@override
String toString() {
  return 'DurationValueResponse(totalSeconds: $totalSeconds, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class $DurationValueResponseCopyWith<$Res>  {
  factory $DurationValueResponseCopyWith(DurationValueResponse value, $Res Function(DurationValueResponse) _then) = _$DurationValueResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "total_seconds") int? totalSeconds,@JsonKey(name: "formatted") String? formatted
});




}
/// @nodoc
class _$DurationValueResponseCopyWithImpl<$Res>
    implements $DurationValueResponseCopyWith<$Res> {
  _$DurationValueResponseCopyWithImpl(this._self, this._then);

  final DurationValueResponse _self;
  final $Res Function(DurationValueResponse) _then;

/// Create a copy of DurationValueResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSeconds = freezed,Object? formatted = freezed,}) {
  return _then(_self.copyWith(
totalSeconds: freezed == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int?,formatted: freezed == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DurationValueResponse].
extension DurationValueResponsePatterns on DurationValueResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DurationValueResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DurationValueResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DurationValueResponse value)  $default,){
final _that = this;
switch (_that) {
case _DurationValueResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DurationValueResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DurationValueResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "total_seconds")  int? totalSeconds, @JsonKey(name: "formatted")  String? formatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DurationValueResponse() when $default != null:
return $default(_that.totalSeconds,_that.formatted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "total_seconds")  int? totalSeconds, @JsonKey(name: "formatted")  String? formatted)  $default,) {final _that = this;
switch (_that) {
case _DurationValueResponse():
return $default(_that.totalSeconds,_that.formatted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "total_seconds")  int? totalSeconds, @JsonKey(name: "formatted")  String? formatted)?  $default,) {final _that = this;
switch (_that) {
case _DurationValueResponse() when $default != null:
return $default(_that.totalSeconds,_that.formatted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DurationValueResponse implements DurationValueResponse {
  const _DurationValueResponse({@JsonKey(name: "total_seconds") this.totalSeconds, @JsonKey(name: "formatted") this.formatted});
  factory _DurationValueResponse.fromJson(Map<String, dynamic> json) => _$DurationValueResponseFromJson(json);

@override@JsonKey(name: "total_seconds") final  int? totalSeconds;
@override@JsonKey(name: "formatted") final  String? formatted;

/// Create a copy of DurationValueResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationValueResponseCopyWith<_DurationValueResponse> get copyWith => __$DurationValueResponseCopyWithImpl<_DurationValueResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DurationValueResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationValueResponse&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSeconds,formatted);

@override
String toString() {
  return 'DurationValueResponse(totalSeconds: $totalSeconds, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class _$DurationValueResponseCopyWith<$Res> implements $DurationValueResponseCopyWith<$Res> {
  factory _$DurationValueResponseCopyWith(_DurationValueResponse value, $Res Function(_DurationValueResponse) _then) = __$DurationValueResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "total_seconds") int? totalSeconds,@JsonKey(name: "formatted") String? formatted
});




}
/// @nodoc
class __$DurationValueResponseCopyWithImpl<$Res>
    implements _$DurationValueResponseCopyWith<$Res> {
  __$DurationValueResponseCopyWithImpl(this._self, this._then);

  final _DurationValueResponse _self;
  final $Res Function(_DurationValueResponse) _then;

/// Create a copy of DurationValueResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSeconds = freezed,Object? formatted = freezed,}) {
  return _then(_DurationValueResponse(
totalSeconds: freezed == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int?,formatted: freezed == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
