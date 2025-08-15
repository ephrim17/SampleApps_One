//
//  HeaderChevronView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import Foundation
import UIKit

class HeaderChevronView: UIView {

	lazy var headerLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.lineBreakMode = .byWordWrapping
		label.textColor = .label
		label.numberOfLines = 0
		label.textAlignment = .left
		label.adjustsFontForContentSizeCategory = true
		label.font = .preferredFont(forTextStyle: .title1)
		return label
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
		self.addSubview(headerLabel)
		NSLayoutConstraint.activate([
			headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			headerLabel.widthAnchor.constraint(equalToConstant: 100),
			headerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
			headerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
		])
		attachChevron()
	}

	func attachChevron() {
		let actionImageName = "chevron.forward"

		let textStyle: UIFont.TextStyle = .title1
		var font = UIFont.preferredFont(forTextStyle: textStyle)
		let config = UIImage.SymbolConfiguration(font: font)

		let style = NSMutableParagraphStyle()
		style.alignment = NSTextAlignment.left
		style.lineBreakStrategy = .pushOut


		var buttonText = "Featured Apple iPhone Accessories"
		buttonText = buttonText.replacingLastSpace

		let attributedString = NSMutableAttributedString(string: buttonText, attributes: [NSAttributedString.Key.paragraphStyle: style ])

		let image = UIImage(systemName: actionImageName)?.withConfiguration(config).withTintColor(.gray)

		let imageAttachment = NSTextAttachment()

		imageAttachment.image = image
		imageAttachment.bounds = CGRect(x: 0,
                                        y: (font.capHeight - (image?.size.height ?? 5)).rounded() / 2,
										width: image!.size.width,
										height: image!.size.height)
		let imageString = NSAttributedString(attachment: imageAttachment)
		attributedString.append(NSAttributedString(string: "\u{00a0}"))
		attributedString.append(imageString)
		self.headerLabel.attributedText = attributedString
	}
}

