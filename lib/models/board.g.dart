// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Board _$BoardFromJson(Map<String, dynamic> json) => _Board(
  cells: (json['cells'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>)
            .map((e) => Cell.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      .toList(),
  solution: (json['solution'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
);

Map<String, dynamic> _$BoardToJson(_Board instance) => <String, dynamic>{
  'cells': instance.cells,
  'solution': instance.solution,
};
