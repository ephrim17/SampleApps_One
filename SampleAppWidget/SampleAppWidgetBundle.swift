//
//  SampleAppWidgetBundle.swift
//  SampleAppWidget
//
//  Created by ephrim.daniel on 17/06/25.
//

import WidgetKit
import SwiftUI

@main
struct SampleAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        SampleAppWidget()
        SampleAppWidgetControl()
        //SampleAppWidgetLiveActivity()
    }
}
