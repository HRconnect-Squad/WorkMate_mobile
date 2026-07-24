// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceDetailsDataDto {

@JsonKey(name: "id") int? get id;@JsonKey(name: "date") String? get date;@JsonKey(name: "status") String? get status;@JsonKey(name: "has_active_break") bool? get hasActiveBreak;@JsonKey(name: "notes") String? get notes;@JsonKey(name: "employee") AttendanceEmployeeDto? get employee;@JsonKey(name: "check_in") AttendanceCheckEventDto? get checkIn;@JsonKey(name: "check_out") AttendanceCheckEventDto? get checkOut;@JsonKey(name: "durations") AttendanceDurationsDto? get durations;@JsonKey(name: "proof_image") String? get proofImage;@JsonKey(name: "breaks") List<AttendanceBreakItemDto>? get breaks;
/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDetailsDataDtoCopyWith<AttendanceDetailsDataDto> get copyWith => _$AttendanceDetailsDataDtoCopyWithImpl<AttendanceDetailsDataDto>(this as AttendanceDetailsDataDto, _$identity);

  /// Serializes this AttendanceDetailsDataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDetailsDataDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.durations, durations) || other.durations == durations)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&const DeepCollectionEquality().equals(other.breaks, breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasActiveBreak,notes,employee,checkIn,checkOut,durations,proofImage,const DeepCollectionEquality().hash(breaks));

@override
String toString() {
  return 'AttendanceDetailsDataDto(id: $id, date: $date, status: $status, hasActiveBreak: $hasActiveBreak, notes: $notes, employee: $employee, checkIn: $checkIn, checkOut: $checkOut, durations: $durations, proofImage: $proofImage, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class $AttendanceDetailsDataDtoCopyWith<$Res>  {
  factory $AttendanceDetailsDataDtoCopyWith(AttendanceDetailsDataDto value, $Res Function(AttendanceDetailsDataDto) _then) = _$AttendanceDetailsDataDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "notes") String? notes,@JsonKey(name: "employee") AttendanceEmployeeDto? employee,@JsonKey(name: "check_in") AttendanceCheckEventDto? checkIn,@JsonKey(name: "check_out") AttendanceCheckEventDto? checkOut,@JsonKey(name: "durations") AttendanceDurationsDto? durations,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "breaks") List<AttendanceBreakItemDto>? breaks
});


$AttendanceEmployeeDtoCopyWith<$Res>? get employee;$AttendanceCheckEventDtoCopyWith<$Res>? get checkIn;$AttendanceCheckEventDtoCopyWith<$Res>? get checkOut;$AttendanceDurationsDtoCopyWith<$Res>? get durations;

}
/// @nodoc
class _$AttendanceDetailsDataDtoCopyWithImpl<$Res>
    implements $AttendanceDetailsDataDtoCopyWith<$Res> {
  _$AttendanceDetailsDataDtoCopyWithImpl(this._self, this._then);

  final AttendanceDetailsDataDto _self;
  final $Res Function(AttendanceDetailsDataDto) _then;

/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? notes = freezed,Object? employee = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? durations = freezed,Object? proofImage = freezed,Object? breaks = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as AttendanceEmployeeDto?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as AttendanceCheckEventDto?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as AttendanceCheckEventDto?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsDto?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,breaks: freezed == breaks ? _self.breaks : breaks // ignore: cast_nullable_to_non_nullable
as List<AttendanceBreakItemDto>?,
  ));
}
/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceEmployeeDtoCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $AttendanceEmployeeDtoCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceCheckEventDtoCopyWith<$Res>? get checkIn {
    if (_self.checkIn == null) {
    return null;
  }

  return $AttendanceCheckEventDtoCopyWith<$Res>(_self.checkIn!, (value) {
    return _then(_self.copyWith(checkIn: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceCheckEventDtoCopyWith<$Res>? get checkOut {
    if (_self.checkOut == null) {
    return null;
  }

  return $AttendanceCheckEventDtoCopyWith<$Res>(_self.checkOut!, (value) {
    return _then(_self.copyWith(checkOut: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceDurationsDtoCopyWith<$Res>? get durations {
    if (_self.durations == null) {
    return null;
  }

  return $AttendanceDurationsDtoCopyWith<$Res>(_self.durations!, (value) {
    return _then(_self.copyWith(durations: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceDetailsDataDto].
extension AttendanceDetailsDataDtoPatterns on AttendanceDetailsDataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDetailsDataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDetailsDataDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDetailsDataDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "employee")  AttendanceEmployeeDto? employee, @JsonKey(name: "check_in")  AttendanceCheckEventDto? checkIn, @JsonKey(name: "check_out")  AttendanceCheckEventDto? checkOut, @JsonKey(name: "durations")  AttendanceDurationsDto? durations, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "breaks")  List<AttendanceBreakItemDto>? breaks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.employee,_that.checkIn,_that.checkOut,_that.durations,_that.proofImage,_that.breaks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "employee")  AttendanceEmployeeDto? employee, @JsonKey(name: "check_in")  AttendanceCheckEventDto? checkIn, @JsonKey(name: "check_out")  AttendanceCheckEventDto? checkOut, @JsonKey(name: "durations")  AttendanceDurationsDto? durations, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "breaks")  List<AttendanceBreakItemDto>? breaks)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto():
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.employee,_that.checkIn,_that.checkOut,_that.durations,_that.proofImage,_that.breaks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "date")  String? date, @JsonKey(name: "status")  String? status, @JsonKey(name: "has_active_break")  bool? hasActiveBreak, @JsonKey(name: "notes")  String? notes, @JsonKey(name: "employee")  AttendanceEmployeeDto? employee, @JsonKey(name: "check_in")  AttendanceCheckEventDto? checkIn, @JsonKey(name: "check_out")  AttendanceCheckEventDto? checkOut, @JsonKey(name: "durations")  AttendanceDurationsDto? durations, @JsonKey(name: "proof_image")  String? proofImage, @JsonKey(name: "breaks")  List<AttendanceBreakItemDto>? breaks)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDetailsDataDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasActiveBreak,_that.notes,_that.employee,_that.checkIn,_that.checkOut,_that.durations,_that.proofImage,_that.breaks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceDetailsDataDto implements AttendanceDetailsDataDto {
  const _AttendanceDetailsDataDto({@JsonKey(name: "id") this.id, @JsonKey(name: "date") this.date, @JsonKey(name: "status") this.status, @JsonKey(name: "has_active_break") this.hasActiveBreak, @JsonKey(name: "notes") this.notes, @JsonKey(name: "employee") this.employee, @JsonKey(name: "check_in") this.checkIn, @JsonKey(name: "check_out") this.checkOut, @JsonKey(name: "durations") this.durations, @JsonKey(name: "proof_image") this.proofImage, @JsonKey(name: "breaks") final  List<AttendanceBreakItemDto>? breaks}): _breaks = breaks;
  factory _AttendanceDetailsDataDto.fromJson(Map<String, dynamic> json) => _$AttendanceDetailsDataDtoFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "has_active_break") final  bool? hasActiveBreak;
@override@JsonKey(name: "notes") final  String? notes;
@override@JsonKey(name: "employee") final  AttendanceEmployeeDto? employee;
@override@JsonKey(name: "check_in") final  AttendanceCheckEventDto? checkIn;
@override@JsonKey(name: "check_out") final  AttendanceCheckEventDto? checkOut;
@override@JsonKey(name: "durations") final  AttendanceDurationsDto? durations;
@override@JsonKey(name: "proof_image") final  String? proofImage;
 final  List<AttendanceBreakItemDto>? _breaks;
@override@JsonKey(name: "breaks") List<AttendanceBreakItemDto>? get breaks {
  final value = _breaks;
  if (value == null) return null;
  if (_breaks is EqualUnmodifiableListView) return _breaks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDetailsDataDtoCopyWith<_AttendanceDetailsDataDto> get copyWith => __$AttendanceDetailsDataDtoCopyWithImpl<_AttendanceDetailsDataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceDetailsDataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDetailsDataDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasActiveBreak, hasActiveBreak) || other.hasActiveBreak == hasActiveBreak)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.durations, durations) || other.durations == durations)&&(identical(other.proofImage, proofImage) || other.proofImage == proofImage)&&const DeepCollectionEquality().equals(other._breaks, _breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasActiveBreak,notes,employee,checkIn,checkOut,durations,proofImage,const DeepCollectionEquality().hash(_breaks));

@override
String toString() {
  return 'AttendanceDetailsDataDto(id: $id, date: $date, status: $status, hasActiveBreak: $hasActiveBreak, notes: $notes, employee: $employee, checkIn: $checkIn, checkOut: $checkOut, durations: $durations, proofImage: $proofImage, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDetailsDataDtoCopyWith<$Res> implements $AttendanceDetailsDataDtoCopyWith<$Res> {
  factory _$AttendanceDetailsDataDtoCopyWith(_AttendanceDetailsDataDto value, $Res Function(_AttendanceDetailsDataDto) _then) = __$AttendanceDetailsDataDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "date") String? date,@JsonKey(name: "status") String? status,@JsonKey(name: "has_active_break") bool? hasActiveBreak,@JsonKey(name: "notes") String? notes,@JsonKey(name: "employee") AttendanceEmployeeDto? employee,@JsonKey(name: "check_in") AttendanceCheckEventDto? checkIn,@JsonKey(name: "check_out") AttendanceCheckEventDto? checkOut,@JsonKey(name: "durations") AttendanceDurationsDto? durations,@JsonKey(name: "proof_image") String? proofImage,@JsonKey(name: "breaks") List<AttendanceBreakItemDto>? breaks
});


@override $AttendanceEmployeeDtoCopyWith<$Res>? get employee;@override $AttendanceCheckEventDtoCopyWith<$Res>? get checkIn;@override $AttendanceCheckEventDtoCopyWith<$Res>? get checkOut;@override $AttendanceDurationsDtoCopyWith<$Res>? get durations;

}
/// @nodoc
class __$AttendanceDetailsDataDtoCopyWithImpl<$Res>
    implements _$AttendanceDetailsDataDtoCopyWith<$Res> {
  __$AttendanceDetailsDataDtoCopyWithImpl(this._self, this._then);

  final _AttendanceDetailsDataDto _self;
  final $Res Function(_AttendanceDetailsDataDto) _then;

/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? status = freezed,Object? hasActiveBreak = freezed,Object? notes = freezed,Object? employee = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? durations = freezed,Object? proofImage = freezed,Object? breaks = freezed,}) {
  return _then(_AttendanceDetailsDataDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,hasActiveBreak: freezed == hasActiveBreak ? _self.hasActiveBreak : hasActiveBreak // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as AttendanceEmployeeDto?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as AttendanceCheckEventDto?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as AttendanceCheckEventDto?,durations: freezed == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as AttendanceDurationsDto?,proofImage: freezed == proofImage ? _self.proofImage : proofImage // ignore: cast_nullable_to_non_nullable
as String?,breaks: freezed == breaks ? _self._breaks : breaks // ignore: cast_nullable_to_non_nullable
as List<AttendanceBreakItemDto>?,
  ));
}

/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceEmployeeDtoCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $AttendanceEmployeeDtoCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceCheckEventDtoCopyWith<$Res>? get checkIn {
    if (_self.checkIn == null) {
    return null;
  }

  return $AttendanceCheckEventDtoCopyWith<$Res>(_self.checkIn!, (value) {
    return _then(_self.copyWith(checkIn: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceCheckEventDtoCopyWith<$Res>? get checkOut {
    if (_self.checkOut == null) {
    return null;
  }

  return $AttendanceCheckEventDtoCopyWith<$Res>(_self.checkOut!, (value) {
    return _then(_self.copyWith(checkOut: value));
  });
}/// Create a copy of AttendanceDetailsDataDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceDurationsDtoCopyWith<$Res>? get durations {
    if (_self.durations == null) {
    return null;
  }

  return $AttendanceDurationsDtoCopyWith<$Res>(_self.durations!, (value) {
    return _then(_self.copyWith(durations: value));
  });
}
}


/// @nodoc
mixin _$AttendanceEmployeeDto {

@JsonKey(name: "id") int? get id;@JsonKey(name: "employee_code") String? get employeeCode;@JsonKey(name: "name") String? get name;@JsonKey(name: "department") String? get department;
/// Create a copy of AttendanceEmployeeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceEmployeeDtoCopyWith<AttendanceEmployeeDto> get copyWith => _$AttendanceEmployeeDtoCopyWithImpl<AttendanceEmployeeDto>(this as AttendanceEmployeeDto, _$identity);

  /// Serializes this AttendanceEmployeeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceEmployeeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeCode,name,department);

@override
String toString() {
  return 'AttendanceEmployeeDto(id: $id, employeeCode: $employeeCode, name: $name, department: $department)';
}


}

/// @nodoc
abstract mixin class $AttendanceEmployeeDtoCopyWith<$Res>  {
  factory $AttendanceEmployeeDtoCopyWith(AttendanceEmployeeDto value, $Res Function(AttendanceEmployeeDto) _then) = _$AttendanceEmployeeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "employee_code") String? employeeCode,@JsonKey(name: "name") String? name,@JsonKey(name: "department") String? department
});




}
/// @nodoc
class _$AttendanceEmployeeDtoCopyWithImpl<$Res>
    implements $AttendanceEmployeeDtoCopyWith<$Res> {
  _$AttendanceEmployeeDtoCopyWithImpl(this._self, this._then);

  final AttendanceEmployeeDto _self;
  final $Res Function(AttendanceEmployeeDto) _then;

/// Create a copy of AttendanceEmployeeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? employeeCode = freezed,Object? name = freezed,Object? department = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,employeeCode: freezed == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceEmployeeDto].
extension AttendanceEmployeeDtoPatterns on AttendanceEmployeeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceEmployeeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceEmployeeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceEmployeeDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceEmployeeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceEmployeeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceEmployeeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "employee_code")  String? employeeCode, @JsonKey(name: "name")  String? name, @JsonKey(name: "department")  String? department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceEmployeeDto() when $default != null:
return $default(_that.id,_that.employeeCode,_that.name,_that.department);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "employee_code")  String? employeeCode, @JsonKey(name: "name")  String? name, @JsonKey(name: "department")  String? department)  $default,) {final _that = this;
switch (_that) {
case _AttendanceEmployeeDto():
return $default(_that.id,_that.employeeCode,_that.name,_that.department);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "employee_code")  String? employeeCode, @JsonKey(name: "name")  String? name, @JsonKey(name: "department")  String? department)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceEmployeeDto() when $default != null:
return $default(_that.id,_that.employeeCode,_that.name,_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceEmployeeDto implements AttendanceEmployeeDto {
  const _AttendanceEmployeeDto({@JsonKey(name: "id") this.id, @JsonKey(name: "employee_code") this.employeeCode, @JsonKey(name: "name") this.name, @JsonKey(name: "department") this.department});
  factory _AttendanceEmployeeDto.fromJson(Map<String, dynamic> json) => _$AttendanceEmployeeDtoFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "employee_code") final  String? employeeCode;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "department") final  String? department;

/// Create a copy of AttendanceEmployeeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceEmployeeDtoCopyWith<_AttendanceEmployeeDto> get copyWith => __$AttendanceEmployeeDtoCopyWithImpl<_AttendanceEmployeeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceEmployeeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceEmployeeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeCode,name,department);

@override
String toString() {
  return 'AttendanceEmployeeDto(id: $id, employeeCode: $employeeCode, name: $name, department: $department)';
}


}

/// @nodoc
abstract mixin class _$AttendanceEmployeeDtoCopyWith<$Res> implements $AttendanceEmployeeDtoCopyWith<$Res> {
  factory _$AttendanceEmployeeDtoCopyWith(_AttendanceEmployeeDto value, $Res Function(_AttendanceEmployeeDto) _then) = __$AttendanceEmployeeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "employee_code") String? employeeCode,@JsonKey(name: "name") String? name,@JsonKey(name: "department") String? department
});




}
/// @nodoc
class __$AttendanceEmployeeDtoCopyWithImpl<$Res>
    implements _$AttendanceEmployeeDtoCopyWith<$Res> {
  __$AttendanceEmployeeDtoCopyWithImpl(this._self, this._then);

  final _AttendanceEmployeeDto _self;
  final $Res Function(_AttendanceEmployeeDto) _then;

/// Create a copy of AttendanceEmployeeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? employeeCode = freezed,Object? name = freezed,Object? department = freezed,}) {
  return _then(_AttendanceEmployeeDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,employeeCode: freezed == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceCheckEventDto {

@JsonKey(name: "time") String? get time;@JsonKey(name: "location") String? get location;@JsonKey(name: "ip") String? get ip;
/// Create a copy of AttendanceCheckEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceCheckEventDtoCopyWith<AttendanceCheckEventDto> get copyWith => _$AttendanceCheckEventDtoCopyWithImpl<AttendanceCheckEventDto>(this as AttendanceCheckEventDto, _$identity);

  /// Serializes this AttendanceCheckEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceCheckEventDto&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,location,ip);

@override
String toString() {
  return 'AttendanceCheckEventDto(time: $time, location: $location, ip: $ip)';
}


}

/// @nodoc
abstract mixin class $AttendanceCheckEventDtoCopyWith<$Res>  {
  factory $AttendanceCheckEventDtoCopyWith(AttendanceCheckEventDto value, $Res Function(AttendanceCheckEventDto) _then) = _$AttendanceCheckEventDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "time") String? time,@JsonKey(name: "location") String? location,@JsonKey(name: "ip") String? ip
});




}
/// @nodoc
class _$AttendanceCheckEventDtoCopyWithImpl<$Res>
    implements $AttendanceCheckEventDtoCopyWith<$Res> {
  _$AttendanceCheckEventDtoCopyWithImpl(this._self, this._then);

  final AttendanceCheckEventDto _self;
  final $Res Function(AttendanceCheckEventDto) _then;

/// Create a copy of AttendanceCheckEventDto
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


/// Adds pattern-matching-related methods to [AttendanceCheckEventDto].
extension AttendanceCheckEventDtoPatterns on AttendanceCheckEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceCheckEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceCheckEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceCheckEventDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceCheckEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceCheckEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceCheckEventDto() when $default != null:
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
case _AttendanceCheckEventDto() when $default != null:
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
case _AttendanceCheckEventDto():
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
case _AttendanceCheckEventDto() when $default != null:
return $default(_that.time,_that.location,_that.ip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceCheckEventDto implements AttendanceCheckEventDto {
  const _AttendanceCheckEventDto({@JsonKey(name: "time") this.time, @JsonKey(name: "location") this.location, @JsonKey(name: "ip") this.ip});
  factory _AttendanceCheckEventDto.fromJson(Map<String, dynamic> json) => _$AttendanceCheckEventDtoFromJson(json);

@override@JsonKey(name: "time") final  String? time;
@override@JsonKey(name: "location") final  String? location;
@override@JsonKey(name: "ip") final  String? ip;

/// Create a copy of AttendanceCheckEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceCheckEventDtoCopyWith<_AttendanceCheckEventDto> get copyWith => __$AttendanceCheckEventDtoCopyWithImpl<_AttendanceCheckEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceCheckEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceCheckEventDto&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&(identical(other.ip, ip) || other.ip == ip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,location,ip);

@override
String toString() {
  return 'AttendanceCheckEventDto(time: $time, location: $location, ip: $ip)';
}


}

/// @nodoc
abstract mixin class _$AttendanceCheckEventDtoCopyWith<$Res> implements $AttendanceCheckEventDtoCopyWith<$Res> {
  factory _$AttendanceCheckEventDtoCopyWith(_AttendanceCheckEventDto value, $Res Function(_AttendanceCheckEventDto) _then) = __$AttendanceCheckEventDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "time") String? time,@JsonKey(name: "location") String? location,@JsonKey(name: "ip") String? ip
});




}
/// @nodoc
class __$AttendanceCheckEventDtoCopyWithImpl<$Res>
    implements _$AttendanceCheckEventDtoCopyWith<$Res> {
  __$AttendanceCheckEventDtoCopyWithImpl(this._self, this._then);

  final _AttendanceCheckEventDto _self;
  final $Res Function(_AttendanceCheckEventDto) _then;

/// Create a copy of AttendanceCheckEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? location = freezed,Object? ip = freezed,}) {
  return _then(_AttendanceCheckEventDto(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceDurationsDto {

@JsonKey(name: "worked") DurationItemDto? get worked;@JsonKey(name: "overtime") DurationItemDto? get overtime;@JsonKey(name: "breaks") DurationItemDto? get breaks;
/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDurationsDtoCopyWith<AttendanceDurationsDto> get copyWith => _$AttendanceDurationsDtoCopyWithImpl<AttendanceDurationsDto>(this as AttendanceDurationsDto, _$identity);

  /// Serializes this AttendanceDurationsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDurationsDto&&(identical(other.worked, worked) || other.worked == worked)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.breaks, breaks) || other.breaks == breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,worked,overtime,breaks);

@override
String toString() {
  return 'AttendanceDurationsDto(worked: $worked, overtime: $overtime, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class $AttendanceDurationsDtoCopyWith<$Res>  {
  factory $AttendanceDurationsDtoCopyWith(AttendanceDurationsDto value, $Res Function(AttendanceDurationsDto) _then) = _$AttendanceDurationsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "worked") DurationItemDto? worked,@JsonKey(name: "overtime") DurationItemDto? overtime,@JsonKey(name: "breaks") DurationItemDto? breaks
});


$DurationItemDtoCopyWith<$Res>? get worked;$DurationItemDtoCopyWith<$Res>? get overtime;$DurationItemDtoCopyWith<$Res>? get breaks;

}
/// @nodoc
class _$AttendanceDurationsDtoCopyWithImpl<$Res>
    implements $AttendanceDurationsDtoCopyWith<$Res> {
  _$AttendanceDurationsDtoCopyWithImpl(this._self, this._then);

  final AttendanceDurationsDto _self;
  final $Res Function(AttendanceDurationsDto) _then;

/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? worked = freezed,Object? overtime = freezed,Object? breaks = freezed,}) {
  return _then(_self.copyWith(
worked: freezed == worked ? _self.worked : worked // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,breaks: freezed == breaks ? _self.breaks : breaks // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,
  ));
}
/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get worked {
    if (_self.worked == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.worked!, (value) {
    return _then(_self.copyWith(worked: value));
  });
}/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get overtime {
    if (_self.overtime == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.overtime!, (value) {
    return _then(_self.copyWith(overtime: value));
  });
}/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get breaks {
    if (_self.breaks == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.breaks!, (value) {
    return _then(_self.copyWith(breaks: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceDurationsDto].
extension AttendanceDurationsDtoPatterns on AttendanceDurationsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDurationsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDurationsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDurationsDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDurationsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDurationsDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDurationsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "worked")  DurationItemDto? worked, @JsonKey(name: "overtime")  DurationItemDto? overtime, @JsonKey(name: "breaks")  DurationItemDto? breaks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDurationsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "worked")  DurationItemDto? worked, @JsonKey(name: "overtime")  DurationItemDto? overtime, @JsonKey(name: "breaks")  DurationItemDto? breaks)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDurationsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "worked")  DurationItemDto? worked, @JsonKey(name: "overtime")  DurationItemDto? overtime, @JsonKey(name: "breaks")  DurationItemDto? breaks)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDurationsDto() when $default != null:
return $default(_that.worked,_that.overtime,_that.breaks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceDurationsDto implements AttendanceDurationsDto {
  const _AttendanceDurationsDto({@JsonKey(name: "worked") this.worked, @JsonKey(name: "overtime") this.overtime, @JsonKey(name: "breaks") this.breaks});
  factory _AttendanceDurationsDto.fromJson(Map<String, dynamic> json) => _$AttendanceDurationsDtoFromJson(json);

@override@JsonKey(name: "worked") final  DurationItemDto? worked;
@override@JsonKey(name: "overtime") final  DurationItemDto? overtime;
@override@JsonKey(name: "breaks") final  DurationItemDto? breaks;

/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDurationsDtoCopyWith<_AttendanceDurationsDto> get copyWith => __$AttendanceDurationsDtoCopyWithImpl<_AttendanceDurationsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceDurationsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDurationsDto&&(identical(other.worked, worked) || other.worked == worked)&&(identical(other.overtime, overtime) || other.overtime == overtime)&&(identical(other.breaks, breaks) || other.breaks == breaks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,worked,overtime,breaks);

@override
String toString() {
  return 'AttendanceDurationsDto(worked: $worked, overtime: $overtime, breaks: $breaks)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDurationsDtoCopyWith<$Res> implements $AttendanceDurationsDtoCopyWith<$Res> {
  factory _$AttendanceDurationsDtoCopyWith(_AttendanceDurationsDto value, $Res Function(_AttendanceDurationsDto) _then) = __$AttendanceDurationsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "worked") DurationItemDto? worked,@JsonKey(name: "overtime") DurationItemDto? overtime,@JsonKey(name: "breaks") DurationItemDto? breaks
});


@override $DurationItemDtoCopyWith<$Res>? get worked;@override $DurationItemDtoCopyWith<$Res>? get overtime;@override $DurationItemDtoCopyWith<$Res>? get breaks;

}
/// @nodoc
class __$AttendanceDurationsDtoCopyWithImpl<$Res>
    implements _$AttendanceDurationsDtoCopyWith<$Res> {
  __$AttendanceDurationsDtoCopyWithImpl(this._self, this._then);

  final _AttendanceDurationsDto _self;
  final $Res Function(_AttendanceDurationsDto) _then;

/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? worked = freezed,Object? overtime = freezed,Object? breaks = freezed,}) {
  return _then(_AttendanceDurationsDto(
worked: freezed == worked ? _self.worked : worked // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,overtime: freezed == overtime ? _self.overtime : overtime // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,breaks: freezed == breaks ? _self.breaks : breaks // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,
  ));
}

/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get worked {
    if (_self.worked == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.worked!, (value) {
    return _then(_self.copyWith(worked: value));
  });
}/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get overtime {
    if (_self.overtime == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.overtime!, (value) {
    return _then(_self.copyWith(overtime: value));
  });
}/// Create a copy of AttendanceDurationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get breaks {
    if (_self.breaks == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.breaks!, (value) {
    return _then(_self.copyWith(breaks: value));
  });
}
}


/// @nodoc
mixin _$DurationItemDto {

@JsonKey(name: "total_seconds") int? get totalSeconds;@JsonKey(name: "formatted") String? get formatted;
/// Create a copy of DurationItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<DurationItemDto> get copyWith => _$DurationItemDtoCopyWithImpl<DurationItemDto>(this as DurationItemDto, _$identity);

  /// Serializes this DurationItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DurationItemDto&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSeconds,formatted);

@override
String toString() {
  return 'DurationItemDto(totalSeconds: $totalSeconds, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class $DurationItemDtoCopyWith<$Res>  {
  factory $DurationItemDtoCopyWith(DurationItemDto value, $Res Function(DurationItemDto) _then) = _$DurationItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "total_seconds") int? totalSeconds,@JsonKey(name: "formatted") String? formatted
});




}
/// @nodoc
class _$DurationItemDtoCopyWithImpl<$Res>
    implements $DurationItemDtoCopyWith<$Res> {
  _$DurationItemDtoCopyWithImpl(this._self, this._then);

  final DurationItemDto _self;
  final $Res Function(DurationItemDto) _then;

/// Create a copy of DurationItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSeconds = freezed,Object? formatted = freezed,}) {
  return _then(_self.copyWith(
totalSeconds: freezed == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int?,formatted: freezed == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DurationItemDto].
extension DurationItemDtoPatterns on DurationItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DurationItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DurationItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DurationItemDto value)  $default,){
final _that = this;
switch (_that) {
case _DurationItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DurationItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _DurationItemDto() when $default != null:
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
case _DurationItemDto() when $default != null:
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
case _DurationItemDto():
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
case _DurationItemDto() when $default != null:
return $default(_that.totalSeconds,_that.formatted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DurationItemDto implements DurationItemDto {
  const _DurationItemDto({@JsonKey(name: "total_seconds") this.totalSeconds, @JsonKey(name: "formatted") this.formatted});
  factory _DurationItemDto.fromJson(Map<String, dynamic> json) => _$DurationItemDtoFromJson(json);

@override@JsonKey(name: "total_seconds") final  int? totalSeconds;
@override@JsonKey(name: "formatted") final  String? formatted;

/// Create a copy of DurationItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationItemDtoCopyWith<_DurationItemDto> get copyWith => __$DurationItemDtoCopyWithImpl<_DurationItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DurationItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationItemDto&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSeconds,formatted);

@override
String toString() {
  return 'DurationItemDto(totalSeconds: $totalSeconds, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class _$DurationItemDtoCopyWith<$Res> implements $DurationItemDtoCopyWith<$Res> {
  factory _$DurationItemDtoCopyWith(_DurationItemDto value, $Res Function(_DurationItemDto) _then) = __$DurationItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "total_seconds") int? totalSeconds,@JsonKey(name: "formatted") String? formatted
});




}
/// @nodoc
class __$DurationItemDtoCopyWithImpl<$Res>
    implements _$DurationItemDtoCopyWith<$Res> {
  __$DurationItemDtoCopyWithImpl(this._self, this._then);

  final _DurationItemDto _self;
  final $Res Function(_DurationItemDto) _then;

/// Create a copy of DurationItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSeconds = freezed,Object? formatted = freezed,}) {
  return _then(_DurationItemDto(
totalSeconds: freezed == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int?,formatted: freezed == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceBreakItemDto {

@JsonKey(name: "id") int? get id;@JsonKey(name: "attendance_id") int? get attendanceId;@JsonKey(name: "time") AttendanceBreakTimeDto? get time;@JsonKey(name: "reason") String? get reason;@JsonKey(name: "duration") DurationItemDto? get duration;@JsonKey(name: "is_active") bool? get isActive;
/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceBreakItemDtoCopyWith<AttendanceBreakItemDto> get copyWith => _$AttendanceBreakItemDtoCopyWithImpl<AttendanceBreakItemDto>(this as AttendanceBreakItemDto, _$identity);

  /// Serializes this AttendanceBreakItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceBreakItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.time, time) || other.time == time)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attendanceId,time,reason,duration,isActive);

@override
String toString() {
  return 'AttendanceBreakItemDto(id: $id, attendanceId: $attendanceId, time: $time, reason: $reason, duration: $duration, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $AttendanceBreakItemDtoCopyWith<$Res>  {
  factory $AttendanceBreakItemDtoCopyWith(AttendanceBreakItemDto value, $Res Function(AttendanceBreakItemDto) _then) = _$AttendanceBreakItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "attendance_id") int? attendanceId,@JsonKey(name: "time") AttendanceBreakTimeDto? time,@JsonKey(name: "reason") String? reason,@JsonKey(name: "duration") DurationItemDto? duration,@JsonKey(name: "is_active") bool? isActive
});


$AttendanceBreakTimeDtoCopyWith<$Res>? get time;$DurationItemDtoCopyWith<$Res>? get duration;

}
/// @nodoc
class _$AttendanceBreakItemDtoCopyWithImpl<$Res>
    implements $AttendanceBreakItemDtoCopyWith<$Res> {
  _$AttendanceBreakItemDtoCopyWithImpl(this._self, this._then);

  final AttendanceBreakItemDto _self;
  final $Res Function(AttendanceBreakItemDto) _then;

/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? attendanceId = freezed,Object? time = freezed,Object? reason = freezed,Object? duration = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AttendanceBreakTimeDto?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceBreakTimeDtoCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $AttendanceBreakTimeDtoCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceBreakItemDto].
extension AttendanceBreakItemDtoPatterns on AttendanceBreakItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceBreakItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceBreakItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceBreakItemDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceBreakItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceBreakItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceBreakItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  AttendanceBreakTimeDto? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationItemDto? duration, @JsonKey(name: "is_active")  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceBreakItemDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  AttendanceBreakTimeDto? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationItemDto? duration, @JsonKey(name: "is_active")  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _AttendanceBreakItemDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "attendance_id")  int? attendanceId, @JsonKey(name: "time")  AttendanceBreakTimeDto? time, @JsonKey(name: "reason")  String? reason, @JsonKey(name: "duration")  DurationItemDto? duration, @JsonKey(name: "is_active")  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceBreakItemDto() when $default != null:
return $default(_that.id,_that.attendanceId,_that.time,_that.reason,_that.duration,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceBreakItemDto implements AttendanceBreakItemDto {
  const _AttendanceBreakItemDto({@JsonKey(name: "id") this.id, @JsonKey(name: "attendance_id") this.attendanceId, @JsonKey(name: "time") this.time, @JsonKey(name: "reason") this.reason, @JsonKey(name: "duration") this.duration, @JsonKey(name: "is_active") this.isActive});
  factory _AttendanceBreakItemDto.fromJson(Map<String, dynamic> json) => _$AttendanceBreakItemDtoFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "attendance_id") final  int? attendanceId;
@override@JsonKey(name: "time") final  AttendanceBreakTimeDto? time;
@override@JsonKey(name: "reason") final  String? reason;
@override@JsonKey(name: "duration") final  DurationItemDto? duration;
@override@JsonKey(name: "is_active") final  bool? isActive;

/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceBreakItemDtoCopyWith<_AttendanceBreakItemDto> get copyWith => __$AttendanceBreakItemDtoCopyWithImpl<_AttendanceBreakItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceBreakItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceBreakItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.time, time) || other.time == time)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attendanceId,time,reason,duration,isActive);

@override
String toString() {
  return 'AttendanceBreakItemDto(id: $id, attendanceId: $attendanceId, time: $time, reason: $reason, duration: $duration, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$AttendanceBreakItemDtoCopyWith<$Res> implements $AttendanceBreakItemDtoCopyWith<$Res> {
  factory _$AttendanceBreakItemDtoCopyWith(_AttendanceBreakItemDto value, $Res Function(_AttendanceBreakItemDto) _then) = __$AttendanceBreakItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "attendance_id") int? attendanceId,@JsonKey(name: "time") AttendanceBreakTimeDto? time,@JsonKey(name: "reason") String? reason,@JsonKey(name: "duration") DurationItemDto? duration,@JsonKey(name: "is_active") bool? isActive
});


@override $AttendanceBreakTimeDtoCopyWith<$Res>? get time;@override $DurationItemDtoCopyWith<$Res>? get duration;

}
/// @nodoc
class __$AttendanceBreakItemDtoCopyWithImpl<$Res>
    implements _$AttendanceBreakItemDtoCopyWith<$Res> {
  __$AttendanceBreakItemDtoCopyWithImpl(this._self, this._then);

  final _AttendanceBreakItemDto _self;
  final $Res Function(_AttendanceBreakItemDto) _then;

/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? attendanceId = freezed,Object? time = freezed,Object? reason = freezed,Object? duration = freezed,Object? isActive = freezed,}) {
  return _then(_AttendanceBreakItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as int?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AttendanceBreakTimeDto?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as DurationItemDto?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceBreakTimeDtoCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $AttendanceBreakTimeDtoCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of AttendanceBreakItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationItemDtoCopyWith<$Res>? get duration {
    if (_self.duration == null) {
    return null;
  }

  return $DurationItemDtoCopyWith<$Res>(_self.duration!, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// @nodoc
mixin _$AttendanceBreakTimeDto {

@JsonKey(name: "start") String? get start;@JsonKey(name: "end") String? get end;
/// Create a copy of AttendanceBreakTimeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceBreakTimeDtoCopyWith<AttendanceBreakTimeDto> get copyWith => _$AttendanceBreakTimeDtoCopyWithImpl<AttendanceBreakTimeDto>(this as AttendanceBreakTimeDto, _$identity);

  /// Serializes this AttendanceBreakTimeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceBreakTimeDto&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'AttendanceBreakTimeDto(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $AttendanceBreakTimeDtoCopyWith<$Res>  {
  factory $AttendanceBreakTimeDtoCopyWith(AttendanceBreakTimeDto value, $Res Function(AttendanceBreakTimeDto) _then) = _$AttendanceBreakTimeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "start") String? start,@JsonKey(name: "end") String? end
});




}
/// @nodoc
class _$AttendanceBreakTimeDtoCopyWithImpl<$Res>
    implements $AttendanceBreakTimeDtoCopyWith<$Res> {
  _$AttendanceBreakTimeDtoCopyWithImpl(this._self, this._then);

  final AttendanceBreakTimeDto _self;
  final $Res Function(AttendanceBreakTimeDto) _then;

/// Create a copy of AttendanceBreakTimeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_self.copyWith(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceBreakTimeDto].
extension AttendanceBreakTimeDtoPatterns on AttendanceBreakTimeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceBreakTimeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceBreakTimeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceBreakTimeDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceBreakTimeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceBreakTimeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceBreakTimeDto() when $default != null:
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
case _AttendanceBreakTimeDto() when $default != null:
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
case _AttendanceBreakTimeDto():
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
case _AttendanceBreakTimeDto() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceBreakTimeDto implements AttendanceBreakTimeDto {
  const _AttendanceBreakTimeDto({@JsonKey(name: "start") this.start, @JsonKey(name: "end") this.end});
  factory _AttendanceBreakTimeDto.fromJson(Map<String, dynamic> json) => _$AttendanceBreakTimeDtoFromJson(json);

@override@JsonKey(name: "start") final  String? start;
@override@JsonKey(name: "end") final  String? end;

/// Create a copy of AttendanceBreakTimeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceBreakTimeDtoCopyWith<_AttendanceBreakTimeDto> get copyWith => __$AttendanceBreakTimeDtoCopyWithImpl<_AttendanceBreakTimeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceBreakTimeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceBreakTimeDto&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'AttendanceBreakTimeDto(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$AttendanceBreakTimeDtoCopyWith<$Res> implements $AttendanceBreakTimeDtoCopyWith<$Res> {
  factory _$AttendanceBreakTimeDtoCopyWith(_AttendanceBreakTimeDto value, $Res Function(_AttendanceBreakTimeDto) _then) = __$AttendanceBreakTimeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "start") String? start,@JsonKey(name: "end") String? end
});




}
/// @nodoc
class __$AttendanceBreakTimeDtoCopyWithImpl<$Res>
    implements _$AttendanceBreakTimeDtoCopyWith<$Res> {
  __$AttendanceBreakTimeDtoCopyWithImpl(this._self, this._then);

  final _AttendanceBreakTimeDto _self;
  final $Res Function(_AttendanceBreakTimeDto) _then;

/// Create a copy of AttendanceBreakTimeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_AttendanceBreakTimeDto(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
