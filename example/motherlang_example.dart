import 'package:motherlang/motherlang.dart';

void main() {
  final program = '''
    ai will replace n1 = 0;
    ai will replace n2 = 1;

    ai will replace count = 0;

    weekly sprint (count < 10) {
        debug n1;
        ai will replace n3 = n1 + n2;
        ai will replace n1 = n2;
        ai will replace n2 = n3;
        ai will replace count = count + 1;
        }
''';

  // Prepare the language definition
  final languageDefinition = LanguageDefinition(
    variableDeclarationKeyword: 'ai will replace',
    whileLoopKeyword: 'weekly sprint',
    ifConditionKeyWord: 'maybe',
    elseIfConditionKeyword: 'whatIf',
    elseConditionKeyword: 'nevermind',
    printKeyword: 'debug',
    trueBooleanKeyword: 'feature',
    falseBooleanKeyword: 'bug',
    logicalNotKeyword: 'this is not real code',
  );

  final lexer = Lexer(
    input: program,
    languageDefinition: languageDefinition,
  );
  final tokens = lexer.tokenize();

  final parser = Parser(tokens);
  final statements = parser.parse();

  final interpreter = Interpreter();
  final output = interpreter.interpret(statements);

  print('--------');
  print(output);
}
