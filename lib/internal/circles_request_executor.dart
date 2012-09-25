class _CirclesRequestExecutor {

  final HttpClient _httpClient;
  final _GoogleJsonCleaner _googleJsonCleanerTest;
  final _CirclerMapper _circlerMapper;

  _CirclesRequestExecutor() : _httpClient = new HttpClient(), _googleJsonCleanerTest = new _GoogleJsonCleaner(), _circlerMapper = new _CirclerMapper();

}