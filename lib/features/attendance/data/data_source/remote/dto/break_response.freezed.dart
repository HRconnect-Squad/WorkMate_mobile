// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BreakResponse {

@JsonKey(name: "id") int? get id;@JsonKey(name: "attendance_id") int? get attendanceId;@JsonKey(name: "time") BreakTimeResponse? get time;@JsonKey(name: "reason") String? get reason;@JsonKey(name: "duration") DurationValueResponse? get duration;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakResponseCopyWith<BreakResponse> get copyWith => _$BreakResponseCopyWithImpl<BreakResponse>(this as BreakResponse, _$identity);

  /// Serializes this BreakResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.time, time) || other.time == time)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attendanceId,time,reason,duration,isActive);

@override
String toString() {
  return 'BreakResponse(id: $id, attendanceId: $attendanceId, time: $time, reason: $reason, duration: $duration, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $BreakResponseCopyWith<$Res>  {
  factory $BreakResponseCopyWith(BreakResponse value, $Res Function(BreakResponse) _then) = _$BreakResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "attendance_id") int? attendanceId,@JsonKey(name: "time") BreakTimeResponse? time,@JsonKey(name: "reason") String? reason,@JsonKey(name: "duration") DurationValueResponse? duration,@JsonKey(name: "is_active") bool? isActive
});


$BreakTimeResponseCopyWith<$Res>? get time;$DurationValueResponseCopyWith<$Res>? get duration;

}
/// @nodoc
class _$BreakResponseCopyWithImpl<$Res>
    implements $BreakResponseCopyWith<$Res> {
  _$BreakResponseCopyWithImpl(this._self, this._then);

  final BreakResponse _self;
  final $Res Function(BreakResponse) _then;

/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? attendanceId = freezed,Object? time = freezed,Object? reason = freezed,Object? duration = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as BreakTimeResponse?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreakTimeResponseCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $BreakTimeResponseCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// Adds pattern-matching-related methods to [BreakResponse].
extension BreakResponsePatterns on BreakResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakResponse value)  $default,){
final _that = this;
switch (_that) {
case _BreakResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BreakResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  BreakTimeResponse? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationValueResponse? duration, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakResponse() when $default != null:
return $default(_that.id,_that.attendanceId,_that.time,_that.reason,_that.duration,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  BreakTimeResponse? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationValueResponse? duration, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _BreakResponse():
return $default(_that.id,_that.attendanceId,_that.time,_that.reason,_that.duration,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  BreakTimeResponse? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationValueResponse? duration, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _BreakResponse() when $default != null:
return $default(_that.id,_that.attendanceId,_that.time,_that.reason,_that.duration,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakResponse implements BreakResponse {
  const _BreakResponse({@JsonKey(name: "id") this.id, @JsonKey(name: "attendance_id") this.attendanceId, @JsonKey(name: "time") this.time, @JsonKey(name: "reason") this.reason, @JsonKey(name: "duration") this.duration, @JsonKey(name: "is_active") this.isActive});
  factory _BreakResponse.fromJson(Map<String, dynamic> json) => _$BreakResponseFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "attendance_id") final  int? attendanceId;
@override@JsonKey(name: "time") final  BreakTimeResponse? time;
@override@JsonKey(name: "reason") final  String? reason;
@override@JsonKey(name: "duration") final  DurationValueResponse? duration;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakResponseCopyWith<_BreakResponse> get copyWith => __$BreakResponseCopyWithImpl<_BreakResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.time, time) || other.time == time)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attendanceId,time,reason,duration,isActive);

@override
String toString() {
  return 'BreakResponse(id: $id, attendanceId: $attendanceId, time: $time, reason: $reason, duration: $duration, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$BreakResponseCopyWith<$Res> implements $BreakResponseCopyWith<$Res> {
  factory _$BreakResponseCopyWith(_BreakResponse value, $Res Function(_BreakResponse) _then) = __$BreakResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "attendance_id") int? attendanceId,@JsonKey(name: "time") BreakTimeResponse? time,@JsonKey(name: "reason") String? reason,@JsonKey(name: "duration") DurationValueResponse? duration,@JsonKey(name: "is_active") bool? isActive
});


@override $BreakTimeResponseCopyWith<$Res>? get time;@override $DurationValueResponseCopyWith<$Res>? get duration;

}
/// @nodoc
class __$BreakResponseCopyWithImpl<$Res>
    implements _$BreakResponseCopyWith<$Res> {
  __$BreakResponseCopyWithImpl(this._self, this._then);

  final _BreakResponse _self;
  final $Res Function(_BreakResponse) _then;

/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? attendanceId = freezed,Object? time = freezed,Object? reason = freezed,Object? duration = freezed,Object? isActive = freezed,}) {
  return _then(_BreakResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as BreakTimeResponse?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationValueResponse?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreakTimeResponseCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $BreakTimeResponseCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of BreakResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationValueResponseCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DurationValueResponseCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// @nodoc
mixin _$BreakTimeResponse {

@JsonKey(name: "start") String? get start;@JsonKey(name: "end") String? get end;
/// Create a copy of BreakTimeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakTimeResponseCopyWith<BreakTimeResponse> get copyWith => _$BreakTimeResponseCopyWithImpl<BreakTimeResponse>(this as BreakTimeResponse, _$identity);

  /// Serializes this BreakTimeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakTimeResponse&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'BreakTimeResponse(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $BreakTimeResponseCopyWith<$Res>  {
  factory $BreakTimeResponseCopyWith(BreakTimeResponse value, $Res Function(BreakTimeResponse) _then) = _$BreakTimeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "start") String? start,@JsonKey(name: "end") String? end
});




}
/// @nodoc
class _$BreakTimeResponseCopyWithImpl<$Res>
    implements $BreakTimeResponseCopyWith<$Res> {
  _$BreakTimeResponseCopyWithImpl(this._self, this._then);

  final BreakTimeResponse _self;
  final $Res Function(BreakTimeResponse) _then;

/// Create a copy of BreakTimeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_self.copyWith(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakTimeResponse].
extension BreakTimeResponsePatterns on BreakTimeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakTimeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakTimeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakTimeResponse value)  $default,){
final _that = this;
switch (_that) {
case _BreakTimeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakTimeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BreakTimeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "start")  String? start, @JsonKey(name: "end")  String? end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakTimeResponse() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "start")  String? start, @JsonKey(name: "end")  String? end)  $default,) {final _that = this;
switch (_that) {
case _BreakTimeResponse():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "start")  String? start, @JsonKey(name: "end")  String? end)?  $default,) {final _that = this;
switch (_that) {
case _BreakTimeResponse() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakTimeResponse implements BreakTimeResponse {
  const _BreakTimeResponse({@JsonKey(name: "start") this.start, @JsonKey(name: "end") this.end});
  factory _BreakTimeResponse.fromJson(Map<String, dynamic> json) => _$BreakTimeResponseFromJson(json);

@override@JsonKey(name: "start") final  String? start;
@override@JsonKey(name: "end") final  String? end;

/// Create a copy of BreakTimeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakTimeResponseCopyWith<_BreakTimeResponse> get copyWith => __$BreakTimeResponseCopyWithImpl<_BreakTimeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakTimeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakTimeResponse&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'BreakTimeResponse(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$BreakTimeResponseCopyWith<$Res> implements $BreakTimeResponseCopyWith<$Res> {
  factory _$BreakTimeResponseCopyWith(_BreakTimeResponse value, $Res Function(_BreakTimeResponse) _then) = __$BreakTimeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "start") String? start,@JsonKey(name: "end") String? end
});




}
/// @nodoc
class __$BreakTimeResponseCopyWithImpl<$Res>
    implements _$BreakTimeResponseCopyWith<$Res> {
  __$BreakTimeResponseCopyWithImpl(this._self, this._then);

  final _BreakTimeResponse _self;
  final $Res Function(_BreakTimeResponse) _then;

/// Create a copy of BreakTimeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_BreakTimeResponse(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
