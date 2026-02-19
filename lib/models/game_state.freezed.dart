// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameState {

 String get id; Board get board; Difficulty get difficulty;@DurationConverter() Duration get elapsed; List<GameAction> get undoStack; List<GameAction> get redoStack; int get hintsUsed; bool get isCompleted; bool get isPaused; CellPosition? get selectedCell;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.id, id) || other.id == id)&&(identical(other.board, board) || other.board == board)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&const DeepCollectionEquality().equals(other.undoStack, undoStack)&&const DeepCollectionEquality().equals(other.redoStack, redoStack)&&(identical(other.hintsUsed, hintsUsed) || other.hintsUsed == hintsUsed)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.selectedCell, selectedCell) || other.selectedCell == selectedCell));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,board,difficulty,elapsed,const DeepCollectionEquality().hash(undoStack),const DeepCollectionEquality().hash(redoStack),hintsUsed,isCompleted,isPaused,selectedCell);

@override
String toString() {
  return 'GameState(id: $id, board: $board, difficulty: $difficulty, elapsed: $elapsed, undoStack: $undoStack, redoStack: $redoStack, hintsUsed: $hintsUsed, isCompleted: $isCompleted, isPaused: $isPaused, selectedCell: $selectedCell)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 String id, Board board, Difficulty difficulty,@DurationConverter() Duration elapsed, List<GameAction> undoStack, List<GameAction> redoStack, int hintsUsed, bool isCompleted, bool isPaused, CellPosition? selectedCell
});


$BoardCopyWith<$Res> get board;$CellPositionCopyWith<$Res>? get selectedCell;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? board = null,Object? difficulty = null,Object? elapsed = null,Object? undoStack = null,Object? redoStack = null,Object? hintsUsed = null,Object? isCompleted = null,Object? isPaused = null,Object? selectedCell = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,undoStack: null == undoStack ? _self.undoStack : undoStack // ignore: cast_nullable_to_non_nullable
as List<GameAction>,redoStack: null == redoStack ? _self.redoStack : redoStack // ignore: cast_nullable_to_non_nullable
as List<GameAction>,hintsUsed: null == hintsUsed ? _self.hintsUsed : hintsUsed // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,selectedCell: freezed == selectedCell ? _self.selectedCell : selectedCell // ignore: cast_nullable_to_non_nullable
as CellPosition?,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CellPositionCopyWith<$Res>? get selectedCell {
    if (_self.selectedCell == null) {
    return null;
  }

  return $CellPositionCopyWith<$Res>(_self.selectedCell!, (value) {
    return _then(_self.copyWith(selectedCell: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Board board,  Difficulty difficulty, @DurationConverter()  Duration elapsed,  List<GameAction> undoStack,  List<GameAction> redoStack,  int hintsUsed,  bool isCompleted,  bool isPaused,  CellPosition? selectedCell)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.id,_that.board,_that.difficulty,_that.elapsed,_that.undoStack,_that.redoStack,_that.hintsUsed,_that.isCompleted,_that.isPaused,_that.selectedCell);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Board board,  Difficulty difficulty, @DurationConverter()  Duration elapsed,  List<GameAction> undoStack,  List<GameAction> redoStack,  int hintsUsed,  bool isCompleted,  bool isPaused,  CellPosition? selectedCell)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.id,_that.board,_that.difficulty,_that.elapsed,_that.undoStack,_that.redoStack,_that.hintsUsed,_that.isCompleted,_that.isPaused,_that.selectedCell);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Board board,  Difficulty difficulty, @DurationConverter()  Duration elapsed,  List<GameAction> undoStack,  List<GameAction> redoStack,  int hintsUsed,  bool isCompleted,  bool isPaused,  CellPosition? selectedCell)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.id,_that.board,_that.difficulty,_that.elapsed,_that.undoStack,_that.redoStack,_that.hintsUsed,_that.isCompleted,_that.isPaused,_that.selectedCell);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameState implements GameState {
  const _GameState({required this.id, required this.board, required this.difficulty, @DurationConverter() this.elapsed = Duration.zero, final  List<GameAction> undoStack = const [], final  List<GameAction> redoStack = const [], this.hintsUsed = 0, this.isCompleted = false, this.isPaused = false, this.selectedCell}): _undoStack = undoStack,_redoStack = redoStack;
  factory _GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);

@override final  String id;
@override final  Board board;
@override final  Difficulty difficulty;
@override@JsonKey()@DurationConverter() final  Duration elapsed;
 final  List<GameAction> _undoStack;
@override@JsonKey() List<GameAction> get undoStack {
  if (_undoStack is EqualUnmodifiableListView) return _undoStack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_undoStack);
}

 final  List<GameAction> _redoStack;
@override@JsonKey() List<GameAction> get redoStack {
  if (_redoStack is EqualUnmodifiableListView) return _redoStack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redoStack);
}

@override@JsonKey() final  int hintsUsed;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  bool isPaused;
@override final  CellPosition? selectedCell;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.id, id) || other.id == id)&&(identical(other.board, board) || other.board == board)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&const DeepCollectionEquality().equals(other._undoStack, _undoStack)&&const DeepCollectionEquality().equals(other._redoStack, _redoStack)&&(identical(other.hintsUsed, hintsUsed) || other.hintsUsed == hintsUsed)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.selectedCell, selectedCell) || other.selectedCell == selectedCell));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,board,difficulty,elapsed,const DeepCollectionEquality().hash(_undoStack),const DeepCollectionEquality().hash(_redoStack),hintsUsed,isCompleted,isPaused,selectedCell);

@override
String toString() {
  return 'GameState(id: $id, board: $board, difficulty: $difficulty, elapsed: $elapsed, undoStack: $undoStack, redoStack: $redoStack, hintsUsed: $hintsUsed, isCompleted: $isCompleted, isPaused: $isPaused, selectedCell: $selectedCell)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 String id, Board board, Difficulty difficulty,@DurationConverter() Duration elapsed, List<GameAction> undoStack, List<GameAction> redoStack, int hintsUsed, bool isCompleted, bool isPaused, CellPosition? selectedCell
});


@override $BoardCopyWith<$Res> get board;@override $CellPositionCopyWith<$Res>? get selectedCell;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? board = null,Object? difficulty = null,Object? elapsed = null,Object? undoStack = null,Object? redoStack = null,Object? hintsUsed = null,Object? isCompleted = null,Object? isPaused = null,Object? selectedCell = freezed,}) {
  return _then(_GameState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,undoStack: null == undoStack ? _self._undoStack : undoStack // ignore: cast_nullable_to_non_nullable
as List<GameAction>,redoStack: null == redoStack ? _self._redoStack : redoStack // ignore: cast_nullable_to_non_nullable
as List<GameAction>,hintsUsed: null == hintsUsed ? _self.hintsUsed : hintsUsed // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,selectedCell: freezed == selectedCell ? _self.selectedCell : selectedCell // ignore: cast_nullable_to_non_nullable
as CellPosition?,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CellPositionCopyWith<$Res>? get selectedCell {
    if (_self.selectedCell == null) {
    return null;
  }

  return $CellPositionCopyWith<$Res>(_self.selectedCell!, (value) {
    return _then(_self.copyWith(selectedCell: value));
  });
}
}

// dart format on
