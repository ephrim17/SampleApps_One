//
//  SampleApp-WidgetConfiguration.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 21/06/25.
//

import WidgetKit
import AppIntents
import SwiftUI

struct ConfigurationAppIntent: AppIntent, WidgetConfigurationIntent{
    
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
