/**
 * Api EntryPoint.
 */
class CirclesApi {
  
  static final _GOOGLE_PLUS_ID_TOKEN_URL = @"$googlePlusId";
  static final _INCOMING_PERSON_URL = "https://plus.google.com/_/socialgraph/lookup/incoming/?o=%5Bnull%2Cnull%2C%22$_GOOGLE_PLUS_ID_TOKEN_URL%22%5D&n=1000";
  
  static final String _HTTPS_PROXY = "http://nfrproxy.appspot.com/proxy?url=";
  
  final String _googlePlusId;
  // TODO final
  HttpClient _httpClient;
  _GoogleJsonCleaner _googleJsonCleanerTest;
  _CirclerMapper _circlerMapper;
  
  /**
   * CirclesApi constructor.
   * _googlePlusId : Google Plus Id.
   */
  CirclesApi(this._googlePlusId){
    _httpClient = new HttpClient();
    _googleJsonCleanerTest = new _GoogleJsonCleaner();
    _circlerMapper = new _CirclerMapper();    
  }
  
  /**
   * Find information about you add you in their circler. 
   */
  whoCircleMe(void callback(CirclesResponse circlesResponse)){
    var url = "$_HTTPS_PROXY$_INCOMING_PERSON_URL".replaceFirst(_GOOGLE_PLUS_ID_TOKEN_URL, _googlePlusId);
    var connexion = _httpClient.getUrl(new Uri.fromString(url));
    //print(url);
    connexion.onResponse = (response) => _responseHandler(response, callback); 
    connexion.onError = (error)  {
      // TODO Log error
      callback(null);
    };
  }
  
  _responseHandler(HttpClientResponse response, void callback(CirclesResponse circlesResponse)){
    if(response.statusCode == 200){
      var bytes = new List();
      InputStream input = response.inputStream;
      input.onClosed = () {
        var jsonText = _googleJsonCleanerTest.clean(bytes.getRange(6, bytes.length-6));
        var result = _circlerMapper.map(jsonText);
        callback(result);
      };
      input.onData = () => bytes.addAll(input.read());
      input.onError = (error) {
        // TODO log erreur
        callback(null);
      };
    }    
  }
  
  
}