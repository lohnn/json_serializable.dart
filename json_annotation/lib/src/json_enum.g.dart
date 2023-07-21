// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_enum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonEnum _$JsonEnumFromJson(Map<String, dynamic> json) => $checkedCreate(
      'JsonEnum',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['always_create', 'field_rename', 'value_field'],
        );
        final val = JsonEnum(
          alwaysCreate:
              $checkedConvert('always_create', (v) => v as bool? ?? false),
          fieldRename: $checkedConvert(
              'field_rename',
              (v) =>
                  $enumDecodeNullable(_$FieldRenameEnumMap, v) ??
                  FieldRename.none),
          valueField: $checkedConvert('value_field', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'alwaysCreate': 'always_create',
        'fieldRename': 'field_rename',
        'valueField': 'value_field'
      },
    );

Map<String, dynamic> _$JsonEnumToJson(JsonEnum instance) => <String, dynamic>{
      'always_create': instance.alwaysCreate,
      'field_rename': _$FieldRenameEnumMap[instance.fieldRename]!,
      'value_field': instance.valueField,
    };

const _$FieldRenameEnumMap = {
  FieldRename.none: 'none',
  FieldRename.kebab: 'kebab',
  FieldRename.snake: 'snake',
  FieldRename.pascal: 'pascal',
  FieldRename.screamingSnake: 'screamingSnake',
};
