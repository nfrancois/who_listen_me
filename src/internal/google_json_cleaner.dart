
class _GoogleJsonCleaner {
  
  static final String STARTING_BLOCK = ")]}'\n\n";
  
  String clean(String text){
    var isInStringValue = false;
    var lastChar = null;
    var buffer = new StringBuffer();
    // Don't need  first chars )]}'\n\n
    var workingTest = (text.startsWith(STARTING_BLOCK)) ? text.substring(6) : text;
    List<String> textChars = workingTest.splitChars();
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
