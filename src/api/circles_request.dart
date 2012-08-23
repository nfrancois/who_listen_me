/**
 * A request on circles.
 */ 
interface CirclesRequest {
  
  void set onResponse(void callback(CirclesResponse response));
  
  void set onError(void callback(error));
  
}
