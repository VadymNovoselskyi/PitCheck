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

@ProviderFor(setInspectionSheetArchived)
final setInspectionSheetArchivedProvider = SetInspectionSheetArchivedFamily._();

final class SetInspectionSheetArchivedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetInspectionSheetArchivedProvider._({
    required SetInspectionSheetArchivedFamily super.from,
    required (InspectionSheet, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'setInspectionSheetArchivedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setInspectionSheetArchivedHash();

  @override
  String toString() {
    return r'setInspectionSheetArchivedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (InspectionSheet, {bool archived});
    return setInspectionSheetArchived(
      ref,
      argument.$1,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SetInspectionSheetArchivedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setInspectionSheetArchivedHash() =>
    r'717b9660f446c84720305318b3eaaf96d87961e2';

final class SetInspectionSheetArchivedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (InspectionSheet, {bool archived})
        > {
  SetInspectionSheetArchivedFamily._()
    : super(
        retry: null,
        name: r'setInspectionSheetArchivedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetInspectionSheetArchivedProvider call(
    InspectionSheet sheet, {
    required bool archived,
  }) => SetInspectionSheetArchivedProvider._(
    argument: (sheet, archived: archived),
    from: this,
  );

  @override
  String toString() => r'setInspectionSheetArchivedProvider';
}
