//
//  AnyTransitionBootCamp.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 10/07/25.
//

import SwiftUI



struct AnyTransitionBootCamp: View {
    
    @State private var showImage = false
    
    var body: some View {
        VStack {
            
        if showImage {
            Image(systemName: "person.circle.fill")
                 .font(.system(size: 100))
                 .transition(.myRotate)
            }
            
            Button(action: {
                withAnimation {
                    showImage.toggle()
                }
            }, label: {
                Text("Tap me")
            })
        }
    }
}




#Preview {
    AnyTransitionBootCamp()
}


struct RotationModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
    }
}

extension AnyTransition {
    
    static var myRotate: AnyTransition {
        AnyTransition.modifier(active: RotationModifier(rotation: 45.0), identity: RotationModifier(rotation: 0.0))
    }
}
