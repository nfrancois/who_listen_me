/**
 * Api EntryPoint.
 */
class CirclesApi {
  
 final  _CirclesRequestExecutor _executor;
  
  CirclesApi() : _executor = new _CirclesRequestExecutor();
  
  /**
   * Find information about you add you in their circler. 
   */
  CirclesRequest whoCircleMe(String googlePlusId){
    var request = new _CirclesRequest(googlePlusId, _executor);
    request._execute();
    return request;
  }
    
}