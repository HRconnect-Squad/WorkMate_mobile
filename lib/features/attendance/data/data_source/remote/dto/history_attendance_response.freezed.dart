// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryAttendanceResponse {

@JsonKey(name: "start_date") String? get startDate;@JsonKey(name: "end_date") String? get endDate;@JsonKey(name: "month") int? get month;@JsonKey(name: "year") int? get year;@JsonKey(name: "summary") HistorySummaryResponse? get summary;@JsonKey(name: "records") List<AttendanceRecordResponse>? get records;
/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryAttendanceResponseCopyWith<HistoryAttendanceResponse> get copyWith => _$HistoryAttendanceResponseCopyWithImpl<HistoryAttendanceResponse>(this as HistoryAttendanceResponse, _$identity);

  /// Serializes this HistoryAttendanceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryAttendanceResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.records, records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,month,year,summary,const DeepCollectionEquality().hash(records));

@override
String toString() {
  return 'HistoryAttendanceResponse(startDate: $startDate, endDate: $endDate, month: $month, year: $year, summary: $summary, records: $records)';
}


}

/// @nodoc
abstract mixin class $HistoryAttendanceResponseCopyWith<$Res>  {
  factory $HistoryAttendanceResponseCopyWith(HistoryAttendanceResponse value, $Res Function(HistoryAttendanceResponse) _then) = _$HistoryAttendanceResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "start_date") String? startDate,@JsonKey(name: "end_date") String? endDate,@JsonKey(name: "month") int? month,@JsonKey(name: "year") int? year,@JsonKey(name: "summary") HistorySummaryResponse? summary,@JsonKey(name: "records") List<AttendanceRecordResponse>? records
});


$HistorySummaryResponseCopyWith<$Res>? get summary;

}
/// @nodoc
class _$HistoryAttendanceResponseCopyWithImpl<$Res>
    implements $HistoryAttendanceResponseCopyWith<$Res> {
  _$HistoryAttendanceResponseCopyWithImpl(this._self, this._then);

  final HistoryAttendanceResponse _self;
  final $Res Function(HistoryAttendanceResponse) _then;

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? month = freezed,Object? year = freezed,Object? summary = freezed,Object? records = freezed,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as HistorySummaryResponse?,records: freezed == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecordResponse>?,
  ));
}
/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistorySummaryResponseCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $HistorySummaryResponseCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryAttendanceResponse].
extension HistoryAttendanceResponsePatterns on HistoryAttendanceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryAttendanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryAttendanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryAttendanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "start_date")  String? startDate, @JsonKey(name: "end_date")  String? endDate, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "summary")  HistorySummaryResponse? summary, @JsonKey(name: "records")  List<AttendanceRecordResponse>? records)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.month,_that.year,_that.summary,_that.records);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "start_date")  String? startDate, @JsonKey(name: "end_date")  String? endDate, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "summary")  HistorySummaryResponse? summary, @JsonKey(name: "records")  List<AttendanceRecordResponse>? records)  $default,) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse():
return $default(_that.startDate,_that.endDate,_that.month,_that.year,_that.summary,_that.records);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "start_date")  String? startDate, @JsonKey(name: "end_date")  String? endDate, @JsonKey(name: "month")  int? month, @JsonKey(name: "year")  int? year, @JsonKey(name: "summary")  HistorySummaryResponse? summary, @JsonKey(name: "records")  List<AttendanceRecordResponse>? records)?  $default,) {final _that = this;
switch (_that) {
case _HistoryAttendanceResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.month,_that.year,_that.summary,_that.records);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryAttendanceResponse implements HistoryAttendanceResponse {
  const _HistoryAttendanceResponse({@JsonKey(name: "start_date") this.startDate, @JsonKey(name: "end_date") this.endDate, @JsonKey(name: "month") this.month, @JsonKey(name: "year") this.year, @JsonKey(name: "summary") this.summary, @JsonKey(name: "records") final  List<AttendanceRecordResponse>? records}): _records = records;
  factory _HistoryAttendanceResponse.fromJson(Map<String, dynamic> json) => _$HistoryAttendanceResponseFromJson(json);

@override@JsonKey(name: "start_date") final  String? startDate;
@override@JsonKey(name: "end_date") final  String? endDate;
@override@JsonKey(name: "month") final  int? month;
@override@JsonKey(name: "year") final  int? year;
@override@JsonKey(name: "summary") final  HistorySummaryResponse? summary;
 final  List<AttendanceRecordResponse>? _records;
@override@JsonKey(name: "records") List<AttendanceRecordResponse>? get records {
  final value = _records;
  if (value == null) return null;
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryAttendanceResponseCopyWith<_HistoryAttendanceResponse> get copyWith => __$HistoryAttendanceResponseCopyWithImpl<_HistoryAttendanceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryAttendanceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryAttendanceResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._records, _records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,month,year,summary,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'HistoryAttendanceResponse(startDate: $startDate, endDate: $endDate, month: $month, year: $year, summary: $summary, records: $records)';
}


}

/// @nodoc
abstract mixin class _$HistoryAttendanceResponseCopyWith<$Res> implements $HistoryAttendanceResponseCopyWith<$Res> {
  factory _$HistoryAttendanceResponseCopyWith(_HistoryAttendanceResponse value, $Res Function(_HistoryAttendanceResponse) _then) = __$HistoryAttendanceResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "start_date") String? startDate,@JsonKey(name: "end_date") String? endDate,@JsonKey(name: "month") int? month,@JsonKey(name: "year") int? year,@JsonKey(name: "summary") HistorySummaryResponse? summary,@JsonKey(name: "records") List<AttendanceRecordResponse>? records
});


@override $HistorySummaryResponseCopyWith<$Res>? get summary;

}
/// @nodoc
class __$HistoryAttendanceResponseCopyWithImpl<$Res>
    implements _$HistoryAttendanceResponseCopyWith<$Res> {
  __$HistoryAttendanceResponseCopyWithImpl(this._self, this._then);

  final _HistoryAttendanceResponse _self;
  final $Res Function(_HistoryAttendanceResponse) _then;

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,Object? month = freezed,Object? year = freezed,Object? summary = freezed,Object? records = freezed,}) {
  return _then(_HistoryAttendanceResponse(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as HistorySummaryResponse?,records: freezed == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecordResponse>?,
  ));
}

/// Create a copy of HistoryAttendanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistorySummaryResponseCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $HistorySummaryResponseCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$HistorySummaryResponse {

@JsonKey(name: "total_days") int? get totalDays;@JsonKey(name: "present_days") int? get presentDays;@JsonKey(name: "late_days") int? get lateDays;@JsonKey(name: "absent_days") int? get absentDays;@JsonKey(name: "durations") AttendanceDurationsResponse? get durations;
/// Create a copy of HistorySummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistorySummaryResponseCopyWith<HistorySummaryResponse> get copyWith => _$HistorySummaryResponseCopyWithImpl<HistorySummaryResponse>(this as HistorySummaryResponse, _$identity);

  /// Serializes this HistorySummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistorySummaryResponse&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays)&&(identical(other.durations, durations) || other.durations == durations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,presentDays,lateDays,absentDays,durations);

@override
String toString() {
  return 'HistorySummaryResponse(totalDays: $totalDays, presentDays: $presentDays, lateDays: $lateDays, absentDays: $absentDays, durations: $durations)';
}


}

/// @nodoc
abstract mixin class $HistorySummaryResponseCopyWith<$Res>  {
  factory $HistorySummaryResponseCopyWith(HistorySummaryResponse value, $Res Function(HistorySummaryResponse) _then) = _$HistorySummaryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "total_days") int? totalDays,@JsonKey(name: "present_days") int? presentDays,@JsonKey(name: "late_days") int? lateDays,@JsonKey(name: "absent_days") int? absentDays,@JsonKey(name: "durations") AttendanceDurationsResponse? durations
});


$AttendanceDurationsResponseCopyWith<$Res>? get durations;

}
/// @nodoc
class _$HistorySummaryResponseCopyWithImpl<$Res>
    implements $HistorySummaryResponseCopyWith<$Res> {
  _$HistorySummaryResponseCopyWithImpl(this._self, this._then);

  final HistorySummaryResponse _self;
  final $Res Function(HistorySummaryResponse) _then;

/// Create a copy of HistorySummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDays = freezed,Object? presentDays = freezed,Object? lateDays = freezed,Object? absentDays = freezed,Object? durations = freezed,}) {
  return _then(_self.copyWith(
totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,presentDays: freezed == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int?,lateDays: freezed == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int?,absentDays: freezed == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsResponse?,
  ));
}
/// Create a copy of HistorySummaryResponse
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


/// Adds pattern-matching-related methods to [HistorySummaryResponse].
extension HistorySummaryResponsePatterns on HistorySummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistorySummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistorySummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistorySummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistorySummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistorySummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistorySummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "absent_days")  int? absentDays, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistorySummaryResponse() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.lateDays,_that.absentDays,_that.durations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "absent_days")  int? absentDays, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)  $default,) {final _that = this;
switch (_that) {
case _HistorySummaryResponse():
return $default(_that.totalDays,_that.presentDays,_that.lateDays,_that.absentDays,_that.durations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "total_days")  int? totalDays, @JsonKey(name: "present_days")  int? presentDays, @JsonKey(name: "late_days")  int? lateDays, @JsonKey(name: "absent_days")  int? absentDays, @JsonKey(name: "durations")  AttendanceDurationsResponse? durations)?  $default,) {final _that = this;
switch (_that) {
case _HistorySummaryResponse() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.lateDays,_that.absentDays,_that.durations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistorySummaryResponse implements HistorySummaryResponse {
  const _HistorySummaryResponse({@JsonKey(name: "total_days") this.totalDays, @JsonKey(name: "present_days") this.presentDays, @JsonKey(name: "late_days") this.lateDays, @JsonKey(name: "absent_days") this.absentDays, @JsonKey(name: "durations") this.durations});
  factory _HistorySummaryResponse.fromJson(Map<String, dynamic> json) => _$HistorySummaryResponseFromJson(json);

@override@JsonKey(name: "total_days") final  int? totalDays;
@override@JsonKey(name: "present_days") final  int? presentDays;
@override@JsonKey(name: "late_days") final  int? lateDays;
@override@JsonKey(name: "absent_days") final  int? absentDays;
@override@JsonKey(name: "durations") final  AttendanceDurationsResponse? durations;

/// Create a copy of HistorySummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistorySummaryResponseCopyWith<_HistorySummaryResponse> get copyWith => __$HistorySummaryResponseCopyWithImpl<_HistorySummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistorySummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistorySummaryResponse&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays)&&(identical(other.durations, durations) || other.durations == durations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,presentDays,lateDays,absentDays,durations);

@override
String toString() {
  return 'HistorySummaryResponse(totalDays: $totalDays, presentDays: $presentDays, lateDays: $lateDays, absentDays: $absentDays, durations: $durations)';
}


}

/// @nodoc
abstract mixin class _$HistorySummaryResponseCopyWith<$Res> implements $HistorySummaryResponseCopyWith<$Res> {
  factory _$HistorySummaryResponseCopyWith(_HistorySummaryResponse value, $Res Function(_HistorySummaryResponse) _then) = __$HistorySummaryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "total_days") int? totalDays,@JsonKey(name: "present_days") int? presentDays,@JsonKey(name: "late_days") int? lateDays,@JsonKey(name: "absent_days") int? absentDays,@JsonKey(name: "durations") AttendanceDurationsResponse? durations
});


@override $AttendanceDurationsResponseCopyWith<$Res>? get durations;

}
/// @nodoc
class __$HistorySummaryResponseCopyWithImpl<$Res>
    implements _$HistorySummaryResponseCopyWith<$Res> {
  __$HistorySummaryResponseCopyWithImpl(this._self, this._then);

  final _HistorySummaryResponse _self;
  final $Res Function(_HistorySummaryResponse) _then;

/// Create a copy of HistorySummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDays = freezed,Object? presentDays = freezed,Object? lateDays = freezed,Object? absentDays = freezed,Object? durations = freezed,}) {
  return _then(_HistorySummaryResponse(
totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,presentDays: freezed == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int?,lateDays: freezed == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int?,absentDays: freezed == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsResponse?,
  ));
}

/// Create a copy of HistorySummaryResponse
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

// dart format on
