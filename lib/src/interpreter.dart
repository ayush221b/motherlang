import 'package:motherlang/src/environment.dart';
import 'package:motherlang/src/lexer.dart';
import 'package:motherlang/src/nodes.dart';

class Interpreter implements Visitor<dynamic> {
  Environment environment = Environment();

  String consoleOutput = '';

  // This function will also return a string value
  // that has the console output
  String interpret(List<Stmt> statements) {
    try {
      for (final statement in statements) {
        _execute(statement);
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      consoleOutput += '${error.toString()} \n Stacktrace: \n $stacktrace';
    }
    return consoleOutput;
  }

  dynamic _execute(Stmt statement) {
    statement.accept(this);
  }

  // Handling Assignments
  @override
  dynamic visitAssignmentExpr(AssignmentNode stmt) {
    dynamic value = _evaluate(stmt.value);
    environment.assign(stmt.name, value);
    return value;
  }

  // Handling Expressions
  @override
  dynamic visitExpressionStmtExpr(ExpressionStmt stmt) {
    _evaluate(stmt.expression);
    return null; // Expression statements don't 'return' a value
  }

  // Handling print Statements
  @override
  dynamic visitDebugStmtExpr(DebugNode stmt) {
    dynamic value = _evaluate(stmt.value);
    print(stringify(value));
    consoleOutput += stringify(value);
    consoleOutput += '\n';
    return null;
  }

  // Handling Loop Statements
  @override
  dynamic visitLoopStmtExpr(LoopNode stmt) {
    while (_evaluate(stmt.condition)) {
      for (Stmt bodyStmt in stmt.body) {
        _execute(bodyStmt);
      }
    }
    return null;
  }

  // Visits a Conditional Statements Expression
  @override
  Object? visitConditionalStmtExpr(ConditionalNode stmt) {
    for (ConditionalBlock block in stmt.conditionalBlocks) {
      if (block.condition == null || _isTruthy(_evaluate(block.condition!))) {
        _executeBlock(block.thenBranch);
        return null; // Stop evaluating after a matching block is executed
      }
    }
    return null;
  }

  // Helper to recursively evaluate and execute an individual statement
  Object? _evaluateAndExecute(Stmt stmt) {
    final value = stmt.accept(this); // Evaluate
    if (value is Exception) throw value; // Handle potential exceptions
    return value;
  }

  // Helper to execute a block of statements
  void _executeBlock(List<Stmt> statements) {
    for (Stmt statement in statements) {
      _evaluateAndExecute(statement);
    }
  }

  // Handling Numbers
  @override
  dynamic visitNumberExpr(NumberNode expr) {
    return expr.value;
  }

  // Handling Strings
  @override
  dynamic visitStringExpr(StringNode expr) {
    return expr.value;
  }

  // Handling Booleans
  @override
  dynamic visitBooleanExpr(BooleanNode expr) {
    return expr.value;
  }

  // Handling Variables
  @override
  dynamic visitVariableExpr(VariableNode expr) {
    return environment.get(expr.name);
  }

  // Handling Unary Operations
  @override
  dynamic visitUnaryExpr(UnaryOpNode expr) {
    dynamic right = _evaluate(expr.operand);

    switch (expr.operator) {
      case TokenType.minus:
        return -right;
      case TokenType.logicalNot:
        return !_isTruthy(right);
      // Add cases for other unary operators if you support them
      default:
        return null; // Unreachable
    }
  }

  // Handling Binary Operations
  @override
  dynamic visitBinaryExpr(BinaryOpNode expr) {
    dynamic left = _evaluate(expr.left);
    dynamic right = _evaluate(expr.right);

    switch (expr.operator) {
      case TokenType.minus:
        return left - right;
      case TokenType.plus:
        return left + right;
      case TokenType.multiply:
        return left * right;
      case TokenType.divide:
        return left / right;
      case TokenType.modulo:
        return left % right;
      case TokenType.greaterThan:
        return left > right;
      case TokenType.greaterThanOrEqual:
        return left >= right;
      case TokenType.lessThan:
        return left < right;
      case TokenType.lessThanOrEqual:
        return left <= right;
      case TokenType.equals:
        return _isEqual(left, right);
      case TokenType.logicalOr:
        if (_isTruthy(left)) return left;
        if (_isTruthy(right)) return right;
        return false;
      case TokenType.logicalAnd:
        if (!_isTruthy(left)) return left;
        if (!_isTruthy(right)) return right;
        return true;
      // Add cases for other binary operators if you support them
      default:
        return null; // Unreachable
    }
  }

  // Helper Functions
  dynamic _evaluate(Expr expr) {
    return expr.accept(this);
  }

  String stringify(dynamic object) {
    if (object == null) return "null";
    if (object is double) {
      // Handle potential decimal places in a nicer way
      return object.toStringAsFixed(2);
    }
    return object.toString();
  }

  bool _isTruthy(dynamic object) {
    if (object == null) return false;
    if (object is bool) return object;
    return true;
  }

  bool _isEqual(dynamic a, dynamic b) {
    if (a == null && b == null) return true;
    if (a == null) return false;
    return a == b;
  }
}
