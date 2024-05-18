// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguageDefinition {
  final String variableDeclarationKeyword;
  final String whileLoopKeyword;
  final String ifConditionKeyWord;
  final String elseIfConditionKeyword;
  final String elseConditionKeyword;
  final String printKeyword;
  final String trueBooleanKeyword;
  final String falseBooleanKeyword;
  final String logicalNotKeyword;

  LanguageDefinition({
    required this.variableDeclarationKeyword,
    required this.whileLoopKeyword,
    required this.ifConditionKeyWord,
    required this.elseIfConditionKeyword,
    required this.elseConditionKeyword,
    required this.printKeyword,
    required this.trueBooleanKeyword,
    required this.falseBooleanKeyword,
    required this.logicalNotKeyword,
  });

  LanguageDefinition copyWith({
    String? variableDeclarationKeyword,
    String? whileLoopKeyword,
    String? ifConditionKeyWord,
    String? elseIfConditionKeyword,
    String? elseConditionKeyword,
    String? printKeyword,
    String? trueBooleanKeyword,
    String? falseBooleanKeyword,
    String? logicalNotKeyword,
  }) {
    return LanguageDefinition(
      variableDeclarationKeyword:
          variableDeclarationKeyword ?? this.variableDeclarationKeyword,
      whileLoopKeyword: whileLoopKeyword ?? this.whileLoopKeyword,
      ifConditionKeyWord: ifConditionKeyWord ?? this.ifConditionKeyWord,
      elseIfConditionKeyword:
          elseIfConditionKeyword ?? this.elseIfConditionKeyword,
      elseConditionKeyword: elseConditionKeyword ?? this.elseConditionKeyword,
      printKeyword: printKeyword ?? this.printKeyword,
      trueBooleanKeyword: trueBooleanKeyword ?? this.trueBooleanKeyword,
      falseBooleanKeyword: falseBooleanKeyword ?? this.falseBooleanKeyword,
      logicalNotKeyword: logicalNotKeyword ?? this.logicalNotKeyword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'variableDeclarationKeyword': variableDeclarationKeyword,
      'whileLoopKeyword': whileLoopKeyword,
      'ifConditionKeyWord': ifConditionKeyWord,
      'elseIfConditionKeyword': elseIfConditionKeyword,
      'elseConditionKeyword': elseConditionKeyword,
      'printKeyword': printKeyword,
      'trueBooleanKeyword': trueBooleanKeyword,
      'falseBooleanKeyword': falseBooleanKeyword,
      'logicalNotKeyword': logicalNotKeyword,
    };
  }

  factory LanguageDefinition.fromMap(Map<String, dynamic> map) {
    return LanguageDefinition(
      variableDeclarationKeyword: map['variableDeclarationKeyword'] as String,
      whileLoopKeyword: map['whileLoopKeyword'] as String,
      ifConditionKeyWord: map['ifConditionKeyWord'] as String,
      elseIfConditionKeyword: map['elseIfConditionKeyword'] as String,
      elseConditionKeyword: map['elseConditionKeyword'] as String,
      printKeyword: map['printKeyword'] as String,
      trueBooleanKeyword: map['trueBooleanKeyword'] as String,
      falseBooleanKeyword: map['falseBooleanKeyword'] as String,
      logicalNotKeyword: map['logicalNotKeyword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageDefinition.fromJson(String source) =>
      LanguageDefinition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LanguageDefinition(variableDeclarationKeyword: $variableDeclarationKeyword, whileLoopKeyword: $whileLoopKeyword, ifConditionKeyWord: $ifConditionKeyWord, elseIfConditionKeyword: $elseIfConditionKeyword, elseConditionKeyword: $elseConditionKeyword, printKeyword: $printKeyword, trueBooleanKeyword: $trueBooleanKeyword, falseBooleanKeyword: $falseBooleanKeyword, logicalNotKeyword: $logicalNotKeyword)';
  }

  @override
  bool operator ==(covariant LanguageDefinition other) {
    if (identical(this, other)) return true;

    return other.variableDeclarationKeyword == variableDeclarationKeyword &&
        other.whileLoopKeyword == whileLoopKeyword &&
        other.ifConditionKeyWord == ifConditionKeyWord &&
        other.elseIfConditionKeyword == elseIfConditionKeyword &&
        other.elseConditionKeyword == elseConditionKeyword &&
        other.printKeyword == printKeyword &&
        other.trueBooleanKeyword == trueBooleanKeyword &&
        other.falseBooleanKeyword == falseBooleanKeyword &&
        other.logicalNotKeyword == logicalNotKeyword;
  }

  @override
  int get hashCode {
    return variableDeclarationKeyword.hashCode ^
        whileLoopKeyword.hashCode ^
        ifConditionKeyWord.hashCode ^
        elseIfConditionKeyword.hashCode ^
        elseConditionKeyword.hashCode ^
        printKeyword.hashCode ^
        trueBooleanKeyword.hashCode ^
        falseBooleanKeyword.hashCode ^
        logicalNotKeyword.hashCode;
  }
}
