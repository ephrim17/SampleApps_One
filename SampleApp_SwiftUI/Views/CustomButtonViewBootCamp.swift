//
//  CustomButtonViewBootCamp.swift
//  SampleApp_SwiftUI
//
//  Created by Ephrim Daniel on 07/10/25.
//

import SwiftUI

struct NewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}

extension View {
    func customButtonStyle() -> some View {
        buttonStyle(NewButtonStyle())
    }
}


struct CustomButtonViewBootCamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .frame(width: 300, height :44)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                
        }
        //.buttonStyle(PlainButtonStyle())
        .customButtonStyle()

    }
}

#Preview {
    CustomButtonViewBootCamp()
}
