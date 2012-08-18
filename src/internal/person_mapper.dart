/**
 * Map the clean json response to list of person. 
 */
class _PersonMapper {
  
  static final String HTTP= "http:";
  
  CirclesResponse map(String jsonText){
    var jsonTab = JSON.parse(jsonText);
    var totalPersons = jsonTab[0][4];
    var visiblesPersons = _mapPersons(jsonTab[0][2]);
    return new CirclesResponse(totalPersons, visiblesPersons);
  }
  
  
  Collection<Person> _mapPersons(jsonTab){
    return jsonTab.map((jsonFragment) => _mapPerson(jsonFragment));
  }
  
  Person _mapPerson(jsonFragment){
    var person = new Person(jsonFragment[0][2]);
    person.name = jsonFragment[2][0];
    var photo = jsonFragment[2][8];
    person.photo = (photo.startsWith(HTTP)) ? photo : "$HTTP$photo";
    person.location = jsonFragment[2][11];
    person.profession = jsonFragment[2][14];
    person.description = jsonFragment[2][21];
    return person;
  }
  
}