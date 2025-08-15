//
//  AppMenuViewModel.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI
import SampleAppSwiftFM

class AppMenuViewModel: ObservableObject {

	@Published var menus : [AppMenuModel]?
    var users : [User]?

    func loadMenus(){
		let menus = [AppMenuModel(id: 0, pageName: "Custom view builder"),
					 AppMenuModel(id: 1, pageName: "Binding view Example"),
					 AppMenuModel(id: 2, pageName: "Geometry Effect View"),
					 AppMenuModel(id: 3, pageName: "State object vs Observed object"),
					 AppMenuModel(id: 4, pageName: "Video Player View"),
                     AppMenuModel(id: 5, pageName: "Dynamic Property wrapper"),
                     AppMenuModel(id: 6, pageName: "RandomColor View"),
                     AppMenuModel(id: 7, pageName: "IncrementView"),
                     AppMenuModel(id: 8, pageName: "AnyTransitionBootCamp"),
                     AppMenuModel(id: 9, pageName: "PreferenceKeyBootCamp"),
                     AppMenuModel(id: 10, pageName: "AppHelpView"),
					]
		self.menus = menus
	}
    
    public func downloadUsers() async {
        await fetchUsers()
    }
    
    func fetchUsers() async {
        do {
            self.users = try await WebService.getData(type: User.self)
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
