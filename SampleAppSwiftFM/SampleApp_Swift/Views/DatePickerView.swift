//
//  DatePicker_view.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 22/01/25.
//

import UIKit

class DatePickerView: UIView {

	private var defaultLocale = Locale(identifier: "en-SA")

	private var selectedDate: String = ""

	private lazy var datePicker: UIDatePicker = {
		let view  = UIDatePicker()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.white
		view.locale = defaultLocale
		view.minimumDate =  Date.now
		//view.calendar = Calendar(identifier: .gregorian)
		view.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
		return view
	}()

	private var dateSelectedLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .label
		label.textAlignment = .center
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	func setupUI() {
		self.addSubview(datePicker)
		self.addSubview(dateSelectedLabel)

		NSLayoutConstraint.activate([

			datePicker.heightAnchor.constraint(equalToConstant: 30),
			datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			datePicker.centerYAnchor.constraint(equalTo: self.centerYAnchor),

			dateSelectedLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor),
			dateSelectedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			dateSelectedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			dateSelectedLabel.heightAnchor.constraint(equalToConstant: 30)
		])


	}

	@objc func datePickerValueChanged(_ sender: UIDatePicker){
		let dayFormatter: DateFormatter = DateFormatter()
		dayFormatter.locale =  defaultLocale
		dayFormatter.dateFormat = "E, "

		let dateFormatter1: DateFormatter = DateFormatter()
		dateFormatter1.locale =  defaultLocale
		dateFormatter1.dateFormat = "MMM d"

		let result = dayFormatter.string(from: sender.date) + dateFormatter1.string(from: sender.date)
		dateSelectedLabel.text = result
	}
}
