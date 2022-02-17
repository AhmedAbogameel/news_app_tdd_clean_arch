// Mocks generated by Mockito 5.1.0 from annotations
// in news_app_tdd_clean_arch/test/features/home/data/respository/repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart'
    as _i2;
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSource extends _i1.Mock
    implements _i2.HomeRemoteDataSource {
  MockHomeRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ArticleModel>> getSportsNews() =>
      (super.noSuchMethod(Invocation.method(#getSportsNews, []),
              returnValue:
                  Future<List<_i4.ArticleModel>>.value(<_i4.ArticleModel>[]))
          as _i3.Future<List<_i4.ArticleModel>>);
}