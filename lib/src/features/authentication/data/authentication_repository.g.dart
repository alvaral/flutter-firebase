// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationRepositoryHash() =>
    r'6af35eaa158d64b88fb00f6787351a5a80b511ce';

/// See also [authenticationRepository].
@ProviderFor(authenticationRepository)
final authenticationRepositoryProvider =
    Provider<AuthenticationRepository>.internal(
  authenticationRepository,
  name: r'authenticationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationRepositoryRef = ProviderRef<AuthenticationRepository>;
String _$authenticationStateChangesHash() =>
    r'9aac24b62ea59e8e62c0259a9e18781cf2888034';

/// See also [authenticationStateChanges].
@ProviderFor(authenticationStateChanges)
final authenticationStateChangesProvider = StreamProvider<User?>.internal(
  authenticationStateChanges,
  name: r'authenticationStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthenticationStateChangesRef = StreamProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
