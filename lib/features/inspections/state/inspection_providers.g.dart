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

@ProviderFor(addInspection)
final addInspectionProvider = AddInspectionFamily._();

final class AddInspectionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddInspectionProvider._({
    required AddInspectionFamily super.from,
    required Inspection super.argument,
  }) : super(
         retry: null,
         name: r'addInspectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addInspectionHash();

  @override
  String toString() {
    return r'addInspectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Inspection;
    return addInspection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AddInspectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addInspectionHash() => r'735084840d46c38bd060d5aa936185f8c0c03afc';

final class AddInspectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Inspection> {
  AddInspectionFamily._()
    : super(
        retry: null,
        name: r'addInspectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionProvider call(Inspection inspection) =>
      AddInspectionProvider._(argument: inspection, from: this);

  @override
  String toString() => r'addInspectionProvider';
}

@ProviderFor(startInspection)
final startInspectionProvider = StartInspectionFamily._();

final class StartInspectionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  StartInspectionProvider._({
    required StartInspectionFamily super.from,
    required Inspection super.argument,
  }) : super(
         retry: null,
         name: r'startInspectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$startInspectionHash();

  @override
  String toString() {
    return r'startInspectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Inspection;
    return startInspection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StartInspectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$startInspectionHash() => r'168bbf579a153e4ac7e8f130d95b3938b042b617';

final class StartInspectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Inspection> {
  StartInspectionFamily._()
    : super(
        retry: null,
        name: r'startInspectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StartInspectionProvider call(Inspection inspection) =>
      StartInspectionProvider._(argument: inspection, from: this);

  @override
  String toString() => r'startInspectionProvider';
}

@ProviderFor(finishInspection)
final finishInspectionProvider = FinishInspectionFamily._();

final class FinishInspectionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  FinishInspectionProvider._({
    required FinishInspectionFamily super.from,
    required Inspection super.argument,
  }) : super(
         retry: null,
         name: r'finishInspectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$finishInspectionHash();

  @override
  String toString() {
    return r'finishInspectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Inspection;
    return finishInspection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FinishInspectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$finishInspectionHash() => r'284011cf52143bf5dd801c98928a6f01adc64a68';

final class FinishInspectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Inspection> {
  FinishInspectionFamily._()
    : super(
        retry: null,
        name: r'finishInspectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FinishInspectionProvider call(Inspection inspection) =>
      FinishInspectionProvider._(argument: inspection, from: this);

  @override
  String toString() => r'finishInspectionProvider';
}

@ProviderFor(cancelInspection)
final cancelInspectionProvider = CancelInspectionFamily._();

final class CancelInspectionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  CancelInspectionProvider._({
    required CancelInspectionFamily super.from,
    required Inspection super.argument,
  }) : super(
         retry: null,
         name: r'cancelInspectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cancelInspectionHash();

  @override
  String toString() {
    return r'cancelInspectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Inspection;
    return cancelInspection(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelInspectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cancelInspectionHash() => r'a6f586710f959cbf1bc6e4a96cf90561599a97fe';

final class CancelInspectionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Inspection> {
  CancelInspectionFamily._()
    : super(
        retry: null,
        name: r'cancelInspectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CancelInspectionProvider call(Inspection inspection) =>
      CancelInspectionProvider._(argument: inspection, from: this);

  @override
  String toString() => r'cancelInspectionProvider';
}
