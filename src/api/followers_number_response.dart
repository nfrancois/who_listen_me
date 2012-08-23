/**
 * Response to a FollowersRequest.
 * Give total followers numbers of a user.
 */ 
class FollowersNumberResponse {
  
  String name;
  int id;
  int totalFollowers;
  
  FollowersNumberResponse(this.name, this.id, this.totalFollowers);

  bool operator==(other) {
    if (other == null) return false;
    if (other === this) return true;
    return (other.id == id &&  other.totalFollowers == totalFollowers);
  }
  
  int hashCode() {
    int result = 7;
    result = 5 * result + id.hashCode();
    result = 5 * result + totalFollowers.hashCode();
    return result;
  }
  
}
