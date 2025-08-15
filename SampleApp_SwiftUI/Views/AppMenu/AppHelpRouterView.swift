//
//  AppHelpRouterView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 16/07/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct AppHelpRouterView: View {
    @ObservedObject var viewModel = AppMenuViewModel()
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("App Help Router")
                .font(.title2)
                .fontWeight(.bold)
            Text("Double tap to copy the view path and paste it in safari to preview the page")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            ForEach(viewModel.menus ?? [], id: \.id) { item in
                HStack {
                    if let pageName = item.pageName, let pageId = item.id {
                        Text(pageName)
                            .onTapGesture(count: 2) {
                                UIPasteboard.general.setValue(pageFromURL(pageId),
                                                              forPasteboardType: UTType.plainText.identifier)
                                showingAlert = true
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("URL Copied"),
                                      message: Text("Now paste it in safari to navigate to the page"),
                                      dismissButton: .default(Text("Got it!")))
                            }
                        Spacer()
                    }
                }
                .padding()
            }
            Spacer()
        }.padding()
            .task {
                viewModel.loadMenus()
            }
    }
}

#Preview {
    AppHelpRouterView()
}

//SampleAppSwiftUI://?page=15
//SampleAppSwiftUI://15


func pageFromURL(_ id: Int) -> String {
//    var path = "SampleAppSwiftUI://?"
//    path += "page=\(id)"
//    return path
    
    var path = "SampleAppSwiftUI://"
    path += "\(id)"
    return path
}

