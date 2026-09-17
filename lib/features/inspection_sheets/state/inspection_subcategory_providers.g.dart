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

@ProviderFor(InspectionSubcategoryActions)
final inspectionSubcategoryActionsProvider =
    InspectionSubcategoryActionsProvider._();

final class InspectionSubcategoryActionsProvider
    extends $AsyncNotifierProvider<InspectionSubcategoryActions, void> {
  InspectionSubcategoryActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionSubcategoryActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionSubcategoryActionsHash();

  @$internal
  @override
  InspectionSubcategoryActions create() => InspectionSubcategoryActions();
}

String _$inspectionSubcategoryActionsHash() =>
    r'c01d95c3d2dd9dfd71df49269db52363648477ec';

abstract class _$InspectionSubcategoryActions extends $AsyncNotifier<void> {
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
