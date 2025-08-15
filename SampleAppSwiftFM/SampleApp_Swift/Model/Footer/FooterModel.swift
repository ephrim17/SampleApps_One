//
//  FooterModel.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 12/05/25.
//

import Foundation

struct FooterModel : Codable {
    let footnotes : [String]?
    let modelType : String?

    enum CodingKeys: String, CodingKey {
        case footnotes = "footnotes"
        case modelType = "modelType"
    }
}
