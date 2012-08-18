/**
 * Test for CirclesApi. 
 */
class CirclesApiTest {
  
  CirclesApi _circlesApi;
  
  
  _onResponseOk(){
    // Given
    var incomingFile = new File("test/resources/incoming_clean.txt");    
    HttpClientResponse httpResponse = new HttpResponseMock(200, incomingFile);
    // When
    //_circlesApi._responseHandler(httpResponse);
  }
  
  // TODO response ko;
  
  runTest(){
    setUp(() => _circlesApi = new CirclesApi("106226789128312528511"));
    test('response ok', () => _onResponseOk());
  }
  
  String description(){
    return "Circles api test";
  }
  
}

// TODO use a mock
class HttpResponseMock /*extends Mock*/ implements HttpClientResponse {
  
  int _statusCode;
  int _inputStream;
  
  HttpResponseMock(this._statusCode, File file){
    var input = file.readAsTextSync();
    var inputStream = new ListInputStream();
    inputStream.write(input.charCodes());
    // mock
    //when(callsTo('statusCode')).alwaysCall(statusCode);
    //when(callsTo('statusCode')).alwaysCall(_real.login);
  }
  
  int get statusCode() => _statusCode;
  InputStream get inputStream() => _inputStream;
  
}