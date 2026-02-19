// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cell {

 int get row; int get col; int get value; bool get isGiven; Set<int> get memos; bool get isError;
/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CellCopyWith<Cell> get copyWith => _$CellCopyWithImpl<Cell>(this as Cell, _$identity);

  /// Serializes this Cell to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cell&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.value, value) || other.value == value)&&(identical(other.isGiven, isGiven) || other.isGiven == isGiven)&&const DeepCollectionEquality().equals(other.memos, memos)&&(identical(other.isError, isError) || other.isError == isError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col,value,isGiven,const DeepCollectionEquality().hash(memos),isError);

@override
String toString() {
  return 'Cell(row: $row, col: $col, value: $value, isGiven: $isGiven, memos: $memos, isError: $isError)';
}


}

/// @nodoc
abstract mixin class $CellCopyWith<$Res>  {
  factory $CellCopyWith(Cell value, $Res Function(Cell) _then) = _$CellCopyWithImpl;
@useResult
$Res call({
 int row, int col, int value, bool isGiven, Set<int> memos, bool isError
});




}
/// @nodoc
class _$CellCopyWithImpl<$Res>
    implements $CellCopyWith<$Res> {
  _$CellCopyWithImpl(this._self, this._then);

  final Cell _self;
  final $Res Function(Cell) _then;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? row = null,Object? col = null,Object? value = null,Object? isGiven = null,Object? memos = null,Object? isError = null,}) {
  return _then(_self.copyWith(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,isGiven: null == isGiven ? _self.isGiven : isGiven // ignore: cast_nullable_to_non_nullable
as bool,memos: null == memos ? _self.memos : memos // ignore: cast_nullable_to_non_nullable
as Set<int>,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Cell].
extension CellPatterns on Cell {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cell value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cell() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cell value)  $default,){
final _that = this;
switch (_that) {
case _Cell():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cell value)?  $default,){
final _that = this;
switch (_that) {
case _Cell() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int row,  int col,  int value,  bool isGiven,  Set<int> memos,  bool isError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cell() when $default != null:
return $default(_that.row,_that.col,_that.value,_that.isGiven,_that.memos,_that.isError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int row,  int col,  int value,  bool isGiven,  Set<int> memos,  bool isError)  $default,) {final _that = this;
switch (_that) {
case _Cell():
return $default(_that.row,_that.col,_that.value,_that.isGiven,_that.memos,_that.isError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int row,  int col,  int value,  bool isGiven,  Set<int> memos,  bool isError)?  $default,) {final _that = this;
switch (_that) {
case _Cell() when $default != null:
return $default(_that.row,_that.col,_that.value,_that.isGiven,_that.memos,_that.isError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cell implements Cell {
  const _Cell({required this.row, required this.col, this.value = 0, this.isGiven = false, final  Set<int> memos = const {}, this.isError = false}): _memos = memos;
  factory _Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);

@override final  int row;
@override final  int col;
@override@JsonKey() final  int value;
@override@JsonKey() final  bool isGiven;
 final  Set<int> _memos;
@override@JsonKey() Set<int> get memos {
  if (_memos is EqualUnmodifiableSetView) return _memos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_memos);
}

@override@JsonKey() final  bool isError;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CellCopyWith<_Cell> get copyWith => __$CellCopyWithImpl<_Cell>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CellToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cell&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.value, value) || other.value == value)&&(identical(other.isGiven, isGiven) || other.isGiven == isGiven)&&const DeepCollectionEquality().equals(other._memos, _memos)&&(identical(other.isError, isError) || other.isError == isError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col,value,isGiven,const DeepCollectionEquality().hash(_memos),isError);

@override
String toString() {
  return 'Cell(row: $row, col: $col, value: $value, isGiven: $isGiven, memos: $memos, isError: $isError)';
}


}

/// @nodoc
abstract mixin class _$CellCopyWith<$Res> implements $CellCopyWith<$Res> {
  factory _$CellCopyWith(_Cell value, $Res Function(_Cell) _then) = __$CellCopyWithImpl;
@override @useResult
$Res call({
 int row, int col, int value, bool isGiven, Set<int> memos, bool isError
});




}
/// @nodoc
class __$CellCopyWithImpl<$Res>
    implements _$CellCopyWith<$Res> {
  __$CellCopyWithImpl(this._self, this._then);

  final _Cell _self;
  final $Res Function(_Cell) _then;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? col = null,Object? value = null,Object? isGiven = null,Object? memos = null,Object? isError = null,}) {
  return _then(_Cell(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,isGiven: null == isGiven ? _self.isGiven : isGiven // ignore: cast_nullable_to_non_nullable
as bool,memos: null == memos ? _self._memos : memos // ignore: cast_nullable_to_non_nullable
as Set<int>,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CellPosition {

 int get row; int get col;
/// Create a copy of CellPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CellPositionCopyWith<CellPosition> get copyWith => _$CellPositionCopyWithImpl<CellPosition>(this as CellPosition, _$identity);

  /// Serializes this CellPosition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CellPosition&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col);

@override
String toString() {
  return 'CellPosition(row: $row, col: $col)';
}


}

/// @nodoc
abstract mixin class $CellPositionCopyWith<$Res>  {
  factory $CellPositionCopyWith(CellPosition value, $Res Function(CellPosition) _then) = _$CellPositionCopyWithImpl;
@useResult
$Res call({
 int row, int col
});




}
/// @nodoc
class _$CellPositionCopyWithImpl<$Res>
    implements $CellPositionCopyWith<$Res> {
  _$CellPositionCopyWithImpl(this._self, this._then);

  final CellPosition _self;
  final $Res Function(CellPosition) _then;

/// Create a copy of CellPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? row = null,Object? col = null,}) {
  return _then(_self.copyWith(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CellPosition].
extension CellPositionPatterns on CellPosition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CellPosition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CellPosition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CellPosition value)  $default,){
final _that = this;
switch (_that) {
case _CellPosition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CellPosition value)?  $default,){
final _that = this;
switch (_that) {
case _CellPosition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int row,  int col)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CellPosition() when $default != null:
return $default(_that.row,_that.col);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int row,  int col)  $default,) {final _that = this;
switch (_that) {
case _CellPosition():
return $default(_that.row,_that.col);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int row,  int col)?  $default,) {final _that = this;
switch (_that) {
case _CellPosition() when $default != null:
return $default(_that.row,_that.col);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CellPosition implements CellPosition {
  const _CellPosition({required this.row, required this.col});
  factory _CellPosition.fromJson(Map<String, dynamic> json) => _$CellPositionFromJson(json);

@override final  int row;
@override final  int col;

/// Create a copy of CellPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CellPositionCopyWith<_CellPosition> get copyWith => __$CellPositionCopyWithImpl<_CellPosition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CellPositionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CellPosition&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col);

@override
String toString() {
  return 'CellPosition(row: $row, col: $col)';
}


}

/// @nodoc
abstract mixin class _$CellPositionCopyWith<$Res> implements $CellPositionCopyWith<$Res> {
  factory _$CellPositionCopyWith(_CellPosition value, $Res Function(_CellPosition) _then) = __$CellPositionCopyWithImpl;
@override @useResult
$Res call({
 int row, int col
});




}
/// @nodoc
class __$CellPositionCopyWithImpl<$Res>
    implements _$CellPositionCopyWith<$Res> {
  __$CellPositionCopyWithImpl(this._self, this._then);

  final _CellPosition _self;
  final $Res Function(_CellPosition) _then;

/// Create a copy of CellPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? col = null,}) {
  return _then(_CellPosition(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
