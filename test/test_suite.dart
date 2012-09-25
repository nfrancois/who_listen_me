#library("circles_api_extension_tests");

#import("dart:json");
#import('dart:io');
#import("dart:uri");

#import('package:unittest/unittest.dart');

// Tested classes
#source("../lib/api/circles_api.dart");
#source("../lib/api/circler.dart");
#source("../lib/api/circles_response.dart");
#source("../lib/api/circles_request.dart");
#source("../lib/api/followers_number_response.dart");
#source("../lib/internal/google_json_cleaner.dart");
#source("../lib/internal/circler_mapper.dart");
#source("../lib/internal/users_mapper.dart");
#source("../lib/internal/circles_request_impl.dart");
#source("../lib/internal/circles_request_executor.dart");
// Test Classes
#source("api/circler_test.dart");
#source("api/circles_response_test.dart");
#source("api/circles_api_test.dart");
#source("api/followers_number_response_test.dart");
#source("internal/google_json_clean_test.dart");
#source("internal/users_mapper_test.dart");
#source("internal/followers_mapper_test.dart");
#source("internal/circles_request_impl_test.dart");
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



