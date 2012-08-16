
class _GoogleJsonCleaner {
  
  static final String STARTING_BLOCK = ")]}'\n\n";
  static final List<int> NULL_VALUE = const [110, 117, 108, 108];
  static final int COMMA = 44;
  static final int OPEN_BRACE = 91;
  static final int CLOSE_BRACE = 93;
  static final int NEW_LINE = 10;
  static final int SPACE = 32;
  static final int ESCAPE = 92;
  static final int QUOTE = 34;
  
  String clean(String text){
    var isInStringValue = false;
    var lastChar = 0;
    var buffer = new List<int>();
    // Don't need  first chars )]}'\n\n
    var workingText = (text.startsWith(STARTING_BLOCK)) ? text.substring(STARTING_BLOCK.length) : text;
    // The chars must me read as raw char.
    workingText.charCodes().forEach((currentChar) {
      // Detect value in quote
      if(currentChar == QUOTE){
        isInStringValue = !isInStringValue;
      }
      if(!isInStringValue && currentChar != NEW_LINE && currentChar != SPACE){// Skip new line and space
        // Add empty value
        if(_betweenTwoComma(lastChar, currentChar) || _betweenCommaAndBrace(lastChar, currentChar) || _betweenBraceAndComma(lastChar, currentChar)){
          buffer.addAll(NULL_VALUE);
        }
        buffer.add(currentChar);
        
        lastChar = currentChar;
      } else if(isInStringValue) {
        buffer.add(currentChar);
        lastChar = currentChar;
      }
    });
    return new String.fromCharCodes(buffer);
  }
  
  bool _betweenTwoComma(first, second){
    return first == COMMA && second == COMMA;   
  }
  
  bool _betweenCommaAndBrace(int first, second){
    return first == COMMA && second == CLOSE_BRACE;    
  }
  
  bool _betweenBraceAndComma(first, second){
    return first == OPEN_BRACE && second == COMMA;
  }  
  
}
