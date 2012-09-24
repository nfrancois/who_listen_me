/**
 * A request on twitter's follower numbers. 
 */  
interface FollowersNumberRequest {
  
  /**
   * When response is received.
   */ 
  void set onResponse(void callback(FollowersNumberResponse response));
  
  /**
   * Sometimes errors happens.
   */ 
  void set onError(void callback(error)); 
  
  /**
   * Cancel the request.
   */ 
  void cancel();
  
}