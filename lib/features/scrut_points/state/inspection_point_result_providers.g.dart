// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_point_result_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionPointResults)
final inspectionPointResultsProvider = InspectionPointResultsFamily._();

final class InspectionPointResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionPointResult>>,
          List<InspectionPointResult>,
          Stream<List<InspectionPointResult>>
        >
    with
        $FutureModifier<List<InspectionPointResult>>,
        $StreamProvider<List<InspectionPointResult>> {
  InspectionPointResultsProvider._({
    required InspectionPointResultsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inspectionPointResultsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionPointResultsHash();

  @override
  String toString() {
    return r'inspectionPointResultsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionPointResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionPointResult>> create(Ref ref) {
    final argument = this.argument as String;
    return inspectionPointResults(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionPointResultsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionPointResultsHash() =>
    r'2fd0efb150ff0aa2b9da1d3a638e7e15f8f66715';

final class InspectionPointResultsFamily extends $Family
    with
        $FunctionalFamilyOverride<Stream<List<InspectionPointResult>>, String> {
  InspectionPointResultsFamily._()
    : super(
        retry: null,
        name: r'inspectionPointResultsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionPointResultsProvider call(String inspectionId) =>
      InspectionPointResultsProvider._(argument: inspectionId, from: this);

  @override
  String toString() => r'inspectionPointResultsProvider';
}

@ProviderFor(inspectionPointResultByPointId)
final inspectionPointResultByPointIdProvider =
    InspectionPointResultByPointIdFamily._();

final class InspectionPointResultByPointIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionPointResult?>,
          InspectionPointResult?,
          Stream<InspectionPointResult?>
        >
    with
        $FutureModifier<InspectionPointResult?>,
        $StreamProvider<InspectionPointResult?> {
  InspectionPointResultByPointIdProvider._({
    required InspectionPointResultByPointIdFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionPointResultByPointIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionPointResultByPointIdHash();

  @override
  String toString() {
    return r'inspectionPointResultByPointIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<InspectionPointResult?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionPointResult?> create(Ref ref) {
    final argument = this.argument as (String, String);
    return inspectionPointResultByPointId(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionPointResultByPointIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionPointResultByPointIdHash() =>
    r'a4ec19177771557e2bafffedfb6fc82bb6c920ee';

final class InspectionPointResultByPointIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<InspectionPointResult?>,
          (String, String)
        > {
  InspectionPointResultByPointIdFamily._()
    : super(
        retry: null,
        name: r'inspectionPointResultByPointIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionPointResultByPointIdProvider call(
    String inspectionId,
    String scrutPointId,
  ) => InspectionPointResultByPointIdProvider._(
    argument: (inspectionId, scrutPointId),
    from: this,
  );

  @override
  String toString() => r'inspectionPointResultByPointIdProvider';
}

@ProviderFor(scrutPointResults)
final scrutPointResultsProvider = ScrutPointResultsFamily._();

final class ScrutPointResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionPointResult>>,
          List<InspectionPointResult>,
          Stream<List<InspectionPointResult>>
        >
    with
        $FutureModifier<List<InspectionPointResult>>,
        $StreamProvider<List<InspectionPointResult>> {
  ScrutPointResultsProvider._({
    required ScrutPointResultsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'scrutPointResultsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$scrutPointResultsHash();

  @override
  String toString() {
    return r'scrutPointResultsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionPointResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionPointResult>> create(Ref ref) {
    final argument = this.argument as String;
    return scrutPointResults(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ScrutPointResultsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$scrutPointResultsHash() => r'8cd2387f32b793bcc6093ec0605e2e2af60e2bb7';

final class ScrutPointResultsFamily extends $Family
    with
        $FunctionalFamilyOverride<Stream<List<InspectionPointResult>>, String> {
  ScrutPointResultsFamily._()
    : super(
        retry: null,
        name: r'scrutPointResultsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScrutPointResultsProvider call(String scrutPointId) =>
      ScrutPointResultsProvider._(argument: scrutPointId, from: this);

  @override
  String toString() => r'scrutPointResultsProvider';
}
