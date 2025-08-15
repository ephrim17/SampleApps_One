//
//  SFMConnectorView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/07/25.
//

import SwiftUI
import SampleAppSwiftFM

struct SFMConnectorView: View {
    
    var body: some View {
        SFMRootVC(setRootUIkit: true)
            .ignoresSafeArea()
    }
}
