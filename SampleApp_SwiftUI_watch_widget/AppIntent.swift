//
//  AppIntent.swift
//  SampleApp_SwiftUI_watch_widget
//
//  Created by ephrim.daniel on 07/07/25.
//

import WidgetKit
import AppIntents

//struct ConfigurationAppIntent: WidgetConfigurationIntent {
//    static var title: LocalizedStringResource { "Configuration" }
//    static var description: IntentDescription { "This is an example widget." }
//
//    // An example configurable parameter.
//    @Parameter(title: "Favorite Emoji", default: "😃")
//    var favoriteEmoji: String
//}


struct ConfigurationAppIntentWatch: WidgetConfigurationIntent{
    
    static var title: LocalizedStringResource = "Widget Color"
    static var description: IntentDescription = IntentDescription ("This is an example widget color.")

    // An example configurable parameter.
    @Parameter(title: "select color")
    var widgetColor: WidgetColorRanger?
    
    //@Parameter(title: "increment")
    var increment: IncrementModel?
    //var increment: IncrementRanger?
        
    init(widgetColor: WidgetColorRanger, increment: IncrementModel) {
        self.widgetColor = widgetColor
        self.increment = increment
    }
    
    init() {
        
    }
}
