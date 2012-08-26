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
  
  runTest(){
    setUp(() {
      _executor = new _CirclesRequestExecutorWithMock();
      _request = new _CirclesRequest(GOOGLE_PLUS_ID, _executor);
    });
    test('cancel shutdown the HttpClient', () => _cancel_shutdown_the_httpClient());
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
