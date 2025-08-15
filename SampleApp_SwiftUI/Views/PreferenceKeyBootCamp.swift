//
//  PreferenceKeyBootCamp.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 03/07/25.
//

import SwiftUI

//MARK: Using preference key to pass value back from child to parent view

struct PreferenceKeyBootCamp: View {
    
    @State private var title: String = "YEEEE"
    
    var body: some View {
        VStack {
            Text(title)
            AnotherView_PreferenceKeyBootCamp()
        }
        .onPreferenceChange(CustomTitlePreferencekey.self) { newValue in
            title = newValue
        }
    }
}

struct AnotherView_PreferenceKeyBootCamp: View {
    
    @State private var passToParent: String = "Default Title"
    
    var body: some View {
        VStack {
            Text("Another View")
                .setCustomTitle(passToParent)
        }
        .onAppear(perform: updateParentTitle)
    }
    
    func updateParentTitle() {
        //some api call
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            passToParent = "Updated from Data base"
        })
    }
}

struct CustomTitlePreferencekey: PreferenceKey {
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    typealias Value = String
    static var defaultValue: Value = ""
}

extension View {
    
    func setCustomTitle(_ title: String) -> some View {
        preference(key: CustomTitlePreferencekey.self, value: title)
    }
}


#Preview {
    PreferenceKeyBootCamp()
}
