//
//  SampleAppWidget.swift
//  SampleAppWidget
//
//  Created by ephrim.daniel on 17/06/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func recommendations() -> [AppIntentRecommendation<ConfigurationAppIntent>] {
        [AppIntentRecommendation(intent: ConfigurationAppIntent(), description: "Example Widget")]
    }
    
    
    let incrementModel = IncrementModel()
    let widgetColorModel =  WidgetColorRanger()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widgetColor: widgetColorModel, increment: incrementModel)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), widgetColor: widgetColorModel, increment: incrementModel)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.

        return Timeline(entries: [
            SimpleEntry(date: Date(), widgetColor: configuration.widgetColor ?? widgetColorModel, increment: configuration.increment ?? incrementModel)],
            policy: .never)
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

struct SampleAppWidgetEntryView : View {
    
    var entry: SimpleEntry
    var color: Color

    var body: some View {
    
        //MARK: Widget UI
        VStack (alignment: .center){
            Text("Increment Value")
                .foregroundStyle(.black)
            Text("\(entry.increment.incrementValue)")
                .foregroundStyle(.black)
            
            Button(intent: ResetIncrement()) {
                Text("Reset")
            }
            
            Button(intent: LogIncrement()) {
                Text("Add")
            }
        }
        .containerBackground(for: .widget) {
            getColorFor(entry: entry)
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

struct SampleAppWidget: Widget {
    let kind: String = "SampleAppWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: ConfigurationAppIntent.self,
            provider: Provider()) { entry in
                SampleAppWidgetEntryView(entry: entry, color: Color.pink)
        }
            .configurationDisplayName("Color Widget") //disaplyed on configurable option
            .description("change color of your widget") //disaplyed on configurable option
            //.supportedFamilies([.systemSmall, .systemMedium])
    }
}


#Preview(as: .accessoryInline) {
    SampleAppWidget()
    
} timeline: {
    let incrementModel = IncrementModel()
    let widgetColorModel =  WidgetColorRanger()
    
    SimpleEntry(date: .now, widgetColor: widgetColorModel, increment: incrementModel)
}
