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
    required String super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionCategory>> create(Ref ref) {
    final argument = this.argument as String;
    return inspectionCategories(ref, argument);
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
    r'eda3e2d7b71b676a5f7679190eb7d3d489ae3372';

final class InspectionCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<InspectionCategory>>, String> {
  InspectionCategoriesFamily._()
    : super(
        retry: null,
        name: r'inspectionCategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionCategoriesProvider call(String sheetId) =>
      InspectionCategoriesProvider._(argument: sheetId, from: this);

  @override
  String toString() => r'inspectionCategoriesProvider';
}

@ProviderFor(inspectionCategoryById)
final inspectionCategoryByIdProvider = InspectionCategoryByIdFamily._();

final class InspectionCategoryByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionCategory>,
          InspectionCategory,
          Stream<InspectionCategory>
        >
    with
        $FutureModifier<InspectionCategory>,
        $StreamProvider<InspectionCategory> {
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
  $StreamProviderElement<InspectionCategory> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionCategory> create(Ref ref) {
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
    r'b16c734e316d240e5c28b33ed9a26bfb707a90bd';

final class InspectionCategoryByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<InspectionCategory>,
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
    required (String, InspectionCategory) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, InspectionCategory);
    return addInspectionCategory(ref, argument.$1, argument.$2);
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
    r'680a1cf73a077d56c945080382a466f529a1b7dd';

final class AddInspectionCategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionCategory)
        > {
  AddInspectionCategoryFamily._()
    : super(
        retry: null,
        name: r'addInspectionCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddInspectionCategoryProvider call(
    String sheetId,
    InspectionCategory category,
  ) => AddInspectionCategoryProvider._(
    argument: (sheetId, category),
    from: this,
  );

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
    required (String, InspectionCategory) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, InspectionCategory);
    return updateInspectionCategory(ref, argument.$1, argument.$2);
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
    r'faf236c589c7e1593f9937ead0f040e4f77e33c2';

final class UpdateInspectionCategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionCategory)
        > {
  UpdateInspectionCategoryFamily._()
    : super(
        retry: null,
        name: r'updateInspectionCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateInspectionCategoryProvider call(
    String sheetId,
    InspectionCategory category,
  ) => UpdateInspectionCategoryProvider._(
    argument: (sheetId, category),
    from: this,
  );

  @override
  String toString() => r'updateInspectionCategoryProvider';
}

@ProviderFor(deleteInspectionCategory)
final deleteInspectionCategoryProvider = DeleteInspectionCategoryFamily._();

final class DeleteInspectionCategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteInspectionCategoryProvider._({
    required DeleteInspectionCategoryFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'deleteInspectionCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteInspectionCategoryHash();

  @override
  String toString() {
    return r'deleteInspectionCategoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String);
    return deleteInspectionCategory(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteInspectionCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteInspectionCategoryHash() =>
    r'cdf3b270277a11077de334a0f04853ba7280074b';

final class DeleteInspectionCategoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (String, String)> {
  DeleteInspectionCategoryFamily._()
    : super(
        retry: null,
        name: r'deleteInspectionCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteInspectionCategoryProvider call(String sheetId, String categoryId) =>
      DeleteInspectionCategoryProvider._(
        argument: (sheetId, categoryId),
        from: this,
      );

  @override
  String toString() => r'deleteInspectionCategoryProvider';
}
