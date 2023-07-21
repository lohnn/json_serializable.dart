// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'enum_utils.dart';
import 'settings.dart';
import 'type_helper.dart';

class JsonEnumGenerator extends GeneratorForAnnotation<JsonEnum> {
  final Settings _settings;

  // TODO(lohnn): Implement
  // JsonEnum get config => _settings.jsonEnumConfig.toJsonEnum();

  JsonEnumGenerator.fromSettings(this._settings);

  /// Creates an instance of [JsonEnumGenerator].
  ///
  /// If [typeHelpers] is not provided, the built-in helpers are used:
  /// [BigIntHelper], [DateTimeHelper], [DurationHelper], [JsonHelper], and
  /// [UriHelper].
  factory JsonEnumGenerator({
    JsonEnum? config,
    List<TypeHelper>? typeHelpers,
  }) =>
      JsonEnumGenerator.fromSettings(Settings(
        jsonEnumConfig: config,
        typeHelpers: typeHelpers,
      ));

  /// Creates an instance of [JsonEnumGenerator].
  ///
  /// [typeHelpers] provides a set of [TypeHelper] that will be used along with
  /// the built-in helpers:
  /// [BigIntHelper], [DateTimeHelper], [DurationHelper], [JsonHelper], and
  /// [UriHelper].
  factory JsonEnumGenerator.withDefaultHelpers(
    Iterable<TypeHelper> typeHelpers, {
    JsonEnum? config,
  }) =>
      JsonEnumGenerator(
        config: config,
        typeHelpers: List.unmodifiable(
          typeHelpers.followedBy(Settings.defaultHelpers),
        ),
      );

  @override
  List<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! EnumElement) {
      throw InvalidGenerationSourceError(
        '`@JsonEnum` can only be used on enum elements.',
        element: element,
      );
    }

    final value = enumValueMapFromType(
      element.thisType,
      _settings.jsonEnumConfig,
      nullWithNoAnnotation: true,
    );

    return [
      if (value != null) value,
    ];
  }
}
