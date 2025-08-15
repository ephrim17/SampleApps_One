//
//  AppCoordinator.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 08/08/25.
//

import UIKit
import SwiftUI


class AppCoordinator: NSObject {
    
    var startWithSwiftUI: some View {
        AppsTabBar()
    }
    
    var startWithUIkit: some View {
        SFMRootVC()
    }
}
