//
//  AppMenuViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

class AppMenuViewController: UIViewController {

	private var viewModel = AppMenuViewModel()

	private lazy var appMenuTableView: AppMenuTableView = {
		let view = AppMenuTableView()
		view.delegate = self
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .systemBackground
		self.title = "Swift UIKit"
		appMenuTableView.loadViewSetup(appMenuTableView, parentView: self.view)
		loadViewModelSetup()
	}

	func loadViewModelSetup(){

		// passing a delegate to connect view model
		viewModel.delegate = self

		//passing a binding closure to connect view model
		//viewModel.eventHandler = observe

		viewModel.getAllMenus()


	}

	func observe(menus: [Menu]) {
		appMenuTableView.updateUI(menus: menus)
	}
}

extension AppMenuViewController: AppMenuViewModelDelegate {
	func didReceiveAllMenus(_ menus: [Menu]) {
		let menus =  menus
		appMenuTableView.updateUI(menus: menus)
	}
}

extension AppMenuViewController: appMenuViewDelegate {
	func selectedMenu(menu: Menu) {
		let selectedMenuItem = menu
		self.navigationController?.pushViewController(selectedMenuItem.viewController, animated: true)
	}
}
