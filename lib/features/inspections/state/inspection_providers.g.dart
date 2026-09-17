// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspections)
final inspectionsProvider = InspectionsFamily._();

final class InspectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Inspection>>,
          List<Inspection>,
          Stream<List<Inspection>>
        >
    with $FutureModifier<List<Inspection>>, $StreamProvider<List<Inspection>> {
  InspectionsProvider._({
    required InspectionsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'inspectionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionsHash();

  @override
  String toString() {
    return r'inspectionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Inspection>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Inspection>> create(Ref ref) {
    final argument = this.argument as bool;
    return inspections(ref, completed: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionsHash() => r'e31deafde00fff0d8f0dec434e619608b15b347e';

final class InspectionsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Inspection>>, bool> {
  InspectionsFamily._()
    : super(
        retry: null,
        name: r'inspectionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionsProvider call({bool completed = false}) =>
      InspectionsProvider._(argument: completed, from: this);

  @override
  String toString() => r'inspectionsProvider';
}

@ProviderFor(inspectionById)
final inspectionByIdProvider = InspectionByIdFamily._();

final class InspectionByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Inspection?>,
          Inspection?,
          Stream<Inspection?>
        >
    with $FutureModifier<Inspection?>, $StreamProvider<Inspection?> {
  InspectionByIdProvider._({
    required InspectionByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inspectionByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionByIdHash();

  @override
  String toString() {
    return r'inspectionByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Inspection?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Inspection?> create(Ref ref) {
    final argument = this.argument as String;
    return inspectionById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionByIdHash() => r'f4fd42539d4d1970b96158bf109dec19519db61e';

final class InspectionByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Inspection?>, String> {
  InspectionByIdFamily._()
    : super(
        retry: null,
        name: r'inspectionByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionByIdProvider call(String inspectionId) =>
      InspectionByIdProvider._(argument: inspectionId, from: this);

  @override
  String toString() => r'inspectionByIdProvider';
}

@ProviderFor(InspectionActions)
final inspectionActionsProvider = InspectionActionsProvider._();

final class InspectionActionsProvider
    extends $AsyncNotifierProvider<InspectionActions, void> {
  InspectionActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionActionsHash();

  @$internal
  @override
  InspectionActions create() => InspectionActions();
}

String _$inspectionActionsHash() => r'29aa8a69a0322c7b714f82180dc0d19752187848';

abstract class _$InspectionActions extends $AsyncNotifier<void> {
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
