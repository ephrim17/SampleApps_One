//
//  ToastViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//

import UIKit

class ToastViewController: UIViewController {


	lazy var toastView: ToastView = {
		let view = ToastView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.delgate = self
		return view
	}()

	override func viewDidLoad() {
		toastView.loadViewSetup(toastView, parentView: self.view)
	}
}


extension ToastViewController: ToastDelegate {

	func toastButtonAction() {
		self.showToast(message: "Your Toast Message", font: .systemFont(ofSize: 12.0))
	}

	func showToast(message : String, font: UIFont) {

		let window = UIApplication
					.shared
					.connectedScenes
					.compactMap { $0 as? UIWindowScene }
					.flatMap { $0.windows }
					.last { $0.isKeyWindow }

		let frameSize = window?.frame.size

		let toastLabel = UILabel(frame: CGRect(x: frameSize!.width/2 - 75, y: frameSize!.height-150, width: 150, height: 35))

		toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
		toastLabel.textColor = UIColor.white
		toastLabel.font = font
		toastLabel.textAlignment = .center;
		toastLabel.text = message
		toastLabel.alpha = 1.0
		toastLabel.layer.cornerRadius = 10;
		toastLabel.clipsToBounds  =  true
		self.view.addSubview(toastLabel)
		UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
			 toastLabel.alpha = 0.0
		}, completion: {(isCompleted) in
			toastLabel.removeFromSuperview()
		})
	}


}
