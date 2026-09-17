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

@ProviderFor(ScrutPointActions)
final scrutPointActionsProvider = ScrutPointActionsProvider._();

final class ScrutPointActionsProvider
    extends $AsyncNotifierProvider<ScrutPointActions, void> {
  ScrutPointActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scrutPointActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scrutPointActionsHash();

  @$internal
  @override
  ScrutPointActions create() => ScrutPointActions();
}

String _$scrutPointActionsHash() => r'e58b8204fced913794846df3c4ccb620f11053ca';

abstract class _$ScrutPointActions extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
