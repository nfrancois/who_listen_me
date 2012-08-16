#library("circles_api_extension_tests");

#import('package:unittest/unittest.dart');
//#import('../lib/unittest/unittest.dart');
#import('dart:io');

// Test Classes 
#source("api/person_test.dart");
#source("internal/google_json_clean_test.dart");
#source("internal/person_mapper_test.dart");
// Tested classes
#source("../src/api/circles_api.dart");
#source("../src/api/person.dart");
#source("../src/internal/google_json_cleaner.dart");
#source("../src/internal/person_mapper.dart");

/**
 * Call all tests.
 */
class TestSuite {
  
  /**
   * All test
   */
  final List<_Testable> _tests;  
  
  TestSuite() : _tests = [ new GoogleJsonCleanerTest(), new PersonTest(), new PersonMapperTest()  ];
  
  /**
   * Run all tests
   */
  run(){
    _tests.forEach((_test) => group('${_test.description()} - ', _test.runTest)) ;
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



