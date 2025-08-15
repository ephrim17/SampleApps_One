//
//  AppIntent.swift
//  SampleAppWidget
//
//  Created by ephrim.daniel on 17/06/25.
//

import WidgetKit
import AppIntents
import SwiftUI


struct ResetIncrement: AppIntent {
    
    static var title: LocalizedStringResource = "Reset incerement"
    
    func perform() async throws -> some IntentResult {
        let incrementModel = IncrementModel()
        incrementModel.resetIncrementValue()
        WidgetCenter.shared.reloadTimelines(ofKind: "SampleAppWidget")
        return .result()
    }
}

struct LogIncrement: AppIntent {
    
    static var title: LocalizedStringResource = "Add incerement"
    
    func perform() async throws -> some IntentResult {
        let incrementModel = IncrementModel()
        incrementModel.logIncrementValue()
        WidgetCenter.shared.reloadTimelines(ofKind: "SampleAppWidget")
        return .result()
    }
    
}

//struct InteractiveAddIncrement: AppIntent {
//    static let title: LocalizedStringResource = "Interactive log Snippet"
//
//    func perform() async throws -> some IntentResult & ShowsSnippetView {
////        return await .result(
////              view: InteractiveSnippetView()
////          )
//    
//
//
//            // Show the result of the ticket search.
//        return await .result(
//               snippetIntent: InteractiveSnippetView()
//           )
//        
//        
//      }
//}

struct InteractiveSnippetView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
                .font(.headline)
                .foregroundStyle(.white)
        }
        .background(Color.purple)
    }
}
