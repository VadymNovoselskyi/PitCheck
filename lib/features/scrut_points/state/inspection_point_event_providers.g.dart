// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_point_event_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionPointEvents)
final inspectionPointEventsProvider = InspectionPointEventsFamily._();

final class InspectionPointEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionPointEvent>>,
          List<InspectionPointEvent>,
          Stream<List<InspectionPointEvent>>
        >
    with
        $FutureModifier<List<InspectionPointEvent>>,
        $StreamProvider<List<InspectionPointEvent>> {
  InspectionPointEventsProvider._({
    required InspectionPointEventsFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionPointEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionPointEventsHash();

  @override
  String toString() {
    return r'inspectionPointEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionPointEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionPointEvent>> create(Ref ref) {
    final argument = this.argument as (String, String);
    return inspectionPointEvents(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionPointEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionPointEventsHash() =>
    r'a45a1359824045d537d97a7fd8fe990bb1240e2c';

final class InspectionPointEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<InspectionPointEvent>>,
          (String, String)
        > {
  InspectionPointEventsFamily._()
    : super(
        retry: null,
        name: r'inspectionPointEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionPointEventsProvider call(
    String inspectionId,
    String scrutPointId,
  ) => InspectionPointEventsProvider._(
    argument: (inspectionId, scrutPointId),
    from: this,
  );

  @override
  String toString() => r'inspectionPointEventsProvider';
}

@ProviderFor(InspectionPointEventActions)
final inspectionPointEventActionsProvider =
    InspectionPointEventActionsProvider._();

final class InspectionPointEventActionsProvider
    extends $AsyncNotifierProvider<InspectionPointEventActions, void> {
  InspectionPointEventActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionPointEventActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionPointEventActionsHash();

  @$internal
  @override
  InspectionPointEventActions create() => InspectionPointEventActions();
}

String _$inspectionPointEventActionsHash() =>
    r'6b13cdb8f3ff8d2d4c4d461450bc85c13f385ca3';

abstract class _$InspectionPointEventActions extends $AsyncNotifier<void> {
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
