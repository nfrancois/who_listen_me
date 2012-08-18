#import("../circles_api_extension.dart");

/**
 * This sample list persons in our google plus page.
 */ 
main(){
  var circles = new CirclesApi('115816334172157652403');
  circles.getPersonsWhoCircled( (CirclesResponse response) {
    print("Total number of persons = ${response.totalPersons}");
    print("Visible persons:");
    response.visiblesPersons.forEach((person) => print(person.name));
  });
}
