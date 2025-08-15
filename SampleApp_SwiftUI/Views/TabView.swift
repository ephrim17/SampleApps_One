//
//  TabView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 11/07/25.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }.badge(2)
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }.badge("!")
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }.badge("!")
            
            
            TabSection("Messages") {
                Tab("Messages", systemImage: "message") {
                    MessagesView()
                }
                Tab("Archive", systemImage: "archivebox") {
                    MessagesArchiveView()
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    MyTabView()
}

struct HomeView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            VStack{
                HStack{
                    carousels
                }
                Spacer()
            }
        }
    }
    
    private var carousels: some View {
        ForEach(0..<10) { _ in
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.pink)
                .frame(width: 300, height: 180)
        }
    }
}


struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}

struct MessagesArchiveView: View {
    var body: some View {
        Text("MessagesArchiveView")
    }
}

struct MessagesView: View {
    var body: some View {
        Text("MessagesView")
    }
}
