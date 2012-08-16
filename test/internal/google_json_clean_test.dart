/**
 * Test for GoogleJsonCleaner. 
 */
class GoogleJsonCleanerTest {
  
  
  _GoogleJsonCleaner _cleaner;
  
  _shouldANullBeetweenComma(){
    // Given
    var incoming = ',,,'.charCodes();
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',null,null,'));    
  }
  
  _shouldAddNullValueBetweenBraceAnComma(){
    // Given
    var incoming = '[,'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('[null,'));       
  }
  
  _shouldAddNullValueBetweenCommaAndBrace(){
    // Given
    var incoming = ',]'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',null]'));       
  }  
  
  _ignoreNewLine(){
    // Given
    var incoming = 'something\n'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('something'));    
  }
  
  _ignoreSpace(){
    // Given
    var incoming = ',something ,'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(',something,'));    
  }
  
  _notIgnoreSpaceInQuote(){
    // Given
    var incoming = '"something "'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('"something "'));    
  }
  
  _notIgnoreNewLineInQuote(){
    // Given
    var incoming = '"something\n"'.charCodes();;
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals('"something\n"'));    
  }  
  
  _notCloseQuoteCharAfterEscape(){
    // Given
    var incoming = @'"\"something in quotes in the quotes\""'.charCodes();
    // When
    var result = _cleaner.clean(incoming);
    // Then
    expect(result, equals(@'"\"something in quotes in the quotes\""'));
  }  
 
  _completeResponse(){
      // Given
      var incomingStream = (new File("test/resources/incoming.txt")).readAsBytesSync();
      var incoming = incomingStream.getRange(6, incomingStream.length-6);
      // When
      var result = _cleaner.clean(incoming);
      // Then
      var expected = (new File("test/resources/incoming_clean.txt")).readAsTextSync();  
      expect(result, equals(expected));
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
      test('don''t close quote after escape', () => _notCloseQuoteCharAfterEscape());
      test('complete response test', () => _completeResponse());
    });
  }
  
  String description(){
    return 'Google JSon cleaner test';
  }
  
}
