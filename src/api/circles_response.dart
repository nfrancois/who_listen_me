/**
 * A response from CirclesApi.
 * Contains a list of visible persons and a total circles number
 */
class CirclesResponse {
  
  int totalPersons;
  List<Person> visiblesPersons;
  
  CirclesResponse(this.totalPersons, this.visiblesPersons);
 
}
