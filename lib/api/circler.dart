/**
 * Objet for Cicler.
 */
class Circler {

  String googlePlusId;
  String name;
  String photo;
  String location;
  String description;
  String profession;

  Circler(this.googlePlusId);

  bool operator==(other) {
    if (other == null) return false;
    if (identical(other, this)) return true;
    return (other.googlePlusId == googlePlusId);
  }

 int get hashCode => 15 * googlePlusId.hashCode + 7;

}
