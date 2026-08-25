//
//  AppMenuView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI

struct AppMenuView: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel : AppMenuViewModel
    
    var body: some View {
        NavigationStack(path: $router.path){
            if let menus = viewModel.menus {
                List {
                    Section("Siwft UI"){
                        ForEach(menus, id: \.id) { menu in
                            NavigationLink(value: menu) {
                                HStack {
                                    Text("\(menu.pageName ?? "")")
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Sample App Swift UI")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: AppMenuModel.self) { menu in
                    if let pageID = menu.id {
                        AppMenuViewHandler(menuID: pageID)
                    }
                }
            }
        }
    }
}

#Preview {
    AppMenuViewHandler(menuID: 15)
}
