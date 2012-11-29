part of who_listen_me_test;

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
    expect(_first, isNotNull);
  }

  _are_equals(){
    // Then
    expect(_first, equals(_another));
  }

  _sameHasCode(){
    // Then
    expect(_first.hashCode, equals(_another.hashCode));
  }

  _notEquals(){
    // Then
    expect(_first, isNot(equals(_second)));// Different total number but same circlers
    expect(_second, isNot(equals(_third)));// Same total number but different circlers
    expect(_first, isNot(equals(_third)));// All is different
  }

  _not_sameHasCode(){
    // Then
    expect(_first.hashCode, isNot(equals(_second.hashCode)));
    expect(_second.hashCode, isNot(equals(_third.hashCode)));
    expect(_first.hashCode, isNot(equals(_third.hashCode)));
  }

  _equalsToItself(){
    // Then
    expect(_first, equals(_first));
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
