//
//  AppRouters.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 16/07/25.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset() {
        path = NavigationPath()
    }
}
