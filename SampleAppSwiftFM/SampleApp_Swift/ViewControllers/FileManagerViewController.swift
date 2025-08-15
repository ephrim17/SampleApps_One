//
//  FileManagerViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

class FileManagerViewController: UIViewController {

	private lazy var fileMangerView: FileManagerView = {
		let view = FileManagerView()
		view.delegate = self
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		fileMangerView.loadViewSetup(fileMangerView, parentView: self.view)
    }
}


extension FileManagerViewController: FileManagerDelegate {
	func downloadButtonAction() {
		let filePath = convertStringToTextFile(text: "Ephrim", fileName: "EphrimDaniel")
		let fileURL = NSURL(fileURLWithPath: filePath!)
		let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
		self.present(activityViewController, animated: true, completion: nil)
	}

	func convertStringToTextFile(text: String, fileName: String) -> String? {
		guard let data = text.data(using: .utf8) else {
			return nil
		}
		let fileManager = FileManager.default
		let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
		if let docDirectory = documentsDirectory {
			let fileURL = docDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
			do {
				try data.write(to: fileURL)
				return fileURL.absoluteString
			} catch {
				print("Error writing file: \(error)")
				return nil
			}
		} else {
			return nil
		}
	}


}
