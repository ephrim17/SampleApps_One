//
//  QuizViewModel.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

protocol QuizViewModelDelegate {
	func didReceiveAllQuestions()
}

class QuizViewModel {

	var delegate : QuizViewModelDelegate?
	var eventHandler: ((_ event: Event) -> Void)?

	var questionArray = [Question]()
	var answerArray = [Answers]()

	func loadAnswers() {
		//Load data into Answer array
		answerArray = JsonProvider.shared.readLocalFile()

		if !answerArray.isEmpty {
			//callBack to viewController
			self.delegate?.didReceiveAllQuestions()
			self.eventHandler?(.success)
		} else {
			self.eventHandler?(.error)
		}
	}

	func validateAnswers(answers: [Answers]) {
		for item in answers {
			print("Question id: \(String(describing: item.id)) | Anwser: \(item.answer)")
			guard item.answerCompleted != false else {
				self.eventHandler?(.alert(id: item.id))
				return
			}
		}
		self.eventHandler?(.alert(id: nil))
		print("Response Submitted Successfully")
	}

	func updateViewModelWithSelectedAnswer(row: Int, answer: selectedAnswer, model: QuizViewModel) {
		switch answer {
		case .Yes, .No:
			model.answerArray[row].answer = answer
			model.answerArray[row].answerCompleted = true
			break
		case .FieldAnswer(let ans):
			model.answerArray[row].answer = answer
			model.answerArray[row].answerCompleted = true
			guard ans.count != 0 || ans != "" else {
				model.answerArray[row].answerCompleted = false
				break
			}
		}
	}
}


extension QuizViewModel {
	enum Event {
		case error
		case alert(id: String?)
		case success
	}
}
