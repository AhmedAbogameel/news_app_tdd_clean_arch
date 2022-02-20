// Mocks generated by Mockito 5.1.0 from annotations
// in news_app_tdd_clean_arch/test/features/home/data/data_sources/local_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:flutter/widgets.dart' as _i7;
import 'package:get/utils.dart' as _i3;
import 'package:get_storage/src/storage_impl.dart' as _i2;
import 'package:get_storage/src/value.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMicrotask_0 extends _i1.Fake implements _i2.Microtask {}

class _FakeGetQueue_1 extends _i1.Fake implements _i3.GetQueue {}

class _FakeValueStorage_2<T> extends _i1.Fake implements _i4.ValueStorage<T> {}

/// A class which mocks [GetStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStorage extends _i1.Mock implements _i2.GetStorage {
  MockGetStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Microtask get microtask =>
      (super.noSuchMethod(Invocation.getter(#microtask),
          returnValue: _FakeMicrotask_0()) as _i2.Microtask);
  @override
  _i3.GetQueue get queue => (super.noSuchMethod(Invocation.getter(#queue),
      returnValue: _FakeGetQueue_1()) as _i3.GetQueue);
  @override
  set queue(_i3.GetQueue? _queue) =>
      super.noSuchMethod(Invocation.setter(#queue, _queue),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> get initStorage =>
      (super.noSuchMethod(Invocation.getter(#initStorage),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  set initStorage(_i5.Future<bool>? _initStorage) =>
      super.noSuchMethod(Invocation.setter(#initStorage, _initStorage),
          returnValueForMissingStub: null);
  @override
  Map<String, dynamic> get changes =>
      (super.noSuchMethod(Invocation.getter(#changes),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  _i4.ValueStorage<Map<String, dynamic>> get listenable =>
      (super.noSuchMethod(Invocation.getter(#listenable),
              returnValue: _FakeValueStorage_2<Map<String, dynamic>>())
          as _i4.ValueStorage<Map<String, dynamic>>);
  @override
  T? read<T>(String? key) =>
      (super.noSuchMethod(Invocation.method(#read, [key])) as T?);
  @override
  T getKeys<T>() => throw UnsupportedError(
      '\'getKeys\' cannot be used without a mockito fallback generator.');
  @override
  T getValues<T>() => throw UnsupportedError(
      '\'getValues\' cannot be used without a mockito fallback generator.');
  @override
  bool hasData(String? key) => (super
          .noSuchMethod(Invocation.method(#hasData, [key]), returnValue: false)
      as bool);
  @override
  _i6.VoidCallback listen(_i6.VoidCallback? value) => (super
          .noSuchMethod(Invocation.method(#listen, [value]), returnValue: () {})
      as _i6.VoidCallback);
  @override
  _i6.VoidCallback listenKey(String? key, _i7.ValueSetter<dynamic>? callback) =>
      (super.noSuchMethod(Invocation.method(#listenKey, [key, callback]),
          returnValue: () {}) as _i6.VoidCallback);
  @override
  _i5.Future<void> write(String? key, dynamic value) =>
      (super.noSuchMethod(Invocation.method(#write, [key, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void writeInMemory(String? key, dynamic value) =>
      super.noSuchMethod(Invocation.method(#writeInMemory, [key, value]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<void> writeIfNull(String? key, dynamic value) =>
      (super.noSuchMethod(Invocation.method(#writeIfNull, [key, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> erase() => (super.noSuchMethod(Invocation.method(#erase, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> save() => (super.noSuchMethod(Invocation.method(#save, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}