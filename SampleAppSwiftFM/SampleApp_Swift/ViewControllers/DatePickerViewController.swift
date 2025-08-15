//
//  DatePickerViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

class DatePickerViewController: UIViewController {

	private lazy var datePickerView: DatePickerView = {
		let view = DatePickerView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
		self.title = "Date Picker"
		self.navigationController?.navigationBar.prefersLargeTitles = false
		datePickerView.loadViewSetup(datePickerView, parentView: self.view)
	}
}
