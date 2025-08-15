//
//  ToastView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//
import UIKit

protocol ToastDelegate: NSObject {
	func toastButtonAction()
}

class ToastView: UIView {

	weak var delgate: ToastDelegate? = nil

	lazy var submitButton: UIButton = {
		let button = UIButton()
		button.setTitle("Show Toast!", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
		return button
	}()

	@objc func pressed() {
		self.delgate?.toastButtonAction()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	func setupUI() {
		self.addSubview(submitButton)
		NSLayoutConstraint.activate([
			submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			submitButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			submitButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}
