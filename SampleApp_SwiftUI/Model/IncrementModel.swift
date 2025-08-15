//
//  IncrementModel.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 21/06/25.
//

import Foundation
import SwiftUI
import AppIntents

class IncrementModel: ObservableObject {
    
    @Published var value = 0
    
    @AppStorage("incrementerValue", store: IncrementModel.defaults)
    var incrementValue: Int = 0 {
        didSet {
            value = incrementValue
        }
    }
    
    static var shared = IncrementModel()
    static let defaults: UserDefaults = UserDefaults(suiteName: IncrementModel.appGroup)!
    static let appGroup = "group.com.ephrim.SampleApp-SwiftUI"
    
    init() {
        self.value = self.incrementValue
    }
    
    func getIncrementValue() -> Int {
        return incrementValue
    }
    
    func logIncrementValue(){
        DispatchQueue.main.async {
            self.incrementValue += 1
        }
    }
    
    func resetIncrementValue(){
        DispatchQueue.main.async {
            self.incrementValue = 0
        }
    }
    
}
