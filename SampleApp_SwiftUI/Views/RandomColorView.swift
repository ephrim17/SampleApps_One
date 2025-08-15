//
//  RandomColorView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 20/06/25.
//

import SwiftUI

struct RandomColorView: View {
    
    @State var randomColor: Color
    @State var randomColorValue: String
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Hello Colors!")
                .foregroundStyle(.white)
                .font(.system(size: 100))
            Text(randomColorValue)
                .foregroundStyle(.white)
                .font(.system(size: 100))
            Button {
                changeColor()
            } label: {
                Text("change color")
                    .foregroundStyle(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(randomColor)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    static let allColours :[RandomColor] = [
        RandomColor(id: "red", color: Color.red),
        RandomColor(id: "blue", color: Color.blue),
        RandomColor(id: "green", color: Color.green),
        RandomColor(id: "yellow", color: Color.yellow),
        RandomColor(id: "purple", color: Color.purple),
    ]
    
    func changeColor(){
        let number = RandomColorView.allColours.count
        let randomInt = Int.random(in: 0..<number)
        randomColor = RandomColorView.allColours[randomInt].color
        randomColorValue = RandomColorView.allColours[randomInt].id
    }
}

struct RandomColor {
    var id: String
    var color: Color
}

public extension Color {
    
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
