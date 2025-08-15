//
//  questionModel.swift
//  Assessment_1
//
//  Created by Ephrim Daniel on 19/11/21.
//

import Foundation


struct Question : Decodable {
    let id : String
    let question : String
    let fieldType : String
}
