//
//  SampleApp_SwiftUI_watch_widget.swift
//  SampleApp_SwiftUI_watch_widget
//
//  Created by ephrim.daniel on 07/07/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    let incrementModel = IncrementModel()
    let widgetColorModel =  WidgetColorRanger()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widgetColor: widgetColorModel, increment: incrementModel)
    }

    func snapshot(for configuration: ConfigurationAppIntentWatch, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), widgetColor: widgetColorModel, increment: incrementModel)
    }
    
    func timeline(for configuration: ConfigurationAppIntentWatch, in context: Context) async -> Timeline<SimpleEntry> {
        
        return Timeline(entries: [
            SimpleEntry(date: Date(), widgetColor: widgetColorModel, increment: incrementModel)],
            policy: .never)
    }

    func recommendations() -> [AppIntentRecommendation<ConfigurationAppIntentWatch>] {
        // Create an array with all the preconfigured widgets to show.
        [AppIntentRecommendation(intent: ConfigurationAppIntentWatch(), description: "Example Widget")]
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let widgetColor: WidgetColorRanger
    let increment: IncrementModel
}

struct SampleApp_SwiftUI_watch_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            //MARK: Widget UI
            VStack (alignment: .center){
                Text("Increment value")
                    .foregroundStyle(.pink)
                Text("\(entry.increment.incrementValue)")
                    .foregroundStyle(.gray)
            }
            .containerBackground(for: .widget) {
                getColorFor(entry: entry)
            }
        }
    }
    
    func getColorFor(entry: SimpleEntry) -> Color {
        var returnColor: Color = .pink
        if let color = entry.widgetColor.colorString?.rawValue {
            switch color {
            case "red":
                returnColor = Color.red
            case "yellow":
                returnColor = Color.yellow
            case "green":
                returnColor = Color.green
            default:
                returnColor = Color.pink
            }
        }
        return returnColor
    }
}

@main
struct SampleApp_SwiftUI_watch_widget: Widget {
    let kind: String = "SampleAppWidget_watch"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntentWatch.self, provider: Provider()) { entry in
            SampleApp_SwiftUI_watch_widgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}
   
