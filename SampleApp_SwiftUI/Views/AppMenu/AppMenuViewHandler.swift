//
//  AppMenuViewHandler.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 16/07/25.
//

import SwiftUI

struct AppMenuViewHandler: View {
    var menuID: Int
    
    var body: some View {
        viewHandler(menuID)
    }
}

@ViewBuilder func viewHandler(_ forMenuID: Int) -> some View {
    switch forMenuID {
    case 0:
        CustomViewBuilder()
    case 1:
        BindingView()
    case 2:
        MatchedGeometryDemo()
    case 3:
        RandomNumberView()
    case 4:
        VideoPlayerView()
    case 5:
        DynamicPropertyView()
    case 6:
        RandomColorView(randomColor: Color.purple, randomColorValue: "Purple")
    case 7:
        IncrementView()
    case 8:
        AnyTransitionBootCamp()
    case 9:
        PreferenceKeyBootCamp()
    default:
        AppHelpRouterView()
    }
}
