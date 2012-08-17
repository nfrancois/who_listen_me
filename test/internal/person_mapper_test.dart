
class PersonMapperTest {
  
  _PersonMapper _personMapper;
  
  _map_just_a_person(){
    // Given
    var textFragment = '[[null,null,"106226789128312528511"],[],["Nicolas Francois",null,null,null,"4c737c00a4dc7","FIRfFnobHkFlHHS09oBrHk","BJZbFHh2Cog3FIRfFnobHk",null,"//lh5.googleusercontent.com/-e1ZHEykzSRg/AAAAAAAAAAI/AAAAAAAAAFM/VoiADOd6Xww/photo.jpg",null,1,"Puteaux",null,"Sfeir","Developpeur Java",0,null,[],null,null,0,"Developpeur Java/Dart",[],null,null,[],[],null,4,null,null,[]]]';
    var jsonFragment = JSON.parse(textFragment);
    // When
    var person = _personMapper._mapPerson(jsonFragment);    
    // Then
    expect(person, isNotNull);
    expect(person.googlePlusId, equals("106226789128312528511"));
    expect(person.name, equals("Nicolas Francois"));
    expect(person.photo, equals("http://lh5.googleusercontent.com/-e1ZHEykzSRg/AAAAAAAAAAI/AAAAAAAAAFM/VoiADOd6Xww/photo.jpg"));
    expect(person.location, equals("Puteaux"));
    expect(person.profession, equals("Developpeur Java"));
    expect(person.description, equals("Developpeur Java/Dart"));
  }
  
  _map_just_a_person_without_photo(){
    // Given
    var textFragment = '[[null,null,"106226789128312528511"],[],["Nicolas Francois",null,null,null,"4c737c00a4dc7","FIRfFnobHkFlHHS09oBrHk","BJZbFHh2Cog3FIRfFnobHk",null,"http://default/photo.jpg",null,1,"Puteaux",null,"Sfeir","Developpeur Java",0,null,[],null,null,0,"Developpeur Java/Dart",[],null,null,[],[],null,4,null,null,[]]]';
    var jsonFragment = JSON.parse(textFragment);
    // When
    var person = _personMapper._mapPerson(jsonFragment);    
    // Then
    expect(person, isNotNull);
    expect(person.googlePlusId, equals("106226789128312528511"));
    expect(person.name, equals("Nicolas Francois"));
    expect(person.photo, equals("http://default/photo.jpg"));
    expect(person.location, equals("Puteaux"));
    expect(person.profession, equals("Developpeur Java"));
    expect(person.description, equals("Developpeur Java/Dart"));
  } 
  
  // TODO test with default photo
  
  _mapFromIncomingFile(){
    // Given
    var incoming = (new File("test/resources/incoming_clean.txt")).readAsTextSync();
    // When
    var persons = _personMapper.map(incoming);
    // Then
    expect(persons, isNotNull);
    expect(persons.length, equals(2));
    expect(persons[0].googlePlusId, equals("115049522200141162219"));
    expect(persons[1].googlePlusId, equals("106226789128312528511"));
    
  }
  
  runTest(){
    setUp(() => _personMapper = new _PersonMapper());
    test('just a person mapping with a json fragment', () => _map_just_a_person());
    test('just a person without photo mapping with a json fragment', () => _map_just_a_person_without_photo());
    test('complete mapping', () => _mapFromIncomingFile());    
  }
  
  String description(){
    return 'Person Mapper test';
  }  
  
}
