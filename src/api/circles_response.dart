/**
 * A response from CirclesApi.
 * Contains a list of visible circlers and a total circlers number
 */
class CirclesResponse {
  
  int totalCirclers;
  List<Circler> visiblesCirclers;
  
  CirclesResponse(this.totalCirclers, this.visiblesCirclers);
  
  
  bool operator==(other) {
    if (other == null) return false;
    if (other === this) return true;
    var sameTotalCircler = totalCirclers == other.totalCirclers;
    if(!sameTotalCircler) return false;
    if(visiblesCirclers.length != other.visiblesCirclers.length) return false;
    for(int i=0; i<visiblesCirclers.length; i++){
      if(visiblesCirclers[i] != other.visiblesCirclers[i]) return false;
    }
    return true;
  }
  
 int hashCode() {
    int result = 5;
    result = 3 * result + totalCirclers.hashCode();
    visiblesCirclers.forEach((circler) {
      result = 3 * result + circler.hashCode();
    });
    return result;
  } 
 
}
