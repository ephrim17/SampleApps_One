//
//  FooterViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 12/05/25.
//
import UIKit

class FooterViewController: UIViewController {
    
    lazy var footerView: FooterView = {
        let view = FooterView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        footerView.loadWithScrollView(scrollView: scrollView, childView: footerView, parentView: self.view)
    }
}
