#import("../who_listen_me.dart");

/**
 * This sample print information about you.
 */ 
main(){
  var followers = new FollowersApi();
  var request = followers.getFollowerNumberByNickname("nicofrancois");
  request..onError = ((error) => print(error))
         ..onResponse = ((FollowersNumberResponse response) {
              print("Hello, ${response.name}, you got ${response.totalFollowers} followers");      
         });
  
}
