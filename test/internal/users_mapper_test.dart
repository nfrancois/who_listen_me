/**
 * Test for CirclerMapper
 */
class CirclerMapperTest {

  _CirclerMapper _circlerMapper;

  _map_just_a_circler(){
    // Given
    var textFragment = '[[null,null,"106226789128312528511"],[],["Nicolas Francois",null,null,null,"4c737c00a4dc7","FIRfFnobHkFlHHS09oBrHk","BJZbFHh2Cog3FIRfFnobHk",null,"//lh5.googleusercontent.com/-e1ZHEykzSRg/AAAAAAAAAAI/AAAAAAAAAFM/VoiADOd6Xww/photo.jpg",null,1,"Puteaux",null,"Sfeir","Developpeur Java",0,null,[],null,null,0,"Developpeur Java/Dart",[],null,null,[],[],null,4,null,null,[]]]';
    var jsonFragment = JSON.parse(textFragment);
    // When
    var cicler = _circlerMapper._mapCircler(jsonFragment);
    // Then
    expect(cicler, isNotNull);
    expect(cicler.googlePlusId, equals("106226789128312528511"));
    expect(cicler.name, equals("Nicolas Francois"));
    expect(cicler.photo, equals("http://lh5.googleusercontent.com/-e1ZHEykzSRg/AAAAAAAAAAI/AAAAAAAAAFM/VoiADOd6Xww/photo.jpg"));
    expect(cicler.location, equals("Puteaux"));
    expect(cicler.profession, equals("Developpeur Java"));
    expect(cicler.description, equals("Developpeur Java/Dart"));
  }

  _map_just_a_person_without_photo(){
    // Given
    var textFragment = '[[null,null,"106226789128312528511"],[],["Nicolas Francois",null,null,null,"4c737c00a4dc7","FIRfFnobHkFlHHS09oBrHk","BJZbFHh2Cog3FIRfFnobHk",null,"http://default/photo.jpg",null,1,"Puteaux",null,"Sfeir","Developpeur Java",0,null,[],null,null,0,"Developpeur Java/Dart",[],null,null,[],[],null,4,null,null,[]]]';
    var jsonFragment = JSON.parse(textFragment);
    // When
    var cicler = _circlerMapper._mapCircler(jsonFragment);
    // Then
    expect(cicler, isNotNull);
    expect(cicler.googlePlusId, equals("106226789128312528511"));
    expect(cicler.name, equals("Nicolas Francois"));
    expect(cicler.photo, equals("http://default/photo.jpg"));
    expect(cicler.location, equals("Puteaux"));
    expect(cicler.profession, equals("Developpeur Java"));
    expect(cicler.description, equals("Developpeur Java/Dart"));
  }

  // TODO test with default photo

  _mapFromIncomingFile(){
    // Given
    var incoming = (new File("test/resources/incoming_clean.txt")).readAsTextSync();
    // When
    var response = _circlerMapper.map(incoming);
    // Then
    var circlers = response.visiblesCirclers;
    expect(response, isNotNull);
    expect(response.totalCirclers, equals(5));
    expect(circlers, isNotNull);
    expect(circlers.length, equals(2));
    expect(circlers[0].googlePlusId, equals("115049522200141162219"));
    expect(circlers[1].googlePlusId, equals("106226789128312528511"));

  }

  runTest(){
    setUp(() => _circlerMapper = new _CirclerMapper());
    test('just a circler mapping with a json fragment', () => _map_just_a_circler());
    test('just a circler without photo mapping with a json fragment', () => _map_just_a_person_without_photo());
    test('complete mapping', () => _mapFromIncomingFile());
  }

  String description(){
    return 'Circler Mapper test';
  }

}
