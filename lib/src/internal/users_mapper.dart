part of who_listen_me;

/**
 * Map users response to FollowersNumberResponse
 */
class UsersMapper {

  static final String ID_FIELD = "id";
  static final String NAME_FIELD = "name";
  static final String NICKNAME_FIELD = "screen_name";
  static final String FOLLOWERS_FIELD = "followers_count";

  FollowersNumberResponse map(String jsonText){
    var jsonObject = JSON.parse(jsonText);
    return new FollowersNumberResponse(jsonObject[NICKNAME_FIELD], jsonObject[NAME_FIELD], jsonObject[ID_FIELD], jsonObject[FOLLOWERS_FIELD]);
  }

}
