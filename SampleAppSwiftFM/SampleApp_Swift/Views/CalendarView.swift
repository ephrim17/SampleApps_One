//
//  Calendar_view.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 22/01/25.
//
import UIKit

protocol CalendarDelegate: AnyObject {
	func selectedDate(date: Date?)
}

class CalendarView: UIView {

	private var calendar: UICalendarView = {
		let calendar = UICalendarView()
		calendar.translatesAutoresizingMaskIntoConstraints = false
		let gregorianCalendar = Calendar(identifier: .gregorian)
		calendar.calendar = gregorianCalendar
		calendar.locale = Locale(identifier: "en-SA")
		calendar.fontDesign = .rounded
		let currentDate = Date()
		var component = DateComponents()
		let startDate = gregorianCalendar.startOfDay(for: currentDate)
		let endDate = gregorianCalendar.date(byAdding: component, to: startDate)
		component.day = 30
		component.second = -1
		let calendarRange = DateInterval.init(start: startDate, end: endDate!)
		calendar.availableDateRange = calendarRange
		return calendar
	}()

	private var dateSelectedLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .label
		label.text = ""
		return label
	}()

	weak var delegate: CalendarDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	func setupUI() {
		self.addSubview(calendar)
		self.addSubview(dateSelectedLabel)
		NSLayoutConstraint.activate([
			calendar.heightAnchor.constraint(equalToConstant: 300),
			calendar.widthAnchor.constraint(equalToConstant: 250),
			calendar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			calendar.centerYAnchor.constraint(equalTo: self.centerYAnchor),

			dateSelectedLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor),
			dateSelectedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			dateSelectedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			dateSelectedLabel.heightAnchor.constraint(equalToConstant: 30)
		])

		let dateSelection = UICalendarSelectionSingleDate(delegate: self)
		calendar.selectionBehavior = dateSelection
	}
}

extension CalendarView: UICalendarSelectionSingleDateDelegate {

	func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
		print(" dateSelection --> \(String(describing: dateComponents))")
		//handle selected date to
		//dateSelectedLabel.text =
	}

	func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
		return true
	}


}

