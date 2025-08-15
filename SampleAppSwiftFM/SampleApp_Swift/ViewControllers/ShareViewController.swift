//
//  ShareViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 27/01/25.
//

import UIKit
import LinkPresentation

class ShareViewController: UIViewController {

	lazy var shareView: ShareView = {
		let view = ShareView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.delegate = self
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		shareView.loadViewSetup(shareView, parentView: self.view)
	}

	func shareURLWithMetadata(metaData: LPLinkMetadata) {
		let metadataItemSource = LinkPresentationItemSource(metaData: metaData)
		let activity = UIActivityViewController(activityItems: [metadataItemSource], applicationActivities: [])
		present(activity, animated: true)
	}
}


class LinkPresentationItemSource: NSObject, UIActivityItemSource {
	var linkMetaData = LPLinkMetadata()

	func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
		return linkMetaData
	}

	//Placeholder for real data, we don't care in this example so just return a simple string
	func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
		return "Placeholder"
	}

	/// Return the data will be shared
	/// - Parameters:
	///   - activityType: Ex: mail, message, airdrop, etc..
	func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
		return linkMetaData.originalURL
	}

	init(metaData: LPLinkMetadata) {
		self.linkMetaData = metaData
	}
}

extension ShareViewController: ShareViewDelegate {
	func shareButtonAction() {
		let metaData = LPLinkMetadata()
        let image = UIImage(named: "gift-sharesheet-logo",
                            in: Bundle(for: type(of: self)),
                            compatibleWith: nil)
        //let image = UIImage(systemName: "heart.fill")
		metaData.imageProvider = NSItemProvider.init(object: image!)
		metaData.title = "Gift Sample"
		shareURLWithMetadata(metaData: metaData)
        
        
        let bundle = Bundle(for: type(of: self)) // Get the bundle of the current class
                if let image = UIImage(named: "YourImageName", in: bundle, compatibleWith: nil) {
                    //imageView.image = image
                    print("<<< image found \(image)")
                } else {
                    print("Error: Image 'YourImageName' not found in framework bundle.")
                }
	}
}
