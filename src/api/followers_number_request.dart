/**
 * A request on twitter's follower numbers. 
 */  
interface FollowersNumberRequest {
  
  void set onResponse(void callback(FollowersNumberResponse response));
  
  void set onError(void callback(error));  
  
}
