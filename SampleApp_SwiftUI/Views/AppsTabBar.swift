//
//  AppsTabBar.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 23/07/25.
//

import SwiftUI

struct AppsTabBar: View {
    var body: some View {
        TabView {
            Tab("SwiftUI", systemImage: "house") {
                AppMenuView()
            }
            Tab("UIKit", systemImage: "house") {
                SFMConnectorView()
            }
        }
    }
}

#Preview {
    AppsTabBar()
}


struct NewTabBarView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        TabView {
            Tab("Library", systemImage: "books.vertical") {
                LibraryView()
            }
            Tab("Book Store", systemImage: "bag") {
                StoreView()
            }
            Tab("Store", systemImage: "storefront") {
                StoreView()
            }
            Tab("Saved", systemImage: "square.and.arrow.down") {
                StoreView()
            }
            
            Tab(role: .search) {
                NavigationStack {
                    SearchView()
                }
            }
        }
        
    }
}

struct LibraryView: View {
    var body: some View {
    }
}
    
    struct StoreView: View {
        var body: some View {
            
        }
    }
    
struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        List {
            Text("Search Screen")
        }
        .navigationTitle("Search")
        .searchable(text: $searchText)
    }
}
