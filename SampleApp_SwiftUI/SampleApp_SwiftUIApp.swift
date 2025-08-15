//
//  SampleApp_SwiftUIApp.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 28/01/25.
//

import SwiftUI

@main
struct SampleApp_SwiftUIApp: App {
    
    @StateObject var router = Router()
    @StateObject var viewModel = AppMenuViewModel()
    @State var urlStream: Int?
    
    private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            Group {
                appCoordinator.startWithSwiftUI
                    .ignoresSafeArea()
                    .environmentObject(router)
                    .environmentObject(viewModel)
            }
            .onOpenURL { url in
                if let availableMenus = viewModel.menus {
                    guard let scheme = url.scheme, scheme == "sampleappswiftui" else { return }
                    guard let host = url.host else { return }
                    
                    guard let pageID = Int(host) else { return }
            
                    if pageID > availableMenus.count {
                        let foundMenu = AppMenuModel(id: 10, pageName: "AppHelpView")
                        router.path.append(foundMenu)
                    } else {
                        let foundMenu = availableMenus[pageID]
                        router.path.append(foundMenu)
                    }
                }
            }
            .task {
                viewModel.loadMenus()
            }
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    AppMenuViewHandler(menuID: 15)
}

extension URL {
   func valueOfQueryItem(named: String) -> String? {
       guard let url = URLComponents(string: self.absoluteString) else { return nil }
       return url.queryItems?.first( where: { $0.name == named })?.value
    }
}
