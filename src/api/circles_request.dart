/**
 * A request on circles.
 */ 
interface CirclesRequest {
  
  void onResponse(void callback(CirclesResponse response));
  
  void onError(void callback(error));
  
}
