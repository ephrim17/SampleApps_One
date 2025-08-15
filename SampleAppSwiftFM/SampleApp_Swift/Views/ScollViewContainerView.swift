//
//  ScollViewContainerView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//

import UIKit

class ScollViewContainerView: UIView {

	private let scrollView: UIScrollView = {
		let view = UIScrollView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let scrollStackViewContainer: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	lazy var toolBarView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		return view
	}()


	lazy var filterButton: UIButton = {
		let button = UIButton()
		button.setTitle("Filter", for: .normal)
		button.setTitleColor(.cyan, for: .normal)
		button.backgroundColor = .systemPink
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	private let subView1: UIView = {
		let view = UIView()
		view.heightAnchor.constraint(equalToConstant: 200).isActive = true
		view.backgroundColor = UIColor.blue
		return view
	}()

	private let subview2: UIView = {
		let view = UIView()
		view.heightAnchor.constraint(equalToConstant: 300).isActive = true
		view.backgroundColor = UIColor.cyan
		return view
	}()

	private let subview3: UIView = {
		let view = UIView()
		view.heightAnchor.constraint(equalToConstant: 400).isActive = true
		view.backgroundColor = UIColor.red
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
        setupFilterView()
		setupScrollView()
	}

	private func setupScrollView() {
		let margins = self.layoutMarginsGuide
		self.addSubview(scrollView)
		scrollView.addSubview(scrollStackViewContainer)

		scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: toolBarView.bottomAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

		scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		configureContainerView()
	}

	private func configureContainerView() {
		scrollStackViewContainer.addArrangedSubview(subView1)
		scrollStackViewContainer.addArrangedSubview(subview2)
		scrollStackViewContainer.addArrangedSubview(subview3)
	}

	func setupFilterView() {
		self.addSubview(toolBarView)
		toolBarView.addSubview(self.filterButton)

		//toolBarConstraints
		NSLayoutConstraint.activate([
			toolBarView.topAnchor.constraint(equalTo: self.topAnchor),
			toolBarView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			toolBarView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			toolBarView.heightAnchor.constraint(equalToConstant: 40),

			//fiterButton Constraints
			filterButton.leadingAnchor.constraint(equalTo: toolBarView.leadingAnchor),
			filterButton.topAnchor.constraint(equalTo: toolBarView.topAnchor),
			filterButton.centerYAnchor.constraint(equalTo: toolBarView.centerYAnchor),
			filterButton.widthAnchor.constraint(equalToConstant: 100),
			filterButton.heightAnchor.constraint(equalToConstant: 40)

		])
	}
}
