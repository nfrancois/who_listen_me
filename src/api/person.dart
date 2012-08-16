/**
 * Objet for Person.
 */ 
class Person {
  
  //String _googleId;
  String _googlePlusId;
  String _name;
  String _photo;
  String _location;
  String _description;
  String _profession;
  
  String get googlePlusId() => _googlePlusId;
  set googlePlusId(googlePlusId) => _googlePlusId = googlePlusId;
  
  String get name() => _name;
  set name(name) => _name = name;
  
  String get photo() => _photo;
  set photo(photo) => _photo = photo;  
 
  String get location() => _location;
  set location(location) => _location = location;  
  
  String get description() => _description;
  set description(description) => _description = description;  
  
  String get profession() => _profession;
  set profession(profession) => _profession = profession;  
  
  bool operator==(other) {
    if (other == null) return false;
    if (other === this) return true;
    return (other._googlePlusId == _googlePlusId);
  }
  
 int hashCode() {
    int result = 17;
    result = 37 * result + _googlePlusId.hashCode();
    return result;
  }  
  
}
