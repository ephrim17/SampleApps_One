//
//  WebViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "done", style: .done, target: self, action: #selector(self.action(sender:)))
		  let myWebView:WKWebView = WKWebView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, UIScreen.main.bounds.height))
		  //myWebView.load(URLRequest(url: URL(string: "https://www.apple.com/hu/legal/statutory-warranty")!))
        var htlmString = "<div style=\"margin-bottom:20px\"><h2>Special offers with these banks</h2></div><div class=\"dd-grid-carrier dd-text-align-center\"><ul role=\"list\" class=\"row justify-content-spaceevenly\" style=\"list-style-type: none; margin: 0; padding: 0;\"><li role=\"listitem\" class=\"column large-3 small-12\"><div class=\"dd-image\"><img src=\"https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/logo-payment-amex?wid=600&amp;hei=228&amp;fmt=png-alpha&amp;.v=c2tIV0Q0am5oYjZrUFl4cXkyL3BEdDdlSElFbjJtT1plQk5EWDZPQXZseTU2WVRXemprcUJnYm9QYzJ2Y3JrVTd4TGVpamVPVEJzTkdZd21wYUQrT1g1cU1XNzliRmYrYjhjMnhmd2RlR2M\" alt=\"American Express\" width=\"180\" height=\"80\" class=\"ir\"></div></li><li role=\"listitem\" class=\"column large-3 small-12\"><div class=\"dd-image dd-push-top-small-20\"><img src=\"https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/logo-payment-axis?wid=600&amp;hei=228&amp;fmt=png-alpha&amp;.v=bzgxS1BtcExKRkJWUlkzQjdXOUhXc1ZwNDFxWStVQVpVUzd0S1BPa0s3NjU2WVRXemprcUJnYm9QYzJ2Y3JrVVpwa2tueEVkZ0tCenBaOVB3WWIwSVg1cU1XNzliRmYrYjhjMnhmd2RlR2M\" alt=\"Axis Bank\" width=\"180\" height=\"80\" class=\"ir\"></div></li><li role=\"listitem\" class=\"column large-3 small-12\"><div class=\"dd-image dd-push-top-small-20\"><img src=\"https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/logo-payment-ICICI?wid=600&amp;hei=228&amp;fmt=png-alpha&amp;.v=Yk1RT251dFdsOWU4cnlqUEtQM2FnMSt1YVNlemZxU3d0dk1rNk93c3lvb01mTXlhWVd2NFgvZG03eEJUc0IzRXlJc1d5RXpVS0V4bmh2SFJoUHpRSlpWNThsMG1Bd2ZxYmFiMDZOSmVpcVU\" alt=\"ICICI Bank\" width=\"180\" height=\"80\" class=\"ir\"></div></li></ul></div><div style=\"margin:20px 0px\">Enjoy cashback and No Cost EMI on selectproducts when you check out with your eligible card from these banks.</div>"
        myWebView.loadHTMLString(htlmString, baseURL: nil)
		self.view.addSubview(myWebView)

		self.title = myWebView.title;
	}


	@objc func action(sender: UIBarButtonItem) {
		// Function body goes here
	}

}
