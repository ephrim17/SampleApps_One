//
//  ArPickerViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit
import QuickLook
import ARKit

class ArPickerViewController: UIViewController {

	private lazy var arkitView: ArkitView = {
		let view = ArkitView()
		view.delegate = self
        view.backgroundColor = .systemBackground
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "AR Picker"
		self.navigationController?.navigationBar.prefersLargeTitles = false
		arkitView.loadViewSetup(arkitView, parentView: self.view)
	}
}

extension ArPickerViewController: ArButtonDelegate, QLPreviewControllerDataSource {
    
    func openModalAction() {
        let scrollVC = FooterViewController()
        present(scrollVC, animated: true, completion: nil)
    }
    
    func alertAction() {
        let alertVC = UIAlertController(title: "Alert", message: "Hello, World!", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    

	func arButtonAction() {
		let previewController = QLPreviewController()
		previewController.dataSource = self
		present(previewController, animated: true, completion: nil)
	}

	func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
		return 1
	}

	func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> any QLPreviewItem {
		let arKit = ArkitView()
        let frameworkBundle = Bundle(for: SampleAppSwiftModule.self)
		guard let path = frameworkBundle.path(forResource: arKit.assetName, ofType: arKit.assetType) else {
			fatalError("Couldn't find the supported asset file.")
		}
		let url = URL(fileURLWithPath: path)
		let previewItem = ARQuickLookPreviewItem(fileAt: url)
		previewItem.allowsContentScaling = arKit.allowsContentScaling // default = true
		//previewItem.canonicalWebPageURL = canonicalWebPageURL   // default = nil
		return previewItem
	}

}

