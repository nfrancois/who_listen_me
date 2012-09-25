
class _FollowersNumberRequest implements FollowersNumberRequest {

  static final String USERS_API_BY_NICKNAME = r"http://api.twitter.com/1/users/show.json?screen_name=${nickname}";
  static final String NICKNAME_FIELD = r"${nickname}";

  final FollowersRequestExecutor _executor;

  var _onResponseCallback;
  var _onErrorCallback;

  bool _isCanceled = false;

  _FollowersNumberRequest(this._executor);

  _execute(String nickname) {
    var url = USERS_API_BY_NICKNAME.replaceFirst(NICKNAME_FIELD, nickname);
    var connexion = _executor._httpClient.getUrl(new Uri.fromString(url));
    connexion..onResponse = ((httpResponse) => _responseHandler(httpResponse))
             ..onError = (error)  => _error(error);
  }

  _responseHandler(httpResponse){
    if(!_isCanceled){
      if(httpResponse.statusCode == HttpStatus.OK){
        var buffer = new StringBuffer();
        InputStream input = httpResponse.inputStream;
        input..onClosed = (() => _result(buffer.toString()))
             ..onData = (() => buffer.add(new String.fromCharCodes(input.read())))
             ..onError = (error)  => _error(error);
      } else {
       _error('Bad http status ${httpResponse.statusCode}');
      }
    }
  }

  void _result(String content){
    var response = _executor._userMapper.map(content);
    if(_onResponseCallback != null && !_isCanceled){
      _onResponseCallback(response);
    }
    _stopHttpClient();
  }

  void _error(error){
    if(_onErrorCallback != null && !_isCanceled){
      _onErrorCallback(error);
    }
    _stopHttpClient();
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
