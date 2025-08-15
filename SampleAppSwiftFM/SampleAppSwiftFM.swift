//
//  SampleAppSwiftFM.swift
//  SampleAppSwiftFM
//
//  Created by ephrim.daniel on 04/08/25.
//

import Foundation
import UIKit

public class SampleAppSwiftModule {
    
    public init() {
        // Initializer implementation
    }

    public func getRootViewController(setRootUIkit: Bool = false) -> UIViewController {
        let vc = setupViewControllerEntry(setRootUIkit: setRootUIkit)
        return vc
    }
}


func setupViewControllerEntry(setRootUIkit: Bool) -> UIViewController {
    if (setRootUIkit) {
        let navigationRootVC = UINavigationController(rootViewController: AppMenuViewController())
        return navigationRootVC
    } else{
        let navigationRootVC = UINavigationController(rootViewController: CalendarViewController())
        return navigationRootVC
    }
}
