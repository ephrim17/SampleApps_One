//
//  DynamicTextField.swift
//  SampleApp_SwiftUI
//
//  Created by Ephrim Daniel on 28/08/25.
//

import SwiftUI
import Combine

class dmtViewModel: ObservableObject {
    @Published var tfText: String = ""
    
    @Published var isValidTf: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    func addDmtSubscriber() {
        $tfText
            .sink { [weak self] text in
                self?.isValidTf = text.isEmpty ? false : true
            }
            .store(in: &cancellables)
    }
    
    init(text: String, isValidtext: Bool) {
        self.tfText = text
        self.isValidTf = isValidtext
        addDmtSubscriber()
    }
}


struct DynamicTextField: View {
    
    @StateObject var dmtViewModel: dmtViewModel

    
    var body: some View {
        
        if !dmtViewModel.tfText.isEmpty {
            Text(dmtViewModel.isValidTf ? "Valid" : "Invalid")
                .foregroundStyle(dmtViewModel.isValidTf ? Color.green :Color.red)
        }
        
        TextField("DynamicTextField", text: $dmtViewModel.tfText)
            .padding(.leading, 15)
            .frame(width: .infinity, height: 40)
            .background(Color.gray.opacity(0.2))
            .foregroundStyle(Color.black)
            .clipShape(.capsule)
            .padding()
        
    }
}

#Preview {
    DynamicTextField(dmtViewModel: dmtViewModel(text: "", isValidtext: false))
}
