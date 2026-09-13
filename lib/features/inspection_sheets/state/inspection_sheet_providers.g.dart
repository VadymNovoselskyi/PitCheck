// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_sheet_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionSheets)
final inspectionSheetsProvider = InspectionSheetsProvider._();

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
  InspectionSheetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionSheetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionSheetsHash();

  @$internal
  @override
  $StreamProviderElement<List<InspectionSheet>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionSheet>> create(Ref ref) {
    return inspectionSheets(ref);
  }
}

String _$inspectionSheetsHash() => r'1acad69b7cc1ec710a2ad585e2b67c5bb765cf3e';

@ProviderFor(inspectionSheetById)
final inspectionSheetByIdProvider = InspectionSheetByIdFamily._();

final class InspectionSheetByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionSheet>,
          InspectionSheet,
          Stream<InspectionSheet>
        >
    with $FutureModifier<InspectionSheet>, $StreamProvider<InspectionSheet> {
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
  $StreamProviderElement<InspectionSheet> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionSheet> create(Ref ref) {
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
    r'1efd29c6b7825094c94627c347027f29f942796f';

final class InspectionSheetByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<InspectionSheet>, String> {
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

@ProviderFor(addInspectionSheet)
final addInspectionSheetProvider = AddInspectionSheetFamily._();

final class AddInspectionSheetProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddInspectionSheetProvider._({
    required AddInspectionSheetFamily super.from,
    required InspectionSheet super.argument,
  }) : super(
         retry: null,
         name: r'addInspectionSheetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addInspectionSheetHash();

  @override
  String toString() {
    return r'addInspectionSheetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as InspectionSheet;
    return addInspectionSheet(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AddInspectionSheetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addInspectionSheetHash() =>
    r'd60e1edd773c69c7b903e2ebab317026df34db23';

final class AddInspectionSheetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, InspectionSheet> {
  AddInspectionSheetFamily._()
    : super(
        retry: null,
        name: r'addInspectionSheetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionSheetProvider call(InspectionSheet sheet) =>
      AddInspectionSheetProvider._(argument: sheet, from: this);

  @override
  String toString() => r'addInspectionSheetProvider';
}

@ProviderFor(updateInspectionSheet)
final updateInspectionSheetProvider = UpdateInspectionSheetFamily._();

final class UpdateInspectionSheetProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UpdateInspectionSheetProvider._({
    required UpdateInspectionSheetFamily super.from,
    required InspectionSheet super.argument,
  }) : super(
         retry: null,
         name: r'updateInspectionSheetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateInspectionSheetHash();

  @override
  String toString() {
    return r'updateInspectionSheetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as InspectionSheet;
    return updateInspectionSheet(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInspectionSheetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateInspectionSheetHash() =>
    r'1960421338de9d757b845b62bb34308113c7b39a';

final class UpdateInspectionSheetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, InspectionSheet> {
  UpdateInspectionSheetFamily._()
    : super(
        retry: null,
        name: r'updateInspectionSheetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateInspectionSheetProvider call(InspectionSheet sheet) =>
      UpdateInspectionSheetProvider._(argument: sheet, from: this);

  @override
  String toString() => r'updateInspectionSheetProvider';
}

@ProviderFor(deleteInspectionSheet)
final deleteInspectionSheetProvider = DeleteInspectionSheetFamily._();

final class DeleteInspectionSheetProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteInspectionSheetProvider._({
    required DeleteInspectionSheetFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deleteInspectionSheetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteInspectionSheetHash();

  @override
  String toString() {
    return r'deleteInspectionSheetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return deleteInspectionSheet(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteInspectionSheetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteInspectionSheetHash() =>
    r'c4fbe73180d7b3d5f81473467fa12967480e5693';

final class DeleteInspectionSheetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  DeleteInspectionSheetFamily._()
    : super(
        retry: null,
        name: r'deleteInspectionSheetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteInspectionSheetProvider call(String id) =>
      DeleteInspectionSheetProvider._(argument: id, from: this);

  @override
  String toString() => r'deleteInspectionSheetProvider';
}
