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
  
  _shouldANullBeetweenComma(){
    // Given
    String incoming = ',,,';
    
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',null,null,'));    
  }
  
  
  
  runTest(){
    group('', () {
      setUp(() => _cleaner = new _GoogleJsonCleaner());
      test('complete response test', () => _completeResponse());
      test('null value must be added between comma', () => _shouldANullBeetweenComma());
    });
  }
  
  String description(){
    return 'Google JSon cleaner test';
  }
  
}
