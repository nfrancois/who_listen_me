class CirclesApi {
  
  static final _GOOGLE_PLUS_ID_TOKEN_URL = @"$googlePlusId";
  static final _INCOMING_PERSON_URL = "https://plus.google.com/_/socialgraph/lookup/incoming/?o=%5Bnull%2Cnull%2C%22$_GOOGLE_PLUS_ID_TOKEN_URL%22%5D&n=1000";
  
  static final String _HTTPS_PROXY = "http://nfrproxy.appspot.com/proxy?url=";
  
  final String _googleId;
  HttpClient _httpClient;
  _GoogleJsonCleaner _googleJsonCleanerTest;
  _PersonMapper _personMapper;
  
  CirclesApi(this._googleId){
    _httpClient = new HttpClient();
    _googleJsonCleanerTest = new _GoogleJsonCleaner();
    _personMapper = new _PersonMapper();    
  }
  
  getPersonsWhoCircled(){
    var url = "$_HTTPS_PROXY$_INCOMING_PERSON_URL".replaceFirst(_GOOGLE_PLUS_ID_TOKEN_URL, _googleId);
    var connexion = _httpClient.getUrl(new Uri.fromString(url));
    print(url);
    connexion.onResponse = (HttpClientResponse response) { 
      // TODO tester ça
      if(response.statusCode == 200){
        var bytes = new List();
        InputStream input = response.inputStream;
        input.onClosed = () {
          var jsonText = _googleJsonCleanerTest.clean(bytes.getRange(6, bytes.length-6));
          print(jsonText);
          var list = _personMapper.map(jsonText);
          print(list.length);
        };
        input.onData = () => bytes.addAll(input.read());
        input.onError = (error) => print(error);
      }
      connexion.onError = (error) {
        print(error);
      };
    };
  }
  
  
}