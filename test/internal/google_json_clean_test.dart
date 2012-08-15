/**
 * Test for GoogleJsonCleaner. 
 */
class GoogleJsonCleanerTest {

  _GoogleJsonCleaner _cleaner;
  //= const new _GoogleJsonCleaner();
  
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
  
  _shouldAddNullValueBetweenBraceAnComma(){
    // Given
    String incoming = '[,';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('[null,'));       
  }
  
  _shouldAddNullValueBetweenCommaAndBrace(){
    // Given
    String incoming = ',]';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',null]'));       
  }  
  
  _ignoreNewLine(){
    // Given
    String incoming = 'something\n';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('something'));    
  }
  
  
  runTest(){
    group('', () {
      setUp(() => _cleaner = new _GoogleJsonCleaner());
      test('null value must be added between comma', () => _shouldANullBeetweenComma());
      test('null value must be added between brace and comma', () => _shouldAddNullValueBetweenBraceAnComma());
      test('null value must be added between comma and brace', () => _shouldAddNullValueBetweenCommaAndBrace());
      test('ignore new line char', () => _ignoreNewLine());
      test('complete response test', () => _completeResponse());
    });
  }
  
  String description(){
    return 'Google JSon cleaner test';
  }
  
}
