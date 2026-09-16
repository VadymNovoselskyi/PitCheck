// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_subcategory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionSubcategories)
final inspectionSubcategoriesProvider = InspectionSubcategoriesFamily._();

final class InspectionSubcategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionSubcategory>>,
          List<InspectionSubcategory>,
          Stream<List<InspectionSubcategory>>
        >
    with
        $FutureModifier<List<InspectionSubcategory>>,
        $StreamProvider<List<InspectionSubcategory>> {
  InspectionSubcategoriesProvider._({
    required InspectionSubcategoriesFamily super.from,
    required (String, String, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionSubcategoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionSubcategoriesHash();

  @override
  String toString() {
    return r'inspectionSubcategoriesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionSubcategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionSubcategory>> create(Ref ref) {
    final argument = this.argument as (String, String, {bool archived});
    return inspectionSubcategories(
      ref,
      argument.$1,
      argument.$2,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionSubcategoriesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionSubcategoriesHash() =>
    r'1f69adbfab4067de9e83bdce20a017c33f5fd270';

final class InspectionSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<InspectionSubcategory>>,
          (String, String, {bool archived})
        > {
  InspectionSubcategoriesFamily._()
    : super(
        retry: null,
        name: r'inspectionSubcategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionSubcategoriesProvider call(
    String sheetId,
    String categoryId, {
    bool archived = false,
  }) => InspectionSubcategoriesProvider._(
    argument: (sheetId, categoryId, archived: archived),
    from: this,
  );

  @override
  String toString() => r'inspectionSubcategoriesProvider';
}

@ProviderFor(inspectionSubcategoryById)
final inspectionSubcategoryByIdProvider = InspectionSubcategoryByIdFamily._();

final class InspectionSubcategoryByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionSubcategory?>,
          InspectionSubcategory?,
          Stream<InspectionSubcategory?>
        >
    with
        $FutureModifier<InspectionSubcategory?>,
        $StreamProvider<InspectionSubcategory?> {
  InspectionSubcategoryByIdProvider._({
    required InspectionSubcategoryByIdFamily super.from,
    required (String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionSubcategoryByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionSubcategoryByIdHash();

  @override
  String toString() {
    return r'inspectionSubcategoryByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<InspectionSubcategory?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionSubcategory?> create(Ref ref) {
    final argument = this.argument as (String, String, String);
    return inspectionSubcategoryById(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionSubcategoryByIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionSubcategoryByIdHash() =>
    r'f67d73d3b6070b028463723d4115a935d6399926';

final class InspectionSubcategoryByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<InspectionSubcategory?>,
          (String, String, String)
        > {
  InspectionSubcategoryByIdFamily._()
    : super(
        retry: null,
        name: r'inspectionSubcategoryByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionSubcategoryByIdProvider call(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) => InspectionSubcategoryByIdProvider._(
    argument: (sheetId, categoryId, subcategoryId),
    from: this,
  );

  @override
  String toString() => r'inspectionSubcategoryByIdProvider';
}

@ProviderFor(addInspectionSubcategory)
final addInspectionSubcategoryProvider = AddInspectionSubcategoryFamily._();

final class AddInspectionSubcategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddInspectionSubcategoryProvider._({
    required AddInspectionSubcategoryFamily super.from,
    required (String, InspectionSubcategory) super.argument,
  }) : super(
         retry: null,
         name: r'addInspectionSubcategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addInspectionSubcategoryHash();

  @override
  String toString() {
    return r'addInspectionSubcategoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, InspectionSubcategory);
    return addInspectionSubcategory(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is AddInspectionSubcategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addInspectionSubcategoryHash() =>
    r'f114d8c473352b7b2b2f923cb047e62371d72f3b';

final class AddInspectionSubcategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionSubcategory)
        > {
  AddInspectionSubcategoryFamily._()
    : super(
        retry: null,
        name: r'addInspectionSubcategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionSubcategoryProvider call(
    String sheetId,
    InspectionSubcategory subcategory,
  ) => AddInspectionSubcategoryProvider._(
    argument: (sheetId, subcategory),
    from: this,
  );

  @override
  String toString() => r'addInspectionSubcategoryProvider';
}

@ProviderFor(updateInspectionSubcategory)
final updateInspectionSubcategoryProvider =
    UpdateInspectionSubcategoryFamily._();

final class UpdateInspectionSubcategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UpdateInspectionSubcategoryProvider._({
    required UpdateInspectionSubcategoryFamily super.from,
    required (String, InspectionSubcategory) super.argument,
  }) : super(
         retry: null,
         name: r'updateInspectionSubcategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateInspectionSubcategoryHash();

  @override
  String toString() {
    return r'updateInspectionSubcategoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, InspectionSubcategory);
    return updateInspectionSubcategory(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInspectionSubcategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateInspectionSubcategoryHash() =>
    r'381c6638972868815fa24be8d2575d2c83692e10';

final class UpdateInspectionSubcategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionSubcategory)
        > {
  UpdateInspectionSubcategoryFamily._()
    : super(
        retry: null,
        name: r'updateInspectionSubcategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateInspectionSubcategoryProvider call(
    String sheetId,
    InspectionSubcategory subcategory,
  ) => UpdateInspectionSubcategoryProvider._(
    argument: (sheetId, subcategory),
    from: this,
  );

  @override
  String toString() => r'updateInspectionSubcategoryProvider';
}

@ProviderFor(setInspectionSubcategoryArchived)
final setInspectionSubcategoryArchivedProvider =
    SetInspectionSubcategoryArchivedFamily._();

final class SetInspectionSubcategoryArchivedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetInspectionSubcategoryArchivedProvider._({
    required SetInspectionSubcategoryArchivedFamily super.from,
    required (String, InspectionSubcategory, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'setInspectionSubcategoryArchivedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setInspectionSubcategoryArchivedHash();

  @override
  String toString() {
    return r'setInspectionSubcategoryArchivedProvider'
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
        this.argument as (String, InspectionSubcategory, {bool archived});
    return setInspectionSubcategoryArchived(
      ref,
      argument.$1,
      argument.$2,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SetInspectionSubcategoryArchivedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setInspectionSubcategoryArchivedHash() =>
    r'506725c5fc9c157f02b3467e329b5fd79a901b0c';

final class SetInspectionSubcategoryArchivedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionSubcategory, {bool archived})
        > {
  SetInspectionSubcategoryArchivedFamily._()
    : super(
        retry: null,
        name: r'setInspectionSubcategoryArchivedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetInspectionSubcategoryArchivedProvider call(
    String sheetId,
    InspectionSubcategory subcategory, {
    required bool archived,
  }) => SetInspectionSubcategoryArchivedProvider._(
    argument: (sheetId, subcategory, archived: archived),
    from: this,
  );

  @override
  String toString() => r'setInspectionSubcategoryArchivedProvider';
}

@ProviderFor(reorderInspectionSubcategories)
final reorderInspectionSubcategoriesProvider =
    ReorderInspectionSubcategoriesFamily._();

final class ReorderInspectionSubcategoriesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  ReorderInspectionSubcategoriesProvider._({
    required ReorderInspectionSubcategoriesFamily super.from,
    required (String, String, List<String>) super.argument,
  }) : super(
         retry: null,
         name: r'reorderInspectionSubcategoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reorderInspectionSubcategoriesHash();

  @override
  String toString() {
    return r'reorderInspectionSubcategoriesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String, List<String>);
    return reorderInspectionSubcategories(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReorderInspectionSubcategoriesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reorderInspectionSubcategoriesHash() =>
    r'ef6535fe048d64bec576978d80f491fa16af22db';

final class ReorderInspectionSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, List<String>)
        > {
  ReorderInspectionSubcategoriesFamily._()
    : super(
        retry: null,
        name: r'reorderInspectionSubcategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReorderInspectionSubcategoriesProvider call(
    String sheetId,
    String categoryId,
    List<String> orderedSubcategoryIds,
  ) => ReorderInspectionSubcategoriesProvider._(
    argument: (sheetId, categoryId, orderedSubcategoryIds),
    from: this,
  );

  @override
  String toString() => r'reorderInspectionSubcategoriesProvider';
}
