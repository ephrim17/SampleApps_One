//
//  answersModel.swift
//  Assessment_1
//
//  Created by Ephrim Daniel on 19/11/21.
//

import Foundation

struct Answers {
    var id : String?
    var question : String?
    var fieldType : String?
    var answer : selectedAnswer = .FieldAnswer(ans: "")
    var answerCompleted : Bool = false
}

enum selectedAnswer {
	case Yes
	case No
	case FieldAnswer(ans: String)
}
