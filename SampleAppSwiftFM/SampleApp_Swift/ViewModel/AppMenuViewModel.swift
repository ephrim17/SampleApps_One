//
//  menuModel.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

protocol AppMenuViewModelDelegate {
	func didReceiveAllMenus(_ menus: [Menu])
}

class AppMenuViewModel {

	var delegate : AppMenuViewModelDelegate?
	var eventHandler: ((_ meuns: [Menu]) -> Void)?


	private(set) var menus : [Menu]? {
		didSet {
			if let menus = self.menus {
				self.delegate?.didReceiveAllMenus(menus)
				guard let eventHandler = self.eventHandler else { return }
				eventHandler(menus)
			}
		}
	}

	func getAllMenus() {
		let menus = [
			Menu(pageName: "ArKit View", viewController: ArPickerViewController()),
			Menu(pageName: "Calendar View", viewController: CalendarViewController()),
			Menu(pageName: "DatePicker View", viewController: DatePickerViewController()),
			Menu(pageName: "AVPlayer View", viewController: MyAVPlayerViewController()),
			Menu(pageName: "Size Class View", viewController: SizeClassViewController()),
			Menu(pageName: "Quiz View", viewController: QuizViewController()),
			Menu(pageName: "File Mangager View", viewController: FileManagerViewController()),
			Menu(pageName: "Web View", viewController: WebViewController()),
			Menu(pageName: "Header Chevron View", viewController: HeaderChevronViewController()),
			Menu(pageName: "Toast View", viewController: ToastViewController()),
			Menu(pageName: "Share View", viewController: ShareViewController()),
			Menu(pageName: "Scroll View Container", viewController: ScrollViewContainerController()),
            Menu(pageName: "CLLocation Button", viewController: LocationButtonViewController()),
            Menu(pageName: "Footer View", viewController: FooterViewController())
		]
		self.menus = menus
	}
}

