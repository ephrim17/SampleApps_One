//
//  ScrollViewContainerController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//
import UIKit

class ScrollViewContainerController: UIViewController {

	// MARK: - Properties
	private let scollViewContainerView: ScollViewContainerView = {
		let view = ScollViewContainerView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "ScollViewContainerView"
		scollViewContainerView.loadViewSetup(scollViewContainerView, parentView: self.view)
		//updateNavigationBackground()
	}
}

extension ScrollViewContainerController {

	func updateNavigationBackground() {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.backgroundColor = UIColor.green // your colour here
		appearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
}
