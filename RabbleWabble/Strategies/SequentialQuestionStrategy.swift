//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Luu Van on 8/25/23.
//

public class SequentialQuestionStrategy: BaseQuestionStrategy {

  public convenience init(
	questionGroupCaretaker: QuestionGroupCaretaker) {
	let questionGroup =
	  questionGroupCaretaker.selectedQuestionGroup!
	let questions = questionGroup.questions
	self.init(questionGroupCaretaker: questionGroupCaretaker,
			  questions: questions)
  }
}
