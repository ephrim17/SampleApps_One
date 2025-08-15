//
//  StateObject_vs_ObservedObject.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI

/*Difference
 --Observed objects marked with the @StateObject property wrapper don’t get destroyed and re-instantiated at times their containing view struct redraws. Understanding this difference is essential in cases another view contains your view.
 */

/*private(set) var count = 0
	 func incrementCounter() {
	 count += 1
	 objectWillChange.send()
}*/

// MARK: StateObject and ObservedObject

class CounterViewModel: ObservableObject {

	@Published var count = 0

	func incrementCounter() {
		count += 1
	}

//	private(set) var count = 0
//		 func incrementCounter() {
//		 count += 1
//		 objectWillChange.send()
//	}
}

struct RandomNumberView: View {
	@State var randomNumber = 0
	var body: some View {
		VStack {
			Text("Random number is: \(randomNumber)")
			Button("Randomize number") {
				randomNumber = (0..<1000).randomElement()!
			}
		}
		CounterView()
			.padding(20)
			.background(Color.pink.opacity(0.2))
			.cornerRadius(15)
	}
}


struct CounterView: View {
	@StateObject var viewModel = CounterViewModel()

	var body: some View {
		VStack {
			Text("**STATEOBJECT VIEW**")
				.bold()
				.fontDesign(Font.Design.monospaced)
				.foregroundStyle(Color.pink)
			Text("Count is: \(viewModel.count)")
			Button("Increment Counter") {
				viewModel.incrementCounter()
			}
		}

	}
}

#Preview {
	RandomNumberView()
}
