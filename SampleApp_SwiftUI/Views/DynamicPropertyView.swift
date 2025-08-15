//
//  DynamicPropertyView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 09/06/25.
//

import SwiftUI

struct DynamicPropertyView: View {
    //@customSymbols(\.currencySymbols, "1000") var priceSymbol: String
    @CustomSymbols(\.currencySymbols) var priceSymbol: String = "1000"
    

    var body: some View {
        NavigationView {
            VStack {
                Text(priceSymbol)
                AnotherView(amount: $priceSymbol)
                Button("Change Name") {
                    priceSymbol = "300"
                }
            }
            .navigationTitle("DynamicPropertyView")
        }
    }
}

struct AnotherView: View {
    @Binding var amount: String
    var body: some View {
        Text(amount)
    }
}

#Preview {
    DynamicPropertyView()
}

@propertyWrapper
struct CustomSymbols: DynamicProperty {

    var wrappedValue: String {
        get {
            modifiedValue
        } nonmutating set {
            modifiedValue = appendWithSymbol(newValue)
        }
    }

    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }

    @State private var modifiedValue: String


    init(wrappedValue: String, _ key: KeyPath<SymbolTypes, String>) {
        let symbol = SymbolTypes.shared[keyPath: key]
        self.modifiedValue = symbol + wrappedValue
    }


    private func appendWithSymbol(_ value: String) -> String {
        let symbol = SymbolTypes.shared.getCurrencySymbol()
        return symbol+value
    }
}


struct SymbolTypes {
    static var shared = SymbolTypes()
    var currencySymbols = "$" //set by default
    
    mutating func getCurrencySymbol() -> String{
        //get updated Symbols
        self.currencySymbols = "₹"
        return self.currencySymbols
    }
}



