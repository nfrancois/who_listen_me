#library("circles_api_extension_tests");

#import('package:unittest/unittest.dart');
//#import('../lib/unittest/unittest.dart');
#import('dart:io');

// Test Classes 
#source("internal/google_json_clean_test.dart");
// Tested classes
#source("../src/api/circles_api.dart");
#source("../src/internal/google_json_cleaner.dart");

class TestSuite {
  
  final Map<String, _Testable> _tests;  
  
  TestSuite() : _tests = {
        'GoogleJsonClean' : new GoogleJsonCleanerTest()         
  };
  
  run(){
    _tests.forEach((_name, _test){
      print('running $_name ...');
      group(_name, _test.runTest);
    });
  }
  
}

main() {
  new TestSuite().run();
}


interface _Testable {
  
  runTest();
  
}



