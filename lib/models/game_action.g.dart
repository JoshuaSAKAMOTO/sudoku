// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetValueAction _$SetValueActionFromJson(Map<String, dynamic> json) =>
    SetValueAction(
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      previousValue: (json['previousValue'] as num).toInt(),
      newValue: (json['newValue'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SetValueActionToJson(SetValueAction instance) =>
    <String, dynamic>{
      'row': instance.row,
      'col': instance.col,
      'previousValue': instance.previousValue,
      'newValue': instance.newValue,
      'runtimeType': instance.$type,
    };

ToggleMemoAction _$ToggleMemoActionFromJson(Map<String, dynamic> json) =>
    ToggleMemoAction(
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ToggleMemoActionToJson(ToggleMemoAction instance) =>
    <String, dynamic>{
      'row': instance.row,
      'col': instance.col,
      'number': instance.number,
      'runtimeType': instance.$type,
    };

ClearCellAction _$ClearCellActionFromJson(Map<String, dynamic> json) =>
    ClearCellAction(
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      previousValue: (json['previousValue'] as num).toInt(),
      previousMemos: (json['previousMemos'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toSet(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ClearCellActionToJson(ClearCellAction instance) =>
    <String, dynamic>{
      'row': instance.row,
      'col': instance.col,
      'previousValue': instance.previousValue,
      'previousMemos': instance.previousMemos.toList(),
      'runtimeType': instance.$type,
    };
