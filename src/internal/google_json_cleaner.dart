
class _GoogleJsonCleaner {
  
  String clean(String text){
    var isInStringValue = false;
    var lastChar = '';
    var buffer = new StringBuffer();
    // Don't need  first chars )]}'\n\n[
    List<String> textChars = text.substring(6).splitChars();
    for(String currentChar in textChars){
      // Detect string value
      // TODO escape
      if(currentChar == '"'){
        isInStringValue = !isInStringValue;
      }
      // Skip whitespace but not in a string value
      if(!isInStringValue && currentChar == '\n' ){
        continue;
      }
      // Add empty value
      // TODO cas ',]‘
      if(!isInStringValue && currentChar == ',' && (lastChar == ',' || lastChar == '[')){
        buffer.add("null");
      }
      
      buffer.add(currentChar);
      
      lastChar = currentChar;
    }
    return buffer.toString();
  }
  
}
