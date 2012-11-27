part of who_listen_me;

/**
 * Clean the steam to be jsonable
 */
class _GoogleJsonCleaner {

  static final List<int> NULL_VALUE = const [110, 117, 108, 108];
  static final int COMMA = 44;
  static final int OPEN_BRACE = 91;
  static final int CLOSE_BRACE = 93;
  static final int NEW_LINE = 10;
  static final int SPACE = 32;
  static final int ESCAPE = 92;
  static final int QUOTE = 34;

  String clean(List<int> bytes){
    var isInStringValue = false;
    var isInEscape = false;
    var lastChar = 0;
    var buffer = new List<int>();
    // Don't need  first chars )]}'\n\n
    bytes.forEach((currentChar) {
      // Detect value in quote
      if(currentChar == ESCAPE){
        isInEscape = !isInEscape;
      }
      if(!isInEscape && currentChar == QUOTE){
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
        if(lastChar == ESCAPE){
          isInEscape = false;
        }
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
