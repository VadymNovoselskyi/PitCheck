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
    required (String, String) super.argument,
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
    final argument = this.argument as (String, String);
    return inspectionSubcategories(ref, argument.$1, argument.$2);
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
    r'd30d68c3f6c350ee32613ea8b1f5c5e05c00e63d';

final class InspectionSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<InspectionSubcategory>>,
          (String, String)
        > {
  InspectionSubcategoriesFamily._()
    : super(
        retry: null,
        name: r'inspectionSubcategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionSubcategoriesProvider call(String sheetId, String categoryId) =>
      InspectionSubcategoriesProvider._(
        argument: (sheetId, categoryId),
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
          AsyncValue<InspectionSubcategory>,
          InspectionSubcategory,
          Stream<InspectionSubcategory>
        >
    with
        $FutureModifier<InspectionSubcategory>,
        $StreamProvider<InspectionSubcategory> {
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
  $StreamProviderElement<InspectionSubcategory> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionSubcategory> create(Ref ref) {
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
    r'4ccd7e881425fb3422a908670f08aee5a70efbb6';

final class InspectionSubcategoryByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<InspectionSubcategory>,
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
    required (String, String, InspectionSubcategory) super.argument,
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
    final argument = this.argument as (String, String, InspectionSubcategory);
    return addInspectionSubcategory(ref, argument.$1, argument.$2, argument.$3);
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
    r'139d8b73f7840d5aa35d2312f2986dfd1274657b';

final class AddInspectionSubcategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, InspectionSubcategory)
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
    String categoryId,
    InspectionSubcategory subcategory,
  ) => AddInspectionSubcategoryProvider._(
    argument: (sheetId, categoryId, subcategory),
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
    required (String, String, InspectionSubcategory) super.argument,
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
    final argument = this.argument as (String, String, InspectionSubcategory);
    return updateInspectionSubcategory(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
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
    r'2d14e01159d320d297de8643bd1161a3c970dd82';

final class UpdateInspectionSubcategoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, String, InspectionSubcategory)
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
    String categoryId,
    InspectionSubcategory subcategory,
  ) => UpdateInspectionSubcategoryProvider._(
    argument: (sheetId, categoryId, subcategory),
    from: this,
  );

  @override
  String toString() => r'updateInspectionSubcategoryProvider';
}

@ProviderFor(deleteInspectionSubcategory)
final deleteInspectionSubcategoryProvider =
    DeleteInspectionSubcategoryFamily._();

final class DeleteInspectionSubcategoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteInspectionSubcategoryProvider._({
    required DeleteInspectionSubcategoryFamily super.from,
    required (String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'deleteInspectionSubcategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteInspectionSubcategoryHash();

  @override
  String toString() {
    return r'deleteInspectionSubcategoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, String, String);
    return deleteInspectionSubcategory(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteInspectionSubcategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteInspectionSubcategoryHash() =>
    r'0e63d40873ff148c9382f4e11bee1087901ba842';

final class DeleteInspectionSubcategoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (String, String, String)> {
  DeleteInspectionSubcategoryFamily._()
    : super(
        retry: null,
        name: r'deleteInspectionSubcategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteInspectionSubcategoryProvider call(
    String sheetId,
    String categoryId,
    String subcategoryId,
  ) => DeleteInspectionSubcategoryProvider._(
    argument: (sheetId, categoryId, subcategoryId),
    from: this,
  );

  @override
  String toString() => r'deleteInspectionSubcategoryProvider';
}
