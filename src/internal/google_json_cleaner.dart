
class _GoogleJsonCleaner {
  
  static final String STARTING_BLOCK = ")]}'\n\n";
  static final String NULL_VALUE = 'null';
  static final String COMMA = ',';
  static final String OPEN_BRACE = '[';
  static final String CLOSE_BRACE = ']';
  static final String NEW_LINE = '\n';
  static final String SPACE = ' ';
  static final String ESCAPE = '\\';
  static final String QUOTE = '"';
  
  String clean(String text){
    var isInStringValue = false;
    var lastChar = '';
    var buffer = new StringBuffer();
    // Don't need  first chars )]}'\n\n
    var workingTest = (text.startsWith(STARTING_BLOCK)) ? text.substring(STARTING_BLOCK.length) : text;
    workingTest.splitChars().forEach((currentChar) {
      if(currentChar != NEW_LINE){// Skip new line
        // Detect string value
        // TODO escape
        //if(currentChar == QUOTE){
        //  isInStringValue = !isInStringValue;
        //}
        // Add empty value
        if(_betweenTwoComma(lastChar, currentChar) || _betweenCommaAndBrace(lastChar, currentChar) || _betweenBraceAndComma(lastChar, currentChar)){
          buffer.add(NULL_VALUE);
        }
        
        buffer.add(currentChar);
        
        lastChar = currentChar;
      }
    });
    return buffer.toString();
  }
  
  bool _betweenTwoComma(String firstChar, String secondChar){
    return firstChar == COMMA && secondChar == COMMA;   
  }
  
  bool _betweenCommaAndBrace(String firstChar, String secondChar){
    return firstChar == COMMA && secondChar == CLOSE_BRACE;    
  }
  
  bool _betweenBraceAndComma(String firstChar, String secondChar){
    return firstChar == OPEN_BRACE && secondChar == COMMA;
  }  
  
}
