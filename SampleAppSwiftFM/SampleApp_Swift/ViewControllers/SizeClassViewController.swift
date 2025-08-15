//
//  SizeClassViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 24/01/25.
//

import UIKit

class SizeClassViewController: UIViewController {

	private lazy var sizeClassView: SizeClassView = {
		let view = SizeClassView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		return view
	}()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Size Class"
		self.navigationController?.navigationBar.prefersLargeTitles = false
        sizeClassView.loadWithScrollView(scrollView: scrollView, childView: sizeClassView, parentView: self.view)
		layoutTrait(traitCollection: UIScreen.main.traitCollection)
	}


	func layoutTrait(traitCollection:UITraitCollection) {
		if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
			print("<<< C")
			sizeClassView.updateViewConstraints(.compact)
			// activating compact constraints
		} else {
			print("<<< R")
			sizeClassView.updateViewConstraints(.regular)
			// activating regular constraints
		}
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		layoutTrait(traitCollection: traitCollection)
	}


}


