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

@ProviderFor(InspectionMemberActions)
final inspectionMemberActionsProvider = InspectionMemberActionsProvider._();

final class InspectionMemberActionsProvider
    extends $AsyncNotifierProvider<InspectionMemberActions, void> {
  InspectionMemberActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inspectionMemberActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inspectionMemberActionsHash();

  @$internal
  @override
  InspectionMemberActions create() => InspectionMemberActions();
}

String _$inspectionMemberActionsHash() =>
    r'5a888a65d65644a655aac350c0f33458ebc1b638';

abstract class _$InspectionMemberActions extends $AsyncNotifier<void> {
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
