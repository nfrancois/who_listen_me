/**
 * Test of FollowersMapper
 */ 
class FollowersMapperTest {
  
  UsersMapper _mapper;
  
  _complete_response(){
    // Given
    var users = (new File("test/resources/users.json")).readAsTextSync();
    // When
    var result = _mapper.map(users);
    // Then
    expect(result, isNotNull);
    expect(result.id, equals(51171270));
    expect(result.nickname, equals("nicofrancois"));
    expect(result.name, equals("Nicolas François"));
    expect(result.totalFollowers, equals(264));
  }
  
  runTest(){
    setUp(() => _mapper = new UsersMapper());
    test('complete response', () => _complete_response());
  }
  
  
  String description(){
    return "Followers Mapper test";
  }
  
}
