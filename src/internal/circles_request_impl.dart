class _CirclesRequest implements CirclesRequest {
  
  static final _GOOGLE_PLUS_ID_TOKEN_URL = @"$googlePlusId";
  static final _INCOMING_PERSON_URL = "https://plus.google.com/_/socialgraph/lookup/incoming/?o=%5Bnull%2Cnull%2C%22$_GOOGLE_PLUS_ID_TOKEN_URL%22%5D&n=1000";
  
  static final String _HTTPS_PROXY = "http://nfrproxy.appspot.com/proxy?url=";
  
  final String _googlePlusId;
  final _CirclesRequestExecutor _executor;
  
  var _onResponseCallback;
  var _onErrorCallback;
  
  HttpClientConnection _connexion;
  bool _isCanceled = false;  

  /**
   * CirclesApi constructor.
   * _googlePlusId : Google Plus Id.
   */
  _CirclesRequest(this._googlePlusId, this._executor);  

  _execute(){  
    var url = "$_HTTPS_PROXY$_INCOMING_PERSON_URL".replaceFirst(_GOOGLE_PLUS_ID_TOKEN_URL, _googlePlusId);
    _connexion = _executor._httpClient.getUrl(new Uri.fromString(url));
    _connexion..onResponse = ((httpResponse) => _responseHandler(httpResponse))
             ..onError = (error)  {
      if(_onErrorCallback != null && !_isCanceled){
        _onErrorCallback(error);
      }
    };
  }  
  
  _responseHandler(httpResponse){
    if(httpResponse.statusCode == 200 && !_isCanceled){
      var bytes = new List();
      InputStream input = httpResponse.inputStream;
      input..onClosed = () {
        var jsonText = _executor._googleJsonCleanerTest.clean(bytes.getRange(6, bytes.length-6));
        var circlesResponse = _executor._circlerMapper.map(jsonText);
        if(_onResponseCallback != null && !_isCanceled){
          _onResponseCallback(circlesResponse);
        }
      }
           ..onData = (() => bytes.addAll(input.read()))
           ..onError = (error) {
        if(_onErrorCallback != null && !_isCanceled){
          _onErrorCallback(error);
        }
      };
    }    
  }  
  
  void set onResponse(void callback(CirclesResponse response)){
    _onResponseCallback = callback;
  }
  
  void set onError(void callback(error)){
    _onErrorCallback = callback;
  }
  
  void cancel(){
    _isCanceled = true;
    if(_connexion != null){
      //_connexion.detachSocket();
    }
  }
  
}