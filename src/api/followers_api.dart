/**
 * Request on twitter's followers.
 */ 
class FollowersApi {
  
  final FollowersRequestExecutor _executor;
  
  FollowersApi() : _executor = new FollowersRequestExecutor();
  
  FollowersNumberRequest getFollowerNumberByNickname(String nickname){
    var request = new _FollowersNumberRequest(_executor);
    request._execute(nickname);
    return request;
  }
  
}
