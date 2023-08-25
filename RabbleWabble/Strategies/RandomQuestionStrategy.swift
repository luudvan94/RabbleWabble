//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Luu Van on 8/25/23.
//

// 1
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {

  public convenience init(
	questionGroupCaretaker: QuestionGroupCaretaker) {
	let questionGroup =
	  questionGroupCaretaker.selectedQuestionGroup!
	let randomSource = GKRandomSource.sharedRandom()
	let questions = randomSource.arrayByShufflingObjects(
	  in: questionGroup.questions) as! [Question]
	self.init(questionGroupCaretaker: questionGroupCaretaker,
			  questions: questions)
  }
}


