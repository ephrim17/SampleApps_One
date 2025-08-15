//
//  extensionUIView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

extension UIView {
    
	func loadViewSetup(_ view: UIView, parentView: UIView) {
		parentView.addSubview(view)
		parentView.backgroundColor = .systemBackground
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
			view.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
			view.trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor),
			view.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor)
		])
	}
    
    func loadWithScrollView(scrollView: UIScrollView, childView: UIView, parentView: UIView) {
        parentView.addSubview(scrollView)
        parentView.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        scrollView.addSubview(childView)
        
        childView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        childView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        childView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        childView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}
