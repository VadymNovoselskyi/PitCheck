// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_sheet_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionSheets)
final inspectionSheetsProvider = InspectionSheetsFamily._();

final class InspectionSheetsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionSheet>>,
          List<InspectionSheet>,
          Stream<List<InspectionSheet>>
        >
    with
        $FutureModifier<List<InspectionSheet>>,
        $StreamProvider<List<InspectionSheet>> {
  InspectionSheetsProvider._({
    required InspectionSheetsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'inspectionSheetsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionSheetsHash();

  @override
  String toString() {
    return r'inspectionSheetsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionSheet>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionSheet>> create(Ref ref) {
    final argument = this.argument as bool;
    return inspectionSheets(ref, archived: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionSheetsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionSheetsHash() => r'042af2887cbd66153aa1ad92dce8852b6af9fb86';

final class InspectionSheetsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<InspectionSheet>>, bool> {
  InspectionSheetsFamily._()
    : super(
        retry: null,
        name: r'inspectionSheetsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionSheetsProvider call({bool archived = false}) =>
      InspectionSheetsProvider._(argument: archived, from: this);

  @override
  String toString() => r'inspectionSheetsProvider';
}

@ProviderFor(inspectionSheetById)
final inspectionSheetByIdProvider = InspectionSheetByIdFamily._();

final class InspectionSheetByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionSheet?>,
          InspectionSheet?,
          Stream<InspectionSheet?>
        >
    with $FutureModifier<InspectionSheet?>, $StreamProvider<InspectionSheet?> {
  InspectionSheetByIdProvider._({
    required InspectionSheetByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inspectionSheetByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionSheetByIdHash();

  @override
  String toString() {
    return r'inspectionSheetByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<InspectionSheet?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionSheet?> create(Ref ref) {
    final argument = this.argument as String;
    return inspectionSheetById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionSheetByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionSheetByIdHash() =>
    r'0f4ac32b1424d4542e327cdc952a9b887d03c33a';

final class InspectionSheetByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<InspectionSheet?>, String> {
  InspectionSheetByIdFamily._()
    : super(
        retry: null,
        name: r'inspectionSheetByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionSheetByIdProvider call(String id) =>
      InspectionSheetByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'inspectionSheetByIdProvider';
}

@ProviderFor(InspectionSheetActions)
final inspectionSheetActionsProvider = InspectionSheetActionsProvider._();

final class InspectionSheetActionsProvider
    extends $AsyncNotifierProvider<InspectionSheetActions, void> {
  InspectionSheetActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionSheetActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionSheetActionsHash();

  @$internal
  @override
  InspectionSheetActions create() => InspectionSheetActions();
}

String _$inspectionSheetActionsHash() =>
    r'3803c6bc56d032b20ba7ffc6e565d227953d19e5';

abstract class _$InspectionSheetActions extends $AsyncNotifier<void> {
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
