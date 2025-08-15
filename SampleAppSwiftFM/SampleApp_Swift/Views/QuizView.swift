//
//  QuizView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit


class QuizView: UIView {

	private var model = QuizViewModel()

	lazy var tableView : UITableView = {
		var table = UITableView(frame: .zero)
		table.translatesAutoresizingMaskIntoConstraints = false
		return table
	}()

	lazy var submitButton: UIButton = {
		var myButton = UIButton()
		myButton.layer.cornerRadius = 5
		myButton.backgroundColor = .systemBlue
		myButton.tintColor = UIColor.white
		myButton.setTitle("SUBMIT", for: .normal)
		myButton.translatesAutoresizingMaskIntoConstraints = false
		myButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
		return myButton
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	private func setupUI() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
		tableView.dataSource = self
		tableView.delegate = self
		self.addSubview(tableView)
		self.addSubview(submitButton)

		//without Xibs
		tableView.register(CustomFieldCell.self, forCellReuseIdentifier: CustomFieldCell.identifier)
		tableView.register(CustomSwitchCell.self, forCellReuseIdentifier: CustomSwitchCell.identifier)

		//Constraints
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: self.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: 10),

			submitButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10 ),
			submitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
			submitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
			submitButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	func configureViewWithModel(model: QuizViewModel) {
		self.model = model
		self.tableView.reloadData()
	}

	@objc func submitAction() {
		model.validateAnswers(answers: self.model.answerArray)
	}
}

extension QuizView: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.model.answerArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier = self.model.answerArray[indexPath.row].fieldType == "text" ? CustomFieldCell.identifier : CustomSwitchCell.identifier
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! cellConfiguration
		cell.index = indexPath.row
		cell.configureCell(data: self.model.answerArray, delegate: self, indexPath: indexPath.row)
		cell.selectionStyle = .none
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		var cellHeight:CGFloat = CGFloat()
		cellHeight = 100
		return cellHeight
	}
}

extension QuizView: switchActionDelegate {
	func switchAction(row: Int, answer: selectedAnswer) {
		self.model.updateViewModelWithSelectedAnswer(row: row, answer: answer, model: self.model)
	}
}

extension QuizView: textActionDelegate {
	func textAction(row: Int, answer: selectedAnswer) {
		self.model.updateViewModelWithSelectedAnswer(row: row, answer: answer, model: self.model)
	}
}
