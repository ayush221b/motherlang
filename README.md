# 🌟 motherlang 🌟

Welcome to `motherlang`, a whimsical programming language interpreter that empowers you to craft and execute programs with your own unique syntax and keywords. Dive into the world of custom languages and watch your code come alive with `motherlang`'s lexer, parser, and interpreter.

## ✨ Features

- **Custom Keywords**: Define your own keywords for variable declarations, loops, conditions, and more.
- **Lexical Analysis**: Transform your code into tokens using the lexer.
- **Parsing Magic**: Convert tokens into a syntax tree with the parser.
- **Interpretation Wizardry**: Execute your custom language programs and see the results.

## 🚀 Installation

Add `motherlang` to your `pubspec.yaml`:

```yaml
dependencies:
  motherlang: 0.0.1
```

Then fetch the package:

```bash
dart pub get
```

## 🎓 Usage

Let's explore how to use `motherlang` to define a custom language and calculate the first 10 numbers of the Fibonacci sequence. 

```dart
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
```

### 🔍 Explanation

1. **Language Definition**: Use the `LanguageDefinition` class to set your custom keywords for various programming constructs.
2. **Lexical Analysis**: Create a `Lexer` object with your program and language definition to convert the input into tokens.
3. **Parsing**: Employ the `Parser` class to transform tokens into a syntax tree.
4. **Interpretation**: Run the statements using the `Interpreter` class and enjoy the output.

## 🎨 Example Program

The example above illustrates:
- Declaring variables with the whimsical keyword `ai will replace`.
- Using a `weekly sprint` loop to iterate while a condition is true.
- Printing output with the `debug` keyword.

## 📜 License

This project is licensed under the MIT License. Check out the [LICENSE](LICENSE) file for details.

## 🤝 Contributions

We welcome contributions! Feel free to open an issue or submit a pull request on GitHub.

---

Bring your creativity to life with `motherlang` and create your own languages! Happy coding! ✨✨✨