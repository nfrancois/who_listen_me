part of who_listen_me_test;

/**
 * Test for FollowersNumberResponse
 */
class FollowersNumberResponseTest {

  final FollowersNumberResponse _first;
  final FollowersNumberResponse _second;
  final FollowersNumberResponse _third;
  final FollowersNumberResponse _another;

  FollowersNumberResponseTest() : _first = new FollowersNumberResponse("Nicolas François", "nicofrancois", 51171270, 264), //
                                  _second = new FollowersNumberResponse("Guillaume Girou", "girouguillaume", 572619573, 36), //
                                  _third = new FollowersNumberResponse("Nicolas François","nicofrancois", 51171270, 265), //
                                  _another = new FollowersNumberResponse("Nicolas François","nicofrancois", 51171270, 264);

  _are_equals(){
    equals(_first == _another);
  }

  _not_the_same_person(){
    equals(_first != _second);
    equals(_third != _second);
  }

  _i_win_a_follower(){
    equals(_first != _third);
  }

  _equals_to_itself(){
    equals(_first != _first);
  }

  _same_hashcode(){
    equals(_first.hashCode == _another.hashCode);
  }

  _not_same_hashcode(){
    equals(_second.hashCode == _first.hashCode);
    equals(_third.hashCode == _first.hashCode);
    equals(_second.hashCode == _third.hashCode);
  }

  runTest(){
    test('are equals', () => _are_equals());
    test('not the same person', () => _not_the_same_person());
    test('i win a follower', () => _i_win_a_follower());
    test('equals to itself', () => _equals_to_itself());
    test('same hashcode', () => _same_hashcode());
    test('not same hascode', () => _not_same_hashcode());
  }

  String description(){
    return "FollowersNumberResponse Test";
  }

}
