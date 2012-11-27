part of who_listen_me;

/**
 * Map the clean json response to CircleResponse.
 */
class _CirclerMapper {

  static final String HTTP= "http:";

  CirclesResponse map(String jsonText){
    var jsonTab = JSON.parse(jsonText);
    var totalCirclers = jsonTab[0][4];
    var visiblesCirclers = _mapCirclers(jsonTab[0][2]);
    return new CirclesResponse(totalCirclers, visiblesCirclers);
  }


  Collection<Circler> _mapCirclers(jsonTab){
    return jsonTab.map((jsonFragment) => _mapCircler(jsonFragment));
  }

  Circler _mapCircler(jsonFragment){
    var circler = new Circler(jsonFragment[0][2]);
    var photo = jsonFragment[2][8];
    circler..name = jsonFragment[2][0]
           ..photo = ((photo.startsWith(HTTP)) ? photo : "$HTTP$photo")
           ..location = jsonFragment[2][11]
           ..profession = jsonFragment[2][14]
           ..description = jsonFragment[2][21];
    return circler;
  }

}