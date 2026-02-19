// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cell _$CellFromJson(Map<String, dynamic> json) => _Cell(
  row: (json['row'] as num).toInt(),
  col: (json['col'] as num).toInt(),
  value: (json['value'] as num?)?.toInt() ?? 0,
  isGiven: json['isGiven'] as bool? ?? false,
  memos:
      (json['memos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toSet() ??
      const {},
  isError: json['isError'] as bool? ?? false,
);

Map<String, dynamic> _$CellToJson(_Cell instance) => <String, dynamic>{
  'row': instance.row,
  'col': instance.col,
  'value': instance.value,
  'isGiven': instance.isGiven,
  'memos': instance.memos.toList(),
  'isError': instance.isError,
};

_CellPosition _$CellPositionFromJson(Map<String, dynamic> json) =>
    _CellPosition(
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
    );

Map<String, dynamic> _$CellPositionToJson(_CellPosition instance) =>
    <String, dynamic>{'row': instance.row, 'col': instance.col};
