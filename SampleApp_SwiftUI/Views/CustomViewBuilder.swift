//
//  CustomViewBuilder.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI

struct CustomViewBuilder: View {
    @State private var notificationShown = false
    
    var body: some View {
        VStack {
//            if self.notificationShown {
//                NotificationView {
//                    Text("notification")
//                    Text("Hello")
//                }
//            }
//            
//            Spacer()
//            
//            Button("toggle") {
//                self.notificationShown.toggle()
//            }
//            
//            Spacer()
            CustomViewType(type: .three, function: customViewTypeAction)
        }
    }
    
    func customViewTypeAction(received: String) {
        print("<<< customViewTypeAction received: \(received)")
    }
}

struct NotificationView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(16)
    }
}

struct CustomViewType: View {
    
    enum viewType {
        case one
        case two
        case three
    }
    
    let type: viewType
    let function : (String) -> Void
    
    var body: some View {
        VStack {
            content
        }
    }
    
   @ViewBuilder private var content: some View {
        switch type {
        case .one:
            oneView
        case .two:
            twoView
        case .three:
            threeView
        }
    }
    
    private var oneView: some View {
        Text(" One")
    }
    
    private var twoView: some View {
        Text("two")
    }
    
    private var threeView: some View {
        HStack {
            Text("three")
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.red)
            Button {
                self.function("Sent")
            } label: {
                Text("click me ")
            }
        }
    }
}

#Preview {
    CustomViewBuilder()
}
