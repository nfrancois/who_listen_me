/**
 * Test for CirlesRequestImplTest.
 */ 
class CirclesRequestImplTest {
  
  const String GOOGLE_PLUS_ID = "115816334172157652403";
  
  _CirclesRequest _request;
  _CirclesRequestExecutor _executor;
  
  _cancel_shutdown_the_httpClient(){
    // When
    _request.cancel();
    
    // Then
    _executor._httpClient.getLogs(callsTo('shutdown')).verify(happenedOnce);
    expect(_request._isCanceled);
  }
  
  _httpCall_failed(){
    // Given
    var connexionMock = new ConnexionMock();
    _executor._httpClient.when(callsTo("getUrl")).thenReturn(connexionMock);
    var onErrorIsCall = false;
    // When
    _request._execute();
    _request.onError = (error) => onErrorIsCall = true;
    connexionMock._onErrorCallback("Very big error");
    
    // Then
    _executor._httpClient.getLogs(callsTo('shutdown')).verify(happenedOnce); 
    expect(onErrorIsCall);
  }
  
  runTest(){
    setUp(() {
      _executor = new _CirclesRequestExecutorWithMock();
      _request = new _CirclesRequest(GOOGLE_PLUS_ID, _executor);
    });
    test('cancel shutdown the HttpClient', () => _cancel_shutdown_the_httpClient());
    test('http client call failed', () => _httpCall_failed());
    //test('http client reponse is ok', () => _httpCall_succces());
  }
  
  
  String description(){
    return "Circles Request test";
  }
  
}

// Mock classes

class HttpClientMock extends Mock implements HttpClient {
  
}

class _GoogleJsonCleanerMock extends Mock implements _GoogleJsonCleaner {
  
}

class _CirclerMapperMock extends Mock implements _CirclerMapper {
  
}

class _CirclesRequestExecutorWithMock implements _CirclesRequestExecutor {
  
  final HttpClientMock _httpClient;
  final _GoogleJsonCleanerMock _googleJsonCleanerTest;
  final _CirclerMapperMock _circlerMapper;
  
  _CirclesRequestExecutorWithMock() : _httpClient = new HttpClientMock(),  _googleJsonCleanerTest = new _GoogleJsonCleanerMock(), _circlerMapper = new _CirclerMapperMock();    
  
  
}

class HttpClientResponseMock extends Mock implements HttpClientResponse {
  
}

class ConnexionMock extends Mock {
  
  var _onResponseCallback;
  var _onErrorCallback;
  
  void set onResponse(void callback(HttpClientResponse response)){
    _onResponseCallback = callback;
  }
  
  void set onError(void callback(error)){
    _onErrorCallback = callback;
  }
  
}
