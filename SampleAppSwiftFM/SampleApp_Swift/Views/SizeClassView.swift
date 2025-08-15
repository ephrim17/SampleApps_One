//
//  SizeClassView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 24/01/25.
//

import UIKit

class SizeClassView : UIView {

	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []
	private var sharedConstraints: [NSLayoutConstraint] = []

	private lazy var viewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .systemPink
		return view
	}()

	private lazy var viewContainer2: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .systemTeal
		return view
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
		self.addSubview(viewContainer)
		self.addSubview(viewContainer2)
		setupConstraints()
	}

	func setConstraints() {
		if traitCollection.horizontalSizeClass == .regular {
			NSLayoutConstraint.activate(regularConstraints)
		} else if traitCollection.horizontalSizeClass == .compact {
			NSLayoutConstraint.activate(compactConstraints)
		}
	}

	func updateViewConstraints(_ sizeClass: UIUserInterfaceSizeClass){
		if (sizeClass == .compact) {
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		} else {
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	func setupConstraints() {
		regularConstraints.append(contentsOf: [
			viewContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
			viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
			viewContainer.widthAnchor.constraint(equalToConstant: 100),
			viewContainer.heightAnchor.constraint(equalToConstant: 100),

			viewContainer2.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
			viewContainer2.leadingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 15),
			viewContainer2.widthAnchor.constraint(equalToConstant: 100),
			viewContainer2.heightAnchor.constraint(equalToConstant: 100),

		])

		compactConstraints.append(contentsOf: [
			viewContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
			viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
			viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			viewContainer.heightAnchor.constraint(equalToConstant: 250),

			viewContainer2.topAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: 15),
			viewContainer2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
			viewContainer2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			viewContainer2.heightAnchor.constraint(equalToConstant: 250)
		])
	}
}
