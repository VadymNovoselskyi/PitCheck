// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrut_point_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scrutPoints)
final scrutPointsProvider = ScrutPointsFamily._();

final class ScrutPointsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ScrutPoint>>,
          List<ScrutPoint>,
          Stream<List<ScrutPoint>>
        >
    with $FutureModifier<List<ScrutPoint>>, $StreamProvider<List<ScrutPoint>> {
  ScrutPointsProvider._({
    required ScrutPointsFamily super.from,
    required (String, String, String, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'scrutPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scrutPointsHash();

  @override
  String toString() {
    return r'scrutPointsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<ScrutPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ScrutPoint>> create(Ref ref) {
    final argument = this.argument as (String, String, String, {bool archived});
    return scrutPoints(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScrutPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scrutPointsHash() => r'970dbcd20b00e38bc2de44f81af6394ed68dec7c';

final class ScrutPointsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<ScrutPoint>>,
          (String, String, String, {bool archived})
        > {
  ScrutPointsFamily._()
    : super(
        retry: null,
        name: r'scrutPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScrutPointsProvider call(
    String sheetId,
    String categoryId,
    String subcategoryId, {
    bool archived = false,
  }) => ScrutPointsProvider._(
    argument: (sheetId, categoryId, subcategoryId, archived: archived),
    from: this,
  );

  @override
  String toString() => r'scrutPointsProvider';
}

@ProviderFor(scrutPointById)
final scrutPointByIdProvider = ScrutPointByIdFamily._();

final class ScrutPointByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ScrutPoint?>,
          ScrutPoint?,
          Stream<ScrutPoint?>
        >
    with $FutureModifier<ScrutPoint?>, $StreamProvider<ScrutPoint?> {
  ScrutPointByIdProvider._({
    required ScrutPointByIdFamily super.from,
    required (String, String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'scrutPointByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scrutPointByIdHash();

  @override
  String toString() {
    return r'scrutPointByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<ScrutPoint?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ScrutPoint?> create(Ref ref) {
    final argument = this.argument as (String, String, String, String);
    return scrutPointById(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScrutPointByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scrutPointByIdHash() => r'33f77c7390811dd8d29091c3ddd1d22ff0a95cac';

final class ScrutPointByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<ScrutPoint?>,
          (String, String, String, String)
        > {
  ScrutPointByIdFamily._()
    : super(
        retry: null,
        name: r'scrutPointByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScrutPointByIdProvider call(
    String sheetId,
    String categoryId,
    String subcategoryId,
    String pointId,
  ) => ScrutPointByIdProvider._(
    argument: (sheetId, categoryId, subcategoryId, pointId),
    from: this,
  );

  @override
  String toString() => r'scrutPointByIdProvider';
}

@ProviderFor(addScrutPoint)
final addScrutPointProvider = AddScrutPointFamily._();

final class AddScrutPointProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddScrutPointProvider._({
    required AddScrutPointFamily super.from,
    required (String, String, ScrutPoint) super.argument,
  }) : super(
         retry: null,
         name: r'addScrutPointProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addScrutPointHash();

  @override
  String toString() {
    return r'addScrutPointProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String, ScrutPoint);
    return addScrutPoint(ref, argument.$1, argument.$2, argument.$3);
  }

  @override
  bool operator ==(Object other) {
    return other is AddScrutPointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addScrutPointHash() => r'6201c31fac2c38eee3059ad9209c01f773f94706';

final class AddScrutPointFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, ScrutPoint)
        > {
  AddScrutPointFamily._()
    : super(
        retry: null,
        name: r'addScrutPointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddScrutPointProvider call(
    String sheetId,
    String categoryId,
    ScrutPoint point,
  ) => AddScrutPointProvider._(
    argument: (sheetId, categoryId, point),
    from: this,
  );

  @override
  String toString() => r'addScrutPointProvider';
}

@ProviderFor(updateScrutPoint)
final updateScrutPointProvider = UpdateScrutPointFamily._();

final class UpdateScrutPointProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UpdateScrutPointProvider._({
    required UpdateScrutPointFamily super.from,
    required (String, String, ScrutPoint) super.argument,
  }) : super(
         retry: null,
         name: r'updateScrutPointProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateScrutPointHash();

  @override
  String toString() {
    return r'updateScrutPointProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String, ScrutPoint);
    return updateScrutPoint(ref, argument.$1, argument.$2, argument.$3);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateScrutPointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateScrutPointHash() => r'a5e023fa9c161baac022d57ab3a916a26297bf18';

final class UpdateScrutPointFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, ScrutPoint)
        > {
  UpdateScrutPointFamily._()
    : super(
        retry: null,
        name: r'updateScrutPointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateScrutPointProvider call(
    String sheetId,
    String categoryId,
    ScrutPoint point,
  ) => UpdateScrutPointProvider._(
    argument: (sheetId, categoryId, point),
    from: this,
  );

  @override
  String toString() => r'updateScrutPointProvider';
}

@ProviderFor(setScrutPointArchived)
final setScrutPointArchivedProvider = SetScrutPointArchivedFamily._();

final class SetScrutPointArchivedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetScrutPointArchivedProvider._({
    required SetScrutPointArchivedFamily super.from,
    required (String, String, ScrutPoint, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'setScrutPointArchivedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setScrutPointArchivedHash();

  @override
  String toString() {
    return r'setScrutPointArchivedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as (String, String, ScrutPoint, {bool archived});
    return setScrutPointArchived(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SetScrutPointArchivedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setScrutPointArchivedHash() =>
    r'453b6328697c4d5cbc046d24099793479c41756a';

final class SetScrutPointArchivedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, ScrutPoint, {bool archived})
        > {
  SetScrutPointArchivedFamily._()
    : super(
        retry: null,
        name: r'setScrutPointArchivedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetScrutPointArchivedProvider call(
    String sheetId,
    String categoryId,
    ScrutPoint point, {
    required bool archived,
  }) => SetScrutPointArchivedProvider._(
    argument: (sheetId, categoryId, point, archived: archived),
    from: this,
  );

  @override
  String toString() => r'setScrutPointArchivedProvider';
}

@ProviderFor(reorderScrutPoints)
final reorderScrutPointsProvider = ReorderScrutPointsFamily._();

final class ReorderScrutPointsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  ReorderScrutPointsProvider._({
    required ReorderScrutPointsFamily super.from,
    required (String, String, String, List<String>) super.argument,
  }) : super(
         retry: null,
         name: r'reorderScrutPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reorderScrutPointsHash();

  @override
  String toString() {
    return r'reorderScrutPointsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String, String, List<String>);
    return reorderScrutPoints(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReorderScrutPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reorderScrutPointsHash() =>
    r'5fad61b0dfaabbb2d8691829f81a2acd951097fd';

final class ReorderScrutPointsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, String, List<String>)
        > {
  ReorderScrutPointsFamily._()
    : super(
        retry: null,
        name: r'reorderScrutPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReorderScrutPointsProvider call(
    String sheetId,
    String categoryId,
    String subcategoryId,
    List<String> orderedPointIds,
  ) => ReorderScrutPointsProvider._(
    argument: (sheetId, categoryId, subcategoryId, orderedPointIds),
    from: this,
  );

  @override
  String toString() => r'reorderScrutPointsProvider';
}
