//
//  IncrementView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 21/06/25.
//

import SwiftUI
import WidgetKit

// Enum for increment actions, usable with SwiftUI
enum IncrementAction: String, CaseIterable, Identifiable {
    case reset = "Reset"
    case add = "Add"
    case none = "None"
    
    var id: String { self.rawValue }
}

struct IncrementView: View {

//    @AppStorage("incrementerValue", store: IncrementModel.defaults)
//    var value: Int = 0
    
    //let incrementModel  = IncrementModel()
    
    @State private var title: String = "Incrementer"
    
    
    //@StateObject var incrementModel = IncrementModel.shared
    
    @IncrementProperty var incrementProperty: Int
    
    @State private var selectedAction: IncrementAction = .none
    
//    var body: some View {
//        VStack {
//            Text("Incrementer Value => \(incrementModel.value)")
//            
//            Button(intent: LogIncrement()) {
//                Text("Add Increment")
//            }
//            
//            Button(intent: ResetIncrement()) {
//                Text("Reset Increment")
//            }
//            
//            .onAppear {
//                incrementModel.value = incrementModel.getIncrementValue()
//            }
//        }
//    }
    
    var body: some View {
        VStack {
            Text("Incrementer Value => \(incrementProperty)")

            Picker("Action", selection: $selectedAction) {
                ForEach(IncrementAction.allCases) { action in
                    Text(action.rawValue).tag(action)
                }
            }
            //.pickerStyle(.segmented)

            Button("Perform Action") {
                switch selectedAction {
                case .reset:
                    incrementProperty = 0
                case .add:
                    incrementProperty += 1
                case .none:
                    break
                }
                updateWidget()
            }
        }
    }
    
    func updateWidget(){
        WidgetCenter.shared.reloadAllTimelines()
        //WidgetCenter.shared.reloadTimelines(ofKind:"SampleAppWidget_watch")
    }
}

struct AnotherTestView: View {
    @Binding var value: Int
    
    var body: some View {
        Text("\(value)")
    }
}


#Preview{
    IncrementView()
}
