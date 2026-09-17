// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_member_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inspectionMembers)
final inspectionMembersProvider = InspectionMembersFamily._();

final class InspectionMembersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<InspectionMember>>,
          List<InspectionMember>,
          Stream<List<InspectionMember>>
        >
    with
        $FutureModifier<List<InspectionMember>>,
        $StreamProvider<List<InspectionMember>> {
  InspectionMembersProvider._({
    required InspectionMembersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inspectionMembersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionMembersHash();

  @override
  String toString() {
    return r'inspectionMembersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<InspectionMember>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<InspectionMember>> create(Ref ref) {
    final argument = this.argument as String;
    return inspectionMembers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionMembersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionMembersHash() => r'5b3c5ed9a08e96942e44f20c8327314f392f92b9';

final class InspectionMembersFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<InspectionMember>>, String> {
  InspectionMembersFamily._()
    : super(
        retry: null,
        name: r'inspectionMembersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionMembersProvider call(String inspectionId) =>
      InspectionMembersProvider._(argument: inspectionId, from: this);

  @override
  String toString() => r'inspectionMembersProvider';
}

@ProviderFor(inspectionMemberByUserId)
final inspectionMemberByUserIdProvider = InspectionMemberByUserIdFamily._();

final class InspectionMemberByUserIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<InspectionMember?>,
          InspectionMember?,
          Stream<InspectionMember?>
        >
    with
        $FutureModifier<InspectionMember?>,
        $StreamProvider<InspectionMember?> {
  InspectionMemberByUserIdProvider._({
    required InspectionMemberByUserIdFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'inspectionMemberByUserIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inspectionMemberByUserIdHash();

  @override
  String toString() {
    return r'inspectionMemberByUserIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<InspectionMember?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<InspectionMember?> create(Ref ref) {
    final argument = this.argument as (String, String);
    return inspectionMemberByUserId(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionMemberByUserIdProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inspectionMemberByUserIdHash() =>
    r'109165c8c3a11079451b70c7dc53cdb36a87be86';

final class InspectionMemberByUserIdFamily extends $Family
    with
        $FunctionalFamilyOverride<Stream<InspectionMember?>, (String, String)> {
  InspectionMemberByUserIdFamily._()
    : super(
        retry: null,
        name: r'inspectionMemberByUserIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InspectionMemberByUserIdProvider call(String inspectionId, String userId) =>
      InspectionMemberByUserIdProvider._(
        argument: (inspectionId, userId),
        from: this,
      );

  @override
  String toString() => r'inspectionMemberByUserIdProvider';
}

@ProviderFor(joinInspection)
final joinInspectionProvider = JoinInspectionFamily._();

final class JoinInspectionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  JoinInspectionProvider._({
    required JoinInspectionFamily super.from,
    required (String, InspectionMemberRole) super.argument,
  }) : super(
         retry: null,
         name: r'joinInspectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$joinInspectionHash();

  @override
  String toString() {
    return r'joinInspectionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (String, InspectionMemberRole);
    return joinInspection(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is JoinInspectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$joinInspectionHash() => r'2cc49caffd2d7b50d374bf59291175dd57e0a28b';

final class JoinInspectionFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (String, InspectionMemberRole)
        > {
  JoinInspectionFamily._()
    : super(
        retry: null,
        name: r'joinInspectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  JoinInspectionProvider call(String inspectionId, InspectionMemberRole role) =>
      JoinInspectionProvider._(argument: (inspectionId, role), from: this);

  @override
  String toString() => r'joinInspectionProvider';
}
