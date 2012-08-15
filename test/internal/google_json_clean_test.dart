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
  
  _ignoreSpace(){
    // Given
    String incoming = ',something ,';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',something,'));    
  }
  
  _notIgnoreSpaceInQuote(){
    // Given
    String incoming = '"something "';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('"something "'));    
  }
  
  _notIgnoreNewLineInQuote(){
    // Given
    String incoming = '"something\n"';
    // When
    String result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('"something\n"'));    
  }  
  
  runTest(){
    group('', () {
      setUp(() => _cleaner = new _GoogleJsonCleaner());
      test('add null value between twos commas', () => _shouldANullBeetweenComma());
      test('add null value between brace and comma', () => _shouldAddNullValueBetweenBraceAnComma());
      test('add null value between comma and brace', () => _shouldAddNullValueBetweenCommaAndBrace());
      test('ignore new line char', () => _ignoreSpace());
      test('ignore space', () => _ignoreNewLine());
      test('not ignore space in quote', () => _notIgnoreSpaceInQuote());
      test('not ignore new line in quote', () => _notIgnoreNewLineInQuote());
      test('complete response test', () => _completeResponse());
    });
  }
  
  String description(){
    return 'Google JSon cleaner test';
  }
  
}
