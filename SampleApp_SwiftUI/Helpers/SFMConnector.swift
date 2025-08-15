//
//  SFMConnector.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/07/25.
//

import Foundation
import UIKit
import SwiftUI
import SampleAppSwiftFM

struct SFMRootVC: UIViewControllerRepresentable {
    
    var setRootUIkit: Bool = false

    func makeUIViewController(context: Context) -> UIViewController {
        let sfm = SampleAppSwiftModule()
        return sfm.getRootViewController(setRootUIkit: self.setRootUIkit)
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
        
    }
    
}
