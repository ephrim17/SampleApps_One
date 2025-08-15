//
//  ArKitView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit
import QuickLook
import ARKit

protocol ArButtonDelegate: NSObject {
	func arButtonAction()
    func openModalAction()
    func alertAction()
}

class ArkitView: UIView {

	weak var delegate : ArButtonDelegate? = nil

	let assetName = "iphone16"
	let assetType = "usdz"
	let allowsContentScaling = true
	let canonicalWebPageURL = URL(string: "https://github.com/ynagatomo/ARQLSanta")

	private lazy var submitButton: UIButton = {
        let button = UIButton()
		button.setTitle("Open Ar View", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
       // button.backgroundColor = .systemPink
        
        var configuration = UIButton.Configuration.borderless()
        configuration.image = UIImage(systemName: "ellipsis")
        configuration.contentInsets = .zero
        button.configuration = configuration
		button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
		return button
	}()
    
    private lazy var openModalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Modal", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(modal_pressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("show Alert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    


	@objc func pressed() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.delegate?.arButtonAction()
        })
	}
    
    @objc func modal_pressed() {
        self.delegate?.openModalAction()
//        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
//            self.delegate?.openModalAction()
//        })
    }
    
    @objc func showAlert() {
        self.delegate?.alertAction()
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
        self.addSubview(openModalButton)
        self.addSubview(alertButton)

		NSLayoutConstraint.activate([
			submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			submitButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            openModalButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 10),
            openModalButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            openModalButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            openModalButton.heightAnchor.constraint(equalToConstant: 40),
            
            alertButton.topAnchor.constraint(equalTo: openModalButton.bottomAnchor, constant: 10),
            alertButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            alertButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            alertButton.heightAnchor.constraint(equalToConstant: 40),
            
		])
	}
}
