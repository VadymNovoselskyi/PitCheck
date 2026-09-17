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

@ProviderFor(InspectionCategoryActions)
final inspectionCategoryActionsProvider = InspectionCategoryActionsProvider._();

final class InspectionCategoryActionsProvider
    extends $AsyncNotifierProvider<InspectionCategoryActions, void> {
  InspectionCategoryActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionCategoryActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionCategoryActionsHash();

  @$internal
  @override
  InspectionCategoryActions create() => InspectionCategoryActions();
}

String _$inspectionCategoryActionsHash() =>
    r'bae5c34872857051e69cd1cb362df7d10a1d0f69';

abstract class _$InspectionCategoryActions extends $AsyncNotifier<void> {
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
