//
//  BindingView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI

struct VQ: Identifiable {
	var id: String
	var title: String
	var parts: [String]?
	var partNumber = ""
}


extension VQ: Hashable {
	static func == (lhs: VQ, rhs: VQ) -> Bool {
		return lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(title)
	}
}

struct BindingView: View {
	@State var vqStates : [VQ] = [VQ]()
	@State var partNumber : String = ""
	@State var vqSelection : VQ?
	@State var selection: VQ?

	var body: some View {
		VStack {
			List(selection: $selection) {
				Section {
					ForEach($vqStates, id: \.self) { $state in
						VQRow(vq: $state, selectedVQ: $selection)
					}
				}
				PartPicker(vq: $selection, part: $partNumber)
			}
			Button { loadAPICall() } label: { Text("Update") }
		}
		.padding()
		.onAppear {
			var vqStates = [VQ]()
			vqStates.append(VQ(id: "1", title: "A", parts: ["ABC", "DEF"]))
			vqStates.append(VQ(id: "2", title: "B"))
			vqStates.append(VQ(id: "3", title: "C"))
			vqStates.append(VQ(id: "4", title: "D"))
			self.vqStates = vqStates
		}
	}

	func loadAPICall() {
		DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
			print("<<< called ")
			vqStates.removeAll()
			selection =  nil
			vqStates.append(VQ(id: "1", title: "A"))
			vqStates.append(VQ(id: "2", title: "B"))
			vqStates.append(VQ(id: "3", title: "C"))
			vqStates.append(VQ(id: "4", title: "D"))
		})
	}
}

struct PartPicker: View {
	@Binding var vq: VQ?
	@Binding var part: String

	var body: some View {
		if let parts = vq?.parts {
			Picker("Part Number", selection: $part) {
				Text("No Option").tag(Optional<String>(nil))
				ForEach(parts, id: \.self) { part in
					Text(part)
						.tag(part)
				}
			}
		} else {
			EmptyView()
		}
	}
}

struct VQRow: View {
	@Binding var vq: VQ
	@Binding var selectedVQ: VQ?

	var body: some View {
		HStack {
			Text(vq.title)
			if let selected = selectedVQ, selected.id == vq.id {
				Spacer()
				Image(systemName: "checkmark.circle.fill")
					.foregroundColor(.green)
			}
		}
		.padding()
	}
}


