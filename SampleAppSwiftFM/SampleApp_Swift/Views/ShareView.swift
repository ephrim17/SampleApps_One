//
//  ShareView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//

import UIKit

protocol ShareViewDelegate: NSObject {
	func shareButtonAction()
}

class ShareView: UIView {

	weak var delegate : ShareViewDelegate? = nil

	lazy var shareButton: UIButton = {
		let button = UIButton()
		button.setTitle("Share Me!", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(onSharing), for: .touchUpInside)
		return button
	}()

	lazy var shareImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "gift-sharesheet-logo")
		image.contentMode = .scaleAspectFit
		return image
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
		self.addSubview(shareButton)
		self.addSubview(shareImage)
		NSLayoutConstraint.activate([
			shareButton.heightAnchor.constraint(equalToConstant: 100),
			shareButton.widthAnchor.constraint(equalToConstant: 100),
			shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			shareButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

			shareImage.heightAnchor.constraint(equalToConstant: 100),
			shareImage.widthAnchor.constraint(equalToConstant: 100),
			shareImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			shareImage.topAnchor.constraint(equalTo: self.shareButton.bottomAnchor, constant: 20),
		])
	}

	@objc func onSharing() {
		self.delegate?.shareButtonAction()
	}
}
