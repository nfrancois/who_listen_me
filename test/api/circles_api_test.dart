/**
 * Test for CirclesApi.
 */
// TODO
class CirclesApiTest {

  //CirclesApi _circlesApi;


  _onResponseOk(){
    // Given
    //var incomingFile = new File("test/resources/incoming_clean.txt");
    //var httpResponse = new HttpResponseMock(200, incomingFile);
    // When
    //_circlesApi._responseHandler(httpResponse, (CirclesResponse response) {
      //expect(response.totalPersons, 3);
    //});
  }

  // TODO response ko;

  runTest(){
    //setUp(() => _circlesApi = new CirclesApi("106226789128312528511"));
    test('response ok', () => _onResponseOk());
  }

  String description(){
    return "Circles api test";
  }

}

class HttpResponseMock {

  int statusCode;
  InputStream inputStream;
  var onError;

  HttpResponseMock(this.statusCode, File file){
    var input = file.readAsTextSync();
    var inputStream = new ListInputStream();
    inputStream.write(input.charCodes);
  }


}