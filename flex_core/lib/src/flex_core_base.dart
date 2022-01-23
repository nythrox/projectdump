void main() {
  final lexer = Lexer("""
  
  var smh = 0;
  if (true) {
    kms();
  
  }
  k          
  """);
  final tokens = [];
  while (!lexer.isDone) {
//     print(lexer.position);
//     print(lexer.currentChar);
    tokens.add(lexer.getNextToken());
  }
  print(tokens);
}

class Token {
  final int startAt;
  final int endAt;
  final String type;
  final String literal;
  const Token(this.literal, this.type, this.startAt, this.endAt);
  static const ILLEGAL = 'ILLEGAL',
      EOF = 'EOF',

// Identifiers + literals
      IDENTIFIER = 'IDENTIFIER', // add, foobar, x, y, ...
      INT = 'INT', // 1343456
      STRING = 'STRING',

// Operators
      ASSIGN = '=',
      PLUS = '+',
  
      MINUS = '-',
      BANG = '!',
      ASTERISK = '*',
      SLASH = '/',
      LT = '<',
      GT = '>',
      EQ = '==',
      NOT_EQ = '!=',

// Delimiters
      COMMA = ',',
      SEMICOLON = ';',
      LPAREN = '(',
      RPAREN = ')',
      LBRACE = '{',
      RBRACE = '}',
      LBRACKET = '[',
      RBRACKET = ']',
      COLON = ':',

// Keywords
      GET = "GET",
      VAR = "VAR",
      FINAL = "FINAL",
      TRUE = 'TRUE',
      FALSE = 'FALSE',
      IF = 'IF',
      ELSE = 'ELSE',
      RETURN = 'RETURN';

  static const Map<String, String> keywords = {
    'get': Token.GET,
    'var': Token.VAR,
    'final': Token.FINAL,
    'true': Token.TRUE,
    'false': Token.FALSE,
    'if': Token.IF,
    'else': Token.ELSE,
    'return': Token.RETURN
  };
  toString() {
    return "$literal $startAt-$endAt $type";
  }
}

class Lexer {
  final String input;
  String currentChar;
  int position = 0;
  //always go one more round for null EOF
  get isDone => position - 1 >= input.length;

  Lexer(this.input) {
    //read the first char
    currentChar = input[position];
  }

  void nextChar() {
    final nextPos = position + 1;
    if (nextPos >= input.length) {
      currentChar = null;
    } else {
//     if (nextPos >= input.length) {
// //       currentChar = null;
//     } else {
      currentChar = input[nextPos];
//     }
    }
    position = nextPos;
  }

  //gets the current token then advances to the next char
  Token getNextToken() {
    Token token;
    skipWhitespace();
    if (isDone) {
      token = Token(currentChar, Token.EOF, position, position);
      return token;
    }
    switch (currentChar) {
      case '=':
        token = Token(Token.ASSIGN, currentChar, position, position);
        break;
      case ';':
        token = Token(Token.SEMICOLON, currentChar, position, position);
        break;
      case '(':
        token = Token(Token.LPAREN, currentChar, position, position);
        break;
      case ')':
        token = Token(Token.RPAREN, currentChar, position, position);
        break;
      case ',':
        token = Token(Token.COMMA, currentChar, position, position);
        break;
      case '+':
        token = Token(Token.PLUS, currentChar, position, position);
        break;
      case '-':
        token = Token(Token.MINUS, currentChar, position, position);
        break;
      case '!':
        {
          token = Token(Token.BANG, currentChar, position, position);
        }
        break;
      case '/':
        token = Token(Token.SLASH, currentChar, position, position);
        break;
      case '*':
        token = Token(Token.ASTERISK, currentChar, position, position);
        break;
      case '<':
        token = Token(Token.LT, currentChar, position, position);
        break;
      case '>':
        token = Token(Token.GT, currentChar, position, position);
        break;
      case '{':
        token = Token(Token.LBRACE, currentChar, position, position);
        break;
      case '}':
        token = Token(Token.RBRACE, currentChar, position, position);
        break;
      case '"':
        token = Token(Token.STRING, currentChar, position, position);
        break;
      case '[':
        token = Token(Token.LBRACKET, currentChar, position, position);
        break;
      case ']':
        token = Token(Token.RBRACKET, currentChar, position, position);
        break;
      case ':':
        token = Token(Token.COLON, currentChar, position, position);
        break;
      default:
        {
          if (isLetter(currentChar)) {
            return readIdentifier();
          }
          if (isDigit(currentChar)) {
            return readNumber();
          }
          token = Token(currentChar, Token.ILLEGAL, position, position);
        }
        break;
    }
    nextChar();
    return token;
  }

  Token readIdentifier() {
    final startPos = position;
    while (isLetter(currentChar)) {
      nextChar();
    }
    final endPos = position;
    final literal = input.substring(startPos, endPos);
    return Token(
        literal, Token.keywords[literal] ?? Token.IDENTIFIER, startPos, endPos);
  }

  Token readNumber() {
    final startPos = position;
    while (isDigit(currentChar)) {
      nextChar();
    }
    final endPos = position;
    final literal = input.substring(startPos, endPos);
    return Token(
        literal, Token.keywords[literal] ?? Token.INT, startPos, endPos);
  }

  void skipWhitespace() {
    while (isWhitespace(currentChar)) {
      nextChar();
    }
  }
  
  String peekAhead(int lengthAhead) {
    return input.substring(position, position + lengthAhead);
  }
}


bool isWhitespace(String char) {
  if (char != null) {
    final exp = RegExp(r"\s");
    return exp.hasMatch(char);
  }
  return false;
}

bool isDigit(String char) {
  if (char != null) {
    final exp = RegExp(r'[0-9]');
    return exp.hasMatch(char);
  }
  return false;
}

bool isLetter(String char) {
  if (char != null) {
    final exp = RegExp(r'[a-zA-Z_$]');
    return exp.hasMatch(char);
  }
  return false;
}
