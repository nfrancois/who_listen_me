/**
 * Test for Person.
 */ 
class PersonTest {
  
  final Person _first;
  final Person _second;
  final Person _another;
  
  PersonTest() : _first = new Person("115049522200141162219"), _second = new Person("106226789128312528511"), _another = new Person("115049522200141162219");
  
  _not_equals_to_null(){
    // Then
    expect(_first != null);
  }
  
  _sameGooglePlusId_equals(){
    // Then
    expect(_first == _another);
  }
  
  _sameGooglePlusId_sameHasCode(){
    // Then
    expect(_first.hashCode() == _another.hashCode());
  }  
  
  _differentGooglePlusId_NotEquals(){
    // Then
    expect(_first != _second);
  }  
  
  _differentGooglePlusId_Not_sameHasCode(){
    // Then
    expect(_first.hashCode() != _second.hashCode());
  }   
  
  _equalsToItself(){
    // Then
    expect(_first == _first);
  }  
  
  runTest(){
    test('a person is not equal to null', () => _not_equals_to_null());
    test('Same googlePlusId means same person', () => _sameGooglePlusId_equals());
    test('Different googlePlusId means same different person', () => _differentGooglePlusId_NotEquals());
    test('A person is equals to itself', () => _equalsToItself());
    test('Same google plus id means same hasCode', () => _sameGooglePlusId_sameHasCode());
    test('Different googlePlusId means different hasCode', () => _differentGooglePlusId_Not_sameHasCode());
  }
  
  String description(){
    return "Person Test";
  }
  
}
