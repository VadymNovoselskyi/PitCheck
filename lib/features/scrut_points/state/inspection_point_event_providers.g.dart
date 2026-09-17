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

@ProviderFor(addInspectionPointEvent)
final addInspectionPointEventProvider = AddInspectionPointEventFamily._();

final class AddInspectionPointEventProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddInspectionPointEventProvider._({
    required AddInspectionPointEventFamily super.from,
    required InspectionPointEvent super.argument,
  }) : super(
         retry: null,
         name: r'addInspectionPointEventProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addInspectionPointEventHash();

  @override
  String toString() {
    return r'addInspectionPointEventProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as InspectionPointEvent;
    return addInspectionPointEvent(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AddInspectionPointEventProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addInspectionPointEventHash() =>
    r'6392c69649b0944483a37680c548f114f812c145';

final class AddInspectionPointEventFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, InspectionPointEvent> {
  AddInspectionPointEventFamily._()
    : super(
        retry: null,
        name: r'addInspectionPointEventProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionPointEventProvider call(InspectionPointEvent event) =>
      AddInspectionPointEventProvider._(argument: event, from: this);

  @override
  String toString() => r'addInspectionPointEventProvider';
}
