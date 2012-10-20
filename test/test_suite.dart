library circles_api_extension_tests;

import "dart:json";
import "dart:io";
import "dart:uri";

import 'package:unittest/unittest.dart';

// Tested classes
part "../lib/api/circles_api.dart";
part "../lib/api/circler.dart";
part "../lib/api/circles_response.dart";
part "../lib/api/circles_request.dart";
part "../lib/api/followers_number_response.dart";
part "../lib/internal/google_json_cleaner.dart";
part "../lib/internal/circler_mapper.dart";
part "../lib/internal/users_mapper.dart";
part "../lib/internal/circles_request_impl.dart";
part "../lib/internal/circles_request_executor.dart";
// Test Classes
part "api/circler_test.dart";
part "api/circles_response_test.dart";
part "api/circles_api_test.dart";
part "api/followers_number_response_test.dart";
part "internal/google_json_clean_test.dart";
part "internal/users_mapper_test.dart";
part "internal/followers_mapper_test.dart";
part "internal/circles_request_impl_test.dart";
/**
 * Call all tests.
 */
class TestSuite {

  /**
   * All test
   */
  final List<_Testable> _tests;

  TestSuite() : _tests = [ new GoogleJsonCleanerTest(), new CirclerTest(), new CirclerMapperTest(), //
                           new CirclesApiTest(), new CirclesResponseTest(), new FollowersNumberResponseTest(), //
                           new FollowersMapperTest(), new CirclesRequestImplTest() ];

  /**
   * Run all tests
   */
  run(){
    _tests.forEach((_test) => group('${_test.description()} -', _test.runTest)) ;
  }

}

main() {
  new TestSuite().run();
}

/**
 * Calling test interface.
 */
interface _Testable {

  runTest();

  String description();

}



