/**
 * Objects needs to execute a twitter request
 */ 
class FollowersRequestExecutor {
  
   final HttpClient _httpClient;
   final UsersMapper _userMapper;
   
   FollowersRequestExecutor() : _httpClient = new HttpClient(), _userMapper = new UsersMapper();
  
}
