// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionCategories)
final inspectionCategoriesProvider = InspectionCategoriesFamily._();

final class InspectionCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionCategory>>,
          List<InspectionCategory>,
          Stream<List<InspectionCategory>>
        >
    with
        $FutureModifier<List<InspectionCategory>>,
        $StreamProvider<List<InspectionCategory>> {
  InspectionCategoriesProvider._({
    required InspectionCategoriesFamily super.from,
    required (String, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionCategoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionCategoriesHash();

  @override
  String toString() {
    return r'inspectionCategoriesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionCategory>> create(Ref ref) {
    final argument = this.argument as (String, {bool archived});
    return inspectionCategories(ref, argument.$1, archived: argument.archived);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionCategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionCategoriesHash() =>
    r'87fcac45e89e303555db592399da595acb11b363';

final class InspectionCategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<InspectionCategory>>,
          (String, {bool archived})
        > {
  InspectionCategoriesFamily._()
    : super(
        retry: null,
        name: r'inspectionCategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionCategoriesProvider call(String sheetId, {bool archived = false}) =>
      InspectionCategoriesProvider._(
        argument: (sheetId, archived: archived),
        from: this,
      );

  @override
  String toString() => r'inspectionCategoriesProvider';
}

@ProviderFor(inspectionCategoryById)
final inspectionCategoryByIdProvider = InspectionCategoryByIdFamily._();

final class InspectionCategoryByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionCategory?>,
          InspectionCategory?,
          Stream<InspectionCategory?>
        >
    with
        $FutureModifier<InspectionCategory?>,
        $StreamProvider<InspectionCategory?> {
  InspectionCategoryByIdProvider._({
    required InspectionCategoryByIdFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionCategoryByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionCategoryByIdHash();

  @override
  String toString() {
    return r'inspectionCategoryByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<InspectionCategory?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionCategory?> create(Ref ref) {
    final argument = this.argument as (String, String);
    return inspectionCategoryById(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionCategoryByIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionCategoryByIdHash() =>
    r'486fe5e5a35c179450071667b6cb8973974cf669';

final class InspectionCategoryByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<InspectionCategory?>,
          (String, String)
        > {
  InspectionCategoryByIdFamily._()
    : super(
        retry: null,
        name: r'inspectionCategoryByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionCategoryByIdProvider call(String sheetId, String categoryId) =>
      InspectionCategoryByIdProvider._(
        argument: (sheetId, categoryId),
        from: this,
      );

  @override
  String toString() => r'inspectionCategoryByIdProvider';
}

@ProviderFor(addInspectionCategory)
final addInspectionCategoryProvider = AddInspectionCategoryFamily._();

final class AddInspectionCategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddInspectionCategoryProvider._({
    required AddInspectionCategoryFamily super.from,
    required InspectionCategory super.argument,
  }) : super(
         retry: null,
         name: r'addInspectionCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addInspectionCategoryHash();

  @override
  String toString() {
    return r'addInspectionCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as InspectionCategory;
    return addInspectionCategory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AddInspectionCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addInspectionCategoryHash() =>
    r'c01400d64ebcb7739dd940074a742e68abb87d2a';

final class AddInspectionCategoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, InspectionCategory> {
  AddInspectionCategoryFamily._()
    : super(
        retry: null,
        name: r'addInspectionCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionCategoryProvider call(InspectionCategory category) =>
      AddInspectionCategoryProvider._(argument: category, from: this);

  @override
  String toString() => r'addInspectionCategoryProvider';
}

@ProviderFor(updateInspectionCategory)
final updateInspectionCategoryProvider = UpdateInspectionCategoryFamily._();

final class UpdateInspectionCategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UpdateInspectionCategoryProvider._({
    required UpdateInspectionCategoryFamily super.from,
    required InspectionCategory super.argument,
  }) : super(
         retry: null,
         name: r'updateInspectionCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateInspectionCategoryHash();

  @override
  String toString() {
    return r'updateInspectionCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as InspectionCategory;
    return updateInspectionCategory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInspectionCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateInspectionCategoryHash() =>
    r'be3fbd30f6bdb52918e79911b45ba959f7f1908d';

final class UpdateInspectionCategoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, InspectionCategory> {
  UpdateInspectionCategoryFamily._()
    : super(
        retry: null,
        name: r'updateInspectionCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateInspectionCategoryProvider call(InspectionCategory category) =>
      UpdateInspectionCategoryProvider._(argument: category, from: this);

  @override
  String toString() => r'updateInspectionCategoryProvider';
}

@ProviderFor(setInspectionCategoryArchived)
final setInspectionCategoryArchivedProvider =
    SetInspectionCategoryArchivedFamily._();

final class SetInspectionCategoryArchivedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetInspectionCategoryArchivedProvider._({
    required SetInspectionCategoryArchivedFamily super.from,
    required (InspectionCategory, {bool archived}) super.argument,
  }) : super(
         retry: null,
         name: r'setInspectionCategoryArchivedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setInspectionCategoryArchivedHash();

  @override
  String toString() {
    return r'setInspectionCategoryArchivedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (InspectionCategory, {bool archived});
    return setInspectionCategoryArchived(
      ref,
      argument.$1,
      archived: argument.archived,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SetInspectionCategoryArchivedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setInspectionCategoryArchivedHash() =>
    r'9d8eaa4c0378f3942e49a2e02daad93781eef9c8';

final class SetInspectionCategoryArchivedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (InspectionCategory, {bool archived})
        > {
  SetInspectionCategoryArchivedFamily._()
    : super(
        retry: null,
        name: r'setInspectionCategoryArchivedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetInspectionCategoryArchivedProvider call(
    InspectionCategory category, {
    required bool archived,
  }) => SetInspectionCategoryArchivedProvider._(
    argument: (category, archived: archived),
    from: this,
  );

  @override
  String toString() => r'setInspectionCategoryArchivedProvider';
}

@ProviderFor(reorderInspectionCategories)
final reorderInspectionCategoriesProvider =
    ReorderInspectionCategoriesFamily._();

final class ReorderInspectionCategoriesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  ReorderInspectionCategoriesProvider._({
    required ReorderInspectionCategoriesFamily super.from,
    required (String, List<String>) super.argument,
  }) : super(
         retry: null,
         name: r'reorderInspectionCategoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reorderInspectionCategoriesHash();

  @override
  String toString() {
    return r'reorderInspectionCategoriesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, List<String>);
    return reorderInspectionCategories(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ReorderInspectionCategoriesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reorderInspectionCategoriesHash() =>
    r'05739c6b6d01a2d95bf3c399d0334b371f39c7fe';

final class ReorderInspectionCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (String, List<String>)> {
  ReorderInspectionCategoriesFamily._()
    : super(
        retry: null,
        name: r'reorderInspectionCategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReorderInspectionCategoriesProvider call(
    String sheetId,
    List<String> orderedCategoryIds,
  ) => ReorderInspectionCategoriesProvider._(
    argument: (sheetId, orderedCategoryIds),
    from: this,
  );

  @override
  String toString() => r'reorderInspectionCategoriesProvider';
}
