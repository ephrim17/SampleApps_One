//
//  dynamicProperty.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 09/06/25.
//

import Foundation
import SwiftUI

@propertyWrapper struct Document: DynamicProperty {
    
    init(_ filename: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        url = paths[0].appendingPathComponent(filename)

        let initialText = (try? String(contentsOf: url, encoding: .utf8)) ?? "NOTHING"
        _value = State(wrappedValue: initialText)
    }
    
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            do {
                try newValue.write(to: url, atomically: true, encoding: .utf8)
                value = newValue
            } catch {
                print("Failed to write output")
            }
        }
    }
    @State private var value = ""
    private let url: URL
}


@propertyWrapper
struct IncrementProperty: DynamicProperty {
    
    @State private var value = 0
    
    @AppStorage("incrementerValue", store: IncrementModel.defaults)
    var incrementValue: Int = 0

    var wrappedValue: Int {
        get {
            return incrementValue
        }
        nonmutating set {
            incrementValue = newValue
            value = newValue
        }
    }
    
    var projectedValue: Int {
        get {
            return incrementValue
        }
        nonmutating set {
             incrementValue = newValue
        }
    }
    
    init() {
        self.value = self.incrementValue
    }

}
