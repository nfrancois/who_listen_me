/**
 * Test for Person.
 */ 
class PersonTest {
  
  _sameGooglePlusId_equals(){
    // Given
    Person first = new Person();
    first.googlePlusId = "106226789128312528511";
    Person second = new Person();
    second.googlePlusId = "106226789128312528511";
    // Then
    expect(first == second);
  }
  
  _differentGooglePlusId_NotEquals(){
    // Given
    var first = new Person();
    first.googlePlusId = "115049522200141162219";
    var second = new Person();
    first.googlePlusId = "106226789128312528511";
    // Then
    expect(first != second);
  }  
  
  _equalsToItself(){
    // Given
    var person = new Person();
    person.googlePlusId = "106226789128312528511";
    // Then
    expect(person == person);
  }  
  
  runTest(){
    test('Same googlePlusId means same person', () => _sameGooglePlusId_equals());
    test('Different googlePlusId means same different person', () => _differentGooglePlusId_NotEquals());
    test('A person is equals to itself', () => _equalsToItself());
  }
  
  String description(){
    return "Person Test";
  }
  
}
