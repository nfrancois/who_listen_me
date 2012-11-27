part of who_listen_me;

/**
 * Api EntryPoint.
 */
class CirclesApi {

  /**
   * Find information about you add you in their circler.
   */
  CirclesRequest whoCircleMe(String googlePlusId){
    var request = new _CirclesRequest(googlePlusId, new _CirclesRequestExecutor());
    request._execute();
    return request;
  }

}