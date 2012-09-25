/**
 * Test for CirclesReponse
 */
class CirclesResponseTest {

  final CirclesResponse _first;
  final CirclesResponse _second;
  final CirclesResponse _third;
  final CirclesResponse _another;

  CirclesResponseTest() : _first = new CirclesResponse(3, [new Circler("106226789128312528511"), new Circler("115049522200141162219")]), //
      _second = new CirclesResponse(4, [new Circler("106226789128312528511"), new Circler("115049522200141162219")]),//
      _third = new CirclesResponse(4, [new Circler("106226789128312528511"), new Circler("115049522200141162219"), new Circler("109253530406296308866")]),//
      _another = new CirclesResponse(3, [new Circler("106226789128312528511"), new Circler("115049522200141162219")]);

  _not_equals_to_null(){
    // Then
    expect(_first != null);
  }

  _are_equals(){
    // Then
    expect(_first == _another);
  }

  _sameHasCode(){
    // Then
    expect(_first.hashCode() == _another.hashCode());
  }

  _notEquals(){
    // Then
    expect(_first != _second);// Different total number but same circlers
    expect(_second != _third);// Same total number but different circlers
    expect(_first != _third);// All is different
  }

  _not_sameHasCode(){
    // Then
    expect(_first.hashCode() != _second.hashCode());
    expect(_second.hashCode != _third.hashCode());
    expect(_first.hashCode() != _third.hashCode());
  }

  _equalsToItself(){
    // Then
    expect(_first == _first);
  }

  runTest(){
    test('a CirclesResponse is not equal to null', () => _not_equals_to_null());
    test('different CirclesResponse but equals', () => _are_equals());
    test('different CirclesResponse not equals', () => _notEquals());
    test('a CirclesResponse is equals to itself', () => _equalsToItself());
    test('different CirclesResponse but same hascode', () => _sameHasCode());
    test('different CirclesResponse but not same hascode', () => _not_sameHasCode());
  }

  String description(){
    return "Circle Response Test";
  }

}
