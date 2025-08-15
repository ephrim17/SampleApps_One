////
////  SampleAppWidgetLiveActivity.swift
////  SampleAppWidget
////
////  Created by ephrim.daniel on 17/06/25.
////
//
//import ActivityKit
//import WidgetKit
//import SwiftUI
//
//struct SampleAppWidgetAttributes: ActivityAttributes {
//    public struct ContentState: Codable, Hashable {
//        // Dynamic stateful properties about your activity go here!
//        var emoji: String
//    }
//
//    // Fixed non-changing properties about your activity go here!
//    var name: String
//}
//
//struct SampleAppWidgetLiveActivity: Widget {
//    var body: some WidgetConfiguration {
//        ActivityConfiguration(for: SampleAppWidgetAttributes.self) { context in
//            // Lock screen/banner UI goes here
//            VStack {
//                Text("Hello \(context.state.emoji)")
//            }
//            .activityBackgroundTint(Color.cyan)
//            .activitySystemActionForegroundColor(Color.black)
//
//        } dynamicIsland: { context in
//            DynamicIsland {
//                // Expanded UI goes here.  Compose the expanded UI through
//                // various regions, like leading/trailing/center/bottom
//                DynamicIslandExpandedRegion(.leading) {
//                    Text("Leading")
//                }
//                DynamicIslandExpandedRegion(.trailing) {
//                    Text("Trailing")
//                }
//                DynamicIslandExpandedRegion(.bottom) {
//                    Text("Bottom \(context.state.emoji)")
//                    // more content
//                }
//            } compactLeading: {
//                Text("L")
//            } compactTrailing: {
//                Text("T \(context.state.emoji)")
//            } minimal: {
//                Text(context.state.emoji)
//            }
//            .widgetURL(URL(string: "http://www.apple.com"))
//            .keylineTint(Color.red)
//        }
//    }
//}
//
//extension SampleAppWidgetAttributes {
//    fileprivate static var preview: SampleAppWidgetAttributes {
//        SampleAppWidgetAttributes(name: "World")
//    }
//}
//
//extension SampleAppWidgetAttributes.ContentState {
//    fileprivate static var smiley: SampleAppWidgetAttributes.ContentState {
//        SampleAppWidgetAttributes.ContentState(emoji: "😀")
//     }
//     
//     fileprivate static var starEyes: SampleAppWidgetAttributes.ContentState {
//         SampleAppWidgetAttributes.ContentState(emoji: "🤩")
//     }
//}
//
//#Preview("Notification", as: .content, using: SampleAppWidgetAttributes.preview) {
//   SampleAppWidgetLiveActivity()
//} contentStates: {
//    SampleAppWidgetAttributes.ContentState.smiley
//    SampleAppWidgetAttributes.ContentState.starEyes
//}
