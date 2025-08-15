//
//  CustomNavigationBar.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 03/07/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    @State var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                customNavBarTitle
                    .opacity(Double(scrollViewOffset) / 63.0)
                    .background(
                        GeometryReader { geo in
                            Text("")
                                .preference(key: CustomNavBarPreferenceKey.self, value: geo.frame(in: .global).minY)
                        }
                    )
                customNavBarContent
            }
        }
        .overlay(alignment: .top, content: {
            Text("Custom Nav Bars \(scrollViewOffset)")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .background(Color.white)
                .opacity(scrollViewOffset < 50 ? Double(-scrollViewOffset) : 0)
        })
        .onPreferenceChange(CustomNavBarPreferenceKey.self, perform: { value in
            scrollViewOffset = value
        })
    }
}

#Preview {
    CustomNavigationBar()
}


extension CustomNavigationBar {
    
    private var customNavBarTitle: some View {
        Text("Custom Nav Bar")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title)
            .fontWeight(.bold)
            .padding()
    }
    
    private var customNavBarContent: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.pink)
                .frame(width: .infinity, height: 180)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}


struct CustomNavBarPreferenceKey: PreferenceKey {
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    typealias Value = CGFloat
    static let defaultValue: Value = 0
}
