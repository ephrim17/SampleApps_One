//
//  FileManagerView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

protocol FileManagerDelegate: AnyObject {
	func downloadButtonAction()
}


class FileManagerView: UIView {

	weak var delegate: FileManagerDelegate? = nil

	lazy var downloadButton: UIButton = {
		let button = UIButton()
		button.setTitle("Download Text File", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	private func setupUI() {
		self.addSubview(downloadButton)
		NSLayoutConstraint.activate([
			downloadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			downloadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			downloadButton.heightAnchor.constraint(equalToConstant: 40),
			downloadButton.widthAnchor.constraint(equalToConstant: 200)
		])
	}

	@objc func presentAlert() {
		self.delegate?.downloadButtonAction()
	}
}
