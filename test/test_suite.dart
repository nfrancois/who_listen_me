#library("circles_api_extension_tests");

#import('package:unittest/unittest.dart');
//#import('../lib/unittest/unittest.dart');
#import('dart:io');

// Test Classes 
#source("internal/google_json_clean_test.dart");
// Tested classes
#source("../src/api/circles_api.dart");
#source("../src/internal/google_json_cleaner.dart");

/**
 * Call all tests.
 */
class TestSuite {
  
  /**
   * All test
   */
  final List<_Testable> _tests;  
  
  TestSuite() : _tests = [ new GoogleJsonCleanerTest()  ];
  
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



