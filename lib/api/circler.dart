/**
 * Objet for Cicler.
 */ 
class Circler extends Hashable {
  
  String googlePlusId;
  String name;
  String photo;
  String location;
  String description;
  String profession;
  
  Circler(this.googlePlusId);
  
  bool operator==(other) {
    if (other == null) return false;
    if (other === this) return true;
    return (other.googlePlusId == googlePlusId);
  }
  
 int hashCode() {
    int result = 17;
    result = 37 * result + googlePlusId.hashCode();
    return result;
  }  
  
}
