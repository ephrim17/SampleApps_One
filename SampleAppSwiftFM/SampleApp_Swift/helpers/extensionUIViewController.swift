//
//  extensionUIViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

extension UIViewController {
	func Alert(Title: String?, Message: String?) {
		let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(OKAction)
		DispatchQueue.main.async {
			self.present(alertController, animated: true, completion: nil)
		}
	}
}
