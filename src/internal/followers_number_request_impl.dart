
class _FollowersNumberRequest implements FollowersNumberRequest {
  
  static final String USERS_API_BY_NICKNAME = @"http://api.twitter.com/1/users/show.json?screen_name=${nickname}";
  static final String NICKNAME_FIELD = @"${nickname}";
      
  final FollowersRequestExecutor _executor;
  
  var _onResponseCallback;
  var _onErrorCallback;  
  
  bool _isCanceled = false;
  
  _FollowersNumberRequest(this._executor);

  _execute(String nickname) {
    var url = USERS_API_BY_NICKNAME.replaceFirst(NICKNAME_FIELD, nickname);
    var connexion = _executor._httpClient.getUrl(new Uri.fromString(url));
    connexion..onResponse = ((httpResponse) => _responseHandler(httpResponse))
             ..onError = (error)  {
      if(_onErrorCallback != null && !_isCanceled){
        _onErrorCallback(error);
      }
      _stopHttpClient();
    };    
  }
  
  _responseHandler(httpResponse){
    if(httpResponse.statusCode == 200 && !_isCanceled){
      var buffer = new StringBuffer();
      InputStream input = httpResponse.inputStream;
      input..onClosed = () {
        var response = _executor._userMapper.map(buffer.toString());
        if(_onResponseCallback != null && !_isCanceled){
          _onResponseCallback(response);
        }
        _stopHttpClient();
      }
           ..onData = (() => buffer.add(new String.fromCharCodes(input.read())))
           ..onError = (error) {
        if(_onErrorCallback != null && !_isCanceled){
          _onErrorCallback(error);
        }
        _stopHttpClient();
      };
    } else {
      _stopHttpClient();
    }
  }  
  
  void set onResponse(void callback(FollowersNumberResponse response)){
    _onResponseCallback = callback;
  }
  
  void set onError(void callback(error)){
    _onErrorCallback = callback;
  }  

  void cancel(){
    _isCanceled = true;
    _stopHttpClient();
  }
  
  _stopHttpClient(){
    _executor._httpClient.shutdown();
  }  
  
}
