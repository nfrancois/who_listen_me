/**
 * A response from CirclesApi.
 * Contains a list of visible circlers and a total circlers number
 */
class CirclesResponse {
  
  int totalCirclers;
  List<Circler> visiblesCirclers;
  
  CirclesResponse(this.totalCirclers, this.visiblesCirclers);
 
}
