part of who_listen_me;

/**
 * A request on twitter's follower numbers.
 */
abstract class FollowersNumberRequest {

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
