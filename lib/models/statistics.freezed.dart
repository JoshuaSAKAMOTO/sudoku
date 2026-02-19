// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Statistics {

 Map<Difficulty, DifficultyStats> get byDifficulty;
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsCopyWith<Statistics> get copyWith => _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistics&&const DeepCollectionEquality().equals(other.byDifficulty, byDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(byDifficulty));

@override
String toString() {
  return 'Statistics(byDifficulty: $byDifficulty)';
}


}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res>  {
  factory $StatisticsCopyWith(Statistics value, $Res Function(Statistics) _then) = _$StatisticsCopyWithImpl;
@useResult
$Res call({
 Map<Difficulty, DifficultyStats> byDifficulty
});




}
/// @nodoc
class _$StatisticsCopyWithImpl<$Res>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byDifficulty = null,}) {
  return _then(_self.copyWith(
byDifficulty: null == byDifficulty ? _self.byDifficulty : byDifficulty // ignore: cast_nullable_to_non_nullable
as Map<Difficulty, DifficultyStats>,
  ));
}

}


/// Adds pattern-matching-related methods to [Statistics].
extension StatisticsPatterns on Statistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Statistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Statistics value)  $default,){
final _that = this;
switch (_that) {
case _Statistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Statistics value)?  $default,){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<Difficulty, DifficultyStats> byDifficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.byDifficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<Difficulty, DifficultyStats> byDifficulty)  $default,) {final _that = this;
switch (_that) {
case _Statistics():
return $default(_that.byDifficulty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<Difficulty, DifficultyStats> byDifficulty)?  $default,) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.byDifficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Statistics implements Statistics {
  const _Statistics({final  Map<Difficulty, DifficultyStats> byDifficulty = const {}}): _byDifficulty = byDifficulty;
  factory _Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

 final  Map<Difficulty, DifficultyStats> _byDifficulty;
@override@JsonKey() Map<Difficulty, DifficultyStats> get byDifficulty {
  if (_byDifficulty is EqualUnmodifiableMapView) return _byDifficulty;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byDifficulty);
}


/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsCopyWith<_Statistics> get copyWith => __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistics&&const DeepCollectionEquality().equals(other._byDifficulty, _byDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_byDifficulty));

@override
String toString() {
  return 'Statistics(byDifficulty: $byDifficulty)';
}


}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(_Statistics value, $Res Function(_Statistics) _then) = __$StatisticsCopyWithImpl;
@override @useResult
$Res call({
 Map<Difficulty, DifficultyStats> byDifficulty
});




}
/// @nodoc
class __$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byDifficulty = null,}) {
  return _then(_Statistics(
byDifficulty: null == byDifficulty ? _self._byDifficulty : byDifficulty // ignore: cast_nullable_to_non_nullable
as Map<Difficulty, DifficultyStats>,
  ));
}


}


/// @nodoc
mixin _$DifficultyStats {

 int get gamesPlayed; int get gamesWon;@DurationConverter() Duration? get bestTime;@DurationConverter() Duration? get averageTime;
/// Create a copy of DifficultyStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DifficultyStatsCopyWith<DifficultyStats> get copyWith => _$DifficultyStatsCopyWithImpl<DifficultyStats>(this as DifficultyStats, _$identity);

  /// Serializes this DifficultyStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DifficultyStats&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.bestTime, bestTime) || other.bestTime == bestTime)&&(identical(other.averageTime, averageTime) || other.averageTime == averageTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gamesPlayed,gamesWon,bestTime,averageTime);

@override
String toString() {
  return 'DifficultyStats(gamesPlayed: $gamesPlayed, gamesWon: $gamesWon, bestTime: $bestTime, averageTime: $averageTime)';
}


}

/// @nodoc
abstract mixin class $DifficultyStatsCopyWith<$Res>  {
  factory $DifficultyStatsCopyWith(DifficultyStats value, $Res Function(DifficultyStats) _then) = _$DifficultyStatsCopyWithImpl;
@useResult
$Res call({
 int gamesPlayed, int gamesWon,@DurationConverter() Duration? bestTime,@DurationConverter() Duration? averageTime
});




}
/// @nodoc
class _$DifficultyStatsCopyWithImpl<$Res>
    implements $DifficultyStatsCopyWith<$Res> {
  _$DifficultyStatsCopyWithImpl(this._self, this._then);

  final DifficultyStats _self;
  final $Res Function(DifficultyStats) _then;

/// Create a copy of DifficultyStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gamesPlayed = null,Object? gamesWon = null,Object? bestTime = freezed,Object? averageTime = freezed,}) {
  return _then(_self.copyWith(
gamesPlayed: null == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,bestTime: freezed == bestTime ? _self.bestTime : bestTime // ignore: cast_nullable_to_non_nullable
as Duration?,averageTime: freezed == averageTime ? _self.averageTime : averageTime // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [DifficultyStats].
extension DifficultyStatsPatterns on DifficultyStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DifficultyStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DifficultyStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DifficultyStats value)  $default,){
final _that = this;
switch (_that) {
case _DifficultyStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DifficultyStats value)?  $default,){
final _that = this;
switch (_that) {
case _DifficultyStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gamesPlayed,  int gamesWon, @DurationConverter()  Duration? bestTime, @DurationConverter()  Duration? averageTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DifficultyStats() when $default != null:
return $default(_that.gamesPlayed,_that.gamesWon,_that.bestTime,_that.averageTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gamesPlayed,  int gamesWon, @DurationConverter()  Duration? bestTime, @DurationConverter()  Duration? averageTime)  $default,) {final _that = this;
switch (_that) {
case _DifficultyStats():
return $default(_that.gamesPlayed,_that.gamesWon,_that.bestTime,_that.averageTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gamesPlayed,  int gamesWon, @DurationConverter()  Duration? bestTime, @DurationConverter()  Duration? averageTime)?  $default,) {final _that = this;
switch (_that) {
case _DifficultyStats() when $default != null:
return $default(_that.gamesPlayed,_that.gamesWon,_that.bestTime,_that.averageTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DifficultyStats implements DifficultyStats {
  const _DifficultyStats({this.gamesPlayed = 0, this.gamesWon = 0, @DurationConverter() this.bestTime, @DurationConverter() this.averageTime});
  factory _DifficultyStats.fromJson(Map<String, dynamic> json) => _$DifficultyStatsFromJson(json);

@override@JsonKey() final  int gamesPlayed;
@override@JsonKey() final  int gamesWon;
@override@DurationConverter() final  Duration? bestTime;
@override@DurationConverter() final  Duration? averageTime;

/// Create a copy of DifficultyStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DifficultyStatsCopyWith<_DifficultyStats> get copyWith => __$DifficultyStatsCopyWithImpl<_DifficultyStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DifficultyStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DifficultyStats&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.bestTime, bestTime) || other.bestTime == bestTime)&&(identical(other.averageTime, averageTime) || other.averageTime == averageTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gamesPlayed,gamesWon,bestTime,averageTime);

@override
String toString() {
  return 'DifficultyStats(gamesPlayed: $gamesPlayed, gamesWon: $gamesWon, bestTime: $bestTime, averageTime: $averageTime)';
}


}

/// @nodoc
abstract mixin class _$DifficultyStatsCopyWith<$Res> implements $DifficultyStatsCopyWith<$Res> {
  factory _$DifficultyStatsCopyWith(_DifficultyStats value, $Res Function(_DifficultyStats) _then) = __$DifficultyStatsCopyWithImpl;
@override @useResult
$Res call({
 int gamesPlayed, int gamesWon,@DurationConverter() Duration? bestTime,@DurationConverter() Duration? averageTime
});




}
/// @nodoc
class __$DifficultyStatsCopyWithImpl<$Res>
    implements _$DifficultyStatsCopyWith<$Res> {
  __$DifficultyStatsCopyWithImpl(this._self, this._then);

  final _DifficultyStats _self;
  final $Res Function(_DifficultyStats) _then;

/// Create a copy of DifficultyStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gamesPlayed = null,Object? gamesWon = null,Object? bestTime = freezed,Object? averageTime = freezed,}) {
  return _then(_DifficultyStats(
gamesPlayed: null == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,bestTime: freezed == bestTime ? _self.bestTime : bestTime // ignore: cast_nullable_to_non_nullable
as Duration?,averageTime: freezed == averageTime ? _self.averageTime : averageTime // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
