//
//  QuizViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

class QuizViewController: UIViewController {

	private var viewModel = QuizViewModel()

	private lazy var quizView: QuizView = {
		let view = QuizView()
		//view.delegate = self
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		quizView.loadViewSetup(quizView, parentView: self.view)
		configureViewModel()
    }

	func configureViewModel(){
		//setting event handler to view model
		viewModel.eventHandler = updateViewWithModel
		viewModel.loadAnswers()
	}
}

extension QuizViewController {
	// called from view model through event handler
	func updateViewWithModel(event: QuizViewModel.Event) {
		switch event {
		case .error:
			self.Alert(Title: "Some Error occured", Message: "Try again")
		case .alert(id: let id):
			if let id = id {
				self.Alert(Title: "Please answer all the questions", Message: "Question \(id) is not answered")
			} else {
				self.Alert(Title: "Thank You", Message: "Response submitted successfully")
			}
		case .success:
			quizView.configureViewWithModel(model: self.viewModel)
		}
	}
}

protocol cellConfiguration: UITableViewCell {
	func configureCell(data: [Answers]?, delegate: AnyObject, indexPath: Int)
	var index  : Int { get set }
}
