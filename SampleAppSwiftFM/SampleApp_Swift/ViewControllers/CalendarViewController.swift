//
//  CalendarViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

class CalendarViewController: UIViewController {

	private lazy var calendarView: CalendarView = {
		let view = CalendarView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
		self.title = "Calendar"
		self.navigationController?.navigationBar.prefersLargeTitles = false
		calendarView.loadViewSetup(calendarView, parentView: self.view)
	}
}
