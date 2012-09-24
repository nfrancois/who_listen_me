#Who listen me ?

Who listen me is a small api to know you listen you on social networks.


## Google Plus

Who has added you in their circles ?

```
#import("package:who_listen_me/who_listen_me.dart");

/**
 * This sample list persons in our google plus page.
 */ 
main(){
  var circles = new CirclesApi();
  var request = circles.whoCircleMe('115816334172157652403');
  request..onError = ((error) => print(error))
         ..onResponse = ((response) {
    print("Total number of persons = ${response.totalCirclers}");
    print("Visible persons:");
    response.visiblesCirclers.forEach((person) => print(person.name));
  });
}
```


## Twitter

```
#import("package:who_listen_me/who_listen_me.dart");

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
```