#import("../who_listen_me.dart");

/**
 * This sample list persons in our google plus page.
 */ 
main(){
  var circles = new CirclesApi('115816334172157652403');
  circles.whoCircleMe( (CirclesResponse response) {
    print("Total number of persons = ${response.totalCirclers}");
    print("Visible persons:");
    response.visiblesCirclers.forEach((person) => print(person.name));
  });
}
