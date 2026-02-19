// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GameAction _$GameActionFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'setValue':
          return SetValueAction.fromJson(
            json
          );
                case 'toggleMemo':
          return ToggleMemoAction.fromJson(
            json
          );
                case 'clearCell':
          return ClearCellAction.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GameAction',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GameAction {

 int get row; int get col;
/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameActionCopyWith<GameAction> get copyWith => _$GameActionCopyWithImpl<GameAction>(this as GameAction, _$identity);

  /// Serializes this GameAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameAction&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col);

@override
String toString() {
  return 'GameAction(row: $row, col: $col)';
}


}

/// @nodoc
abstract mixin class $GameActionCopyWith<$Res>  {
  factory $GameActionCopyWith(GameAction value, $Res Function(GameAction) _then) = _$GameActionCopyWithImpl;
@useResult
$Res call({
 int row, int col
});




}
/// @nodoc
class _$GameActionCopyWithImpl<$Res>
    implements $GameActionCopyWith<$Res> {
  _$GameActionCopyWithImpl(this._self, this._then);

  final GameAction _self;
  final $Res Function(GameAction) _then;

/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? row = null,Object? col = null,}) {
  return _then(_self.copyWith(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameAction].
extension GameActionPatterns on GameAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SetValueAction value)?  setValue,TResult Function( ToggleMemoAction value)?  toggleMemo,TResult Function( ClearCellAction value)?  clearCell,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SetValueAction() when setValue != null:
return setValue(_that);case ToggleMemoAction() when toggleMemo != null:
return toggleMemo(_that);case ClearCellAction() when clearCell != null:
return clearCell(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SetValueAction value)  setValue,required TResult Function( ToggleMemoAction value)  toggleMemo,required TResult Function( ClearCellAction value)  clearCell,}){
final _that = this;
switch (_that) {
case SetValueAction():
return setValue(_that);case ToggleMemoAction():
return toggleMemo(_that);case ClearCellAction():
return clearCell(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SetValueAction value)?  setValue,TResult? Function( ToggleMemoAction value)?  toggleMemo,TResult? Function( ClearCellAction value)?  clearCell,}){
final _that = this;
switch (_that) {
case SetValueAction() when setValue != null:
return setValue(_that);case ToggleMemoAction() when toggleMemo != null:
return toggleMemo(_that);case ClearCellAction() when clearCell != null:
return clearCell(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int row,  int col,  int previousValue,  int newValue)?  setValue,TResult Function( int row,  int col,  int number)?  toggleMemo,TResult Function( int row,  int col,  int previousValue,  Set<int> previousMemos)?  clearCell,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SetValueAction() when setValue != null:
return setValue(_that.row,_that.col,_that.previousValue,_that.newValue);case ToggleMemoAction() when toggleMemo != null:
return toggleMemo(_that.row,_that.col,_that.number);case ClearCellAction() when clearCell != null:
return clearCell(_that.row,_that.col,_that.previousValue,_that.previousMemos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int row,  int col,  int previousValue,  int newValue)  setValue,required TResult Function( int row,  int col,  int number)  toggleMemo,required TResult Function( int row,  int col,  int previousValue,  Set<int> previousMemos)  clearCell,}) {final _that = this;
switch (_that) {
case SetValueAction():
return setValue(_that.row,_that.col,_that.previousValue,_that.newValue);case ToggleMemoAction():
return toggleMemo(_that.row,_that.col,_that.number);case ClearCellAction():
return clearCell(_that.row,_that.col,_that.previousValue,_that.previousMemos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int row,  int col,  int previousValue,  int newValue)?  setValue,TResult? Function( int row,  int col,  int number)?  toggleMemo,TResult? Function( int row,  int col,  int previousValue,  Set<int> previousMemos)?  clearCell,}) {final _that = this;
switch (_that) {
case SetValueAction() when setValue != null:
return setValue(_that.row,_that.col,_that.previousValue,_that.newValue);case ToggleMemoAction() when toggleMemo != null:
return toggleMemo(_that.row,_that.col,_that.number);case ClearCellAction() when clearCell != null:
return clearCell(_that.row,_that.col,_that.previousValue,_that.previousMemos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SetValueAction implements GameAction {
  const SetValueAction({required this.row, required this.col, required this.previousValue, required this.newValue, final  String? $type}): $type = $type ?? 'setValue';
  factory SetValueAction.fromJson(Map<String, dynamic> json) => _$SetValueActionFromJson(json);

@override final  int row;
@override final  int col;
 final  int previousValue;
 final  int newValue;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetValueActionCopyWith<SetValueAction> get copyWith => _$SetValueActionCopyWithImpl<SetValueAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetValueActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetValueAction&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.previousValue, previousValue) || other.previousValue == previousValue)&&(identical(other.newValue, newValue) || other.newValue == newValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col,previousValue,newValue);

@override
String toString() {
  return 'GameAction.setValue(row: $row, col: $col, previousValue: $previousValue, newValue: $newValue)';
}


}

/// @nodoc
abstract mixin class $SetValueActionCopyWith<$Res> implements $GameActionCopyWith<$Res> {
  factory $SetValueActionCopyWith(SetValueAction value, $Res Function(SetValueAction) _then) = _$SetValueActionCopyWithImpl;
@override @useResult
$Res call({
 int row, int col, int previousValue, int newValue
});




}
/// @nodoc
class _$SetValueActionCopyWithImpl<$Res>
    implements $SetValueActionCopyWith<$Res> {
  _$SetValueActionCopyWithImpl(this._self, this._then);

  final SetValueAction _self;
  final $Res Function(SetValueAction) _then;

/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? col = null,Object? previousValue = null,Object? newValue = null,}) {
  return _then(SetValueAction(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,previousValue: null == previousValue ? _self.previousValue : previousValue // ignore: cast_nullable_to_non_nullable
as int,newValue: null == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToggleMemoAction implements GameAction {
  const ToggleMemoAction({required this.row, required this.col, required this.number, final  String? $type}): $type = $type ?? 'toggleMemo';
  factory ToggleMemoAction.fromJson(Map<String, dynamic> json) => _$ToggleMemoActionFromJson(json);

@override final  int row;
@override final  int col;
 final  int number;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleMemoActionCopyWith<ToggleMemoAction> get copyWith => _$ToggleMemoActionCopyWithImpl<ToggleMemoAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToggleMemoActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleMemoAction&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col,number);

@override
String toString() {
  return 'GameAction.toggleMemo(row: $row, col: $col, number: $number)';
}


}

/// @nodoc
abstract mixin class $ToggleMemoActionCopyWith<$Res> implements $GameActionCopyWith<$Res> {
  factory $ToggleMemoActionCopyWith(ToggleMemoAction value, $Res Function(ToggleMemoAction) _then) = _$ToggleMemoActionCopyWithImpl;
@override @useResult
$Res call({
 int row, int col, int number
});




}
/// @nodoc
class _$ToggleMemoActionCopyWithImpl<$Res>
    implements $ToggleMemoActionCopyWith<$Res> {
  _$ToggleMemoActionCopyWithImpl(this._self, this._then);

  final ToggleMemoAction _self;
  final $Res Function(ToggleMemoAction) _then;

/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? col = null,Object? number = null,}) {
  return _then(ToggleMemoAction(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ClearCellAction implements GameAction {
  const ClearCellAction({required this.row, required this.col, required this.previousValue, required final  Set<int> previousMemos, final  String? $type}): _previousMemos = previousMemos,$type = $type ?? 'clearCell';
  factory ClearCellAction.fromJson(Map<String, dynamic> json) => _$ClearCellActionFromJson(json);

@override final  int row;
@override final  int col;
 final  int previousValue;
 final  Set<int> _previousMemos;
 Set<int> get previousMemos {
  if (_previousMemos is EqualUnmodifiableSetView) return _previousMemos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_previousMemos);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClearCellActionCopyWith<ClearCellAction> get copyWith => _$ClearCellActionCopyWithImpl<ClearCellAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClearCellActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearCellAction&&(identical(other.row, row) || other.row == row)&&(identical(other.col, col) || other.col == col)&&(identical(other.previousValue, previousValue) || other.previousValue == previousValue)&&const DeepCollectionEquality().equals(other._previousMemos, _previousMemos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,col,previousValue,const DeepCollectionEquality().hash(_previousMemos));

@override
String toString() {
  return 'GameAction.clearCell(row: $row, col: $col, previousValue: $previousValue, previousMemos: $previousMemos)';
}


}

/// @nodoc
abstract mixin class $ClearCellActionCopyWith<$Res> implements $GameActionCopyWith<$Res> {
  factory $ClearCellActionCopyWith(ClearCellAction value, $Res Function(ClearCellAction) _then) = _$ClearCellActionCopyWithImpl;
@override @useResult
$Res call({
 int row, int col, int previousValue, Set<int> previousMemos
});




}
/// @nodoc
class _$ClearCellActionCopyWithImpl<$Res>
    implements $ClearCellActionCopyWith<$Res> {
  _$ClearCellActionCopyWithImpl(this._self, this._then);

  final ClearCellAction _self;
  final $Res Function(ClearCellAction) _then;

/// Create a copy of GameAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? col = null,Object? previousValue = null,Object? previousMemos = null,}) {
  return _then(ClearCellAction(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,col: null == col ? _self.col : col // ignore: cast_nullable_to_non_nullable
as int,previousValue: null == previousValue ? _self.previousValue : previousValue // ignore: cast_nullable_to_non_nullable
as int,previousMemos: null == previousMemos ? _self._previousMemos : previousMemos // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
