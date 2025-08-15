//
//  HeaderChevronViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

class HeaderChevronViewController: UIViewController {
	
	lazy var headerChevronView: HeaderChevronView = {
		let view = HeaderChevronView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		headerChevronView.loadViewSetup(headerChevronView, parentView: self.view)
	}
}
