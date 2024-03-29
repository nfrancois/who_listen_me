part of who_listen_me;

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
    if (identical(other, this)) return true;
    var sameTotalCircler = totalCirclers == other.totalCirclers;
    if(!sameTotalCircler) return false;
    if(visiblesCirclers.length != other.visiblesCirclers.length) return false;
    for(int i=0; i<visiblesCirclers.length; i++){
      if(visiblesCirclers[i] != other.visiblesCirclers[i]) return false;
    }
    return true;
  }

 int get hashCode {
    int result = 5;
    result = 7 * result + totalCirclers.hashCode;
    visiblesCirclers.forEach((circler) {
      result = 7 * result + circler.hashCode;
    });
    return result;
  }

}
