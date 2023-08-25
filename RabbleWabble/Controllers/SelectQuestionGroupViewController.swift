//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Luu Van on 8/25/23.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet internal var tableView: UITableView! {
	didSet {
	  tableView.tableFooterView = UIView()
	}
  }

  // MARK: - Properties
	private let appSettings = AppSettings.shared

	private let questionGroupCaretaker = QuestionGroupCaretaker()
	private var questionGroups: [QuestionGroup] {
	  return questionGroupCaretaker.questionGroups
	}

	private var selectedQuestionGroup: QuestionGroup! {
	  get { return questionGroupCaretaker.selectedQuestionGroup }
	  set { questionGroupCaretaker.selectedQuestionGroup = newValue }
	}

}

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView,
						numberOfRowsInSection section: Int)
						-> Int {
	return questionGroups.count
  }

	public func tableView(_ tableView: UITableView,
						  cellForRowAt indexPath: IndexPath)
						  -> UITableViewCell {
	  let cell = tableView.dequeueReusableCell(
		withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
	  let questionGroup = questionGroups[indexPath.row]
	  cell.titleLabel.text = questionGroup.title
	  return cell
	}

}

// MARK: - UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {

  // 1
  public func tableView(_ tableView: UITableView,
						willSelectRowAt indexPath: IndexPath)
						-> IndexPath? {
	selectedQuestionGroup = questionGroups[indexPath.row]
	return indexPath
  }

  // 2
  public func tableView(_ tableView: UITableView,
						didSelectRowAt indexPath: IndexPath) {
	tableView.deselectRow(at: indexPath, animated: true)
  }

  // 3
  public override func prepare(for segue: UIStoryboardSegue,
							   sender: Any?) {
	guard let viewController = segue.destination
	  as? QuestionViewController else { return }
	  viewController.questionStrategy =
		appSettings.questionStrategy(for: questionGroupCaretaker)

	  viewController.delegate = self
  }
}

// MARK: - QuestionViewControllerDelegate
extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {

  public func questionViewController(
	_ viewController: QuestionViewController,
	didCancel questionGroup: QuestionStrategy) {
	navigationController?.popToViewController(self,
	  animated: true)
  }

  public func questionViewController(
	_ viewController: QuestionViewController,
	didComplete questionGroup: QuestionStrategy) {
	navigationController?.popToViewController(self,
	  animated: true)
  }
}





