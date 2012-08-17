/**
 * Map the clean json response to list of person. 
 */
class _PersonMapper implements _Mapper<Person> {
  
  static final String HTTP= "http:";
  
  Collection<Person> map(String jsonText){
    var jsonTab = JSON.parse(jsonText);
    return jsonTab[0][2].map((jsonFragment) => _mapPerson(jsonFragment));
  }
  
  Person _mapPerson(jsonFragment){
    var person = new Person();
    person.googlePlusId = jsonFragment[0][2];
    person.name = jsonFragment[2][0];
    var photo = jsonFragment[2][8];
    person.photo = (photo.startsWith(HTTP)) ? photo : "$HTTP$photo";
    person.location = jsonFragment[2][11];
    person.profession = jsonFragment[2][14];
    person.description = jsonFragment[2][21];
    return person;
  }
  
}