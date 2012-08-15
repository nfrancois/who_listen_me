/**
 * Test for GoogleJsonCleaner. 
 */
class GoogleJsonCleanerTest {

  _GoogleJsonCleaner _cleaner;
  //= const new _GoogleJsonCleaner();
  
  /**
   * A complete response.
   */ 
  _completeResponse(){
      // Given
      String incoming = (new File("test/resources/incoming.txt")).readAsTextSync();
      String expected = (new File("test/resources/incoming_clean.txt")).readAsTextSync();  
      
      // When
      String result = _cleaner.clean(incoming);
      
      // Then
      //expect(result, isNotNull(), false);
      expect(result, equals(expected));
  }
  
  
  
  runTest(){
    group('', () {
      setUp(() => _cleaner = new _GoogleJsonCleaner());
      test('a complete response test', () => _completeResponse());
    });
  }
  
  String description(){
    return 'Google JSon cleaner test';
  }
  
}
