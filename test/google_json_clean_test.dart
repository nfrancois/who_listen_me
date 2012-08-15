
class GoogleJsonCleanerTest {
  
  
  runTest(){
    test('Google JSon clean', () {
      // Given
      _GoogleJsonCleaner _cleaner = new _GoogleJsonCleaner();
      String incoming = (new File("test/incoming.txt")).readAsTextSync();
      String expected = (new File("test/incoming_clean.txt")).readAsTextSync();  
      
      // When
      String result = _cleaner._clean(incoming);
      
      // Then
      //expect(result, isNotNull(), false);
      expect(result, equals(expected));
    });
  }
  
}
