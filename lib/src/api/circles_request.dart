part of who_listen_me;

/**
 * A request on circles.
 */
abstract class CirclesRequest {

  /**
   * When response is received.
   */
  void set onResponse(void callback(CirclesResponse response));

  /**
   * Sometimes errors happens.
   */
  void set onError(void callback(error));

  /**
   * Cancel the request.
   */
  void cancel();

}
