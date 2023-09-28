// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$servicesHash() => r'85c9f63223a13d0ef20ae5038ef51c7f5781873f';

/// See also [services].
@ProviderFor(services)
final servicesProvider = FutureProvider<List<UserHomeServices>>.internal(
  services,
  name: r'servicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$servicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServicesRef = FutureProviderRef<List<UserHomeServices>>;
String _$userActiveHash() => r'9475e07d62c28ed9cbb708e4f5076c0b3cc1c1ec';

/// See also [UserActive].
@ProviderFor(UserActive)
final userActiveProvider = NotifierProvider<UserActive, User>.internal(
  UserActive.new,
  name: r'userActiveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userActiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserActive = Notifier<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
