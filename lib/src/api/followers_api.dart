part of who_listen_me;

/**
 * Request on twitter's followers.
 */
class FollowersApi {

  FollowersNumberRequest getFollowerNumberByNickname(String nickname){
    var request = new _FollowersNumberRequest(new FollowersRequestExecutor());
    request._execute(nickname);
    return request;
  }

}
