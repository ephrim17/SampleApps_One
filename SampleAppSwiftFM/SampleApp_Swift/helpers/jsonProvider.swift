//
//  jsonProvider.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import Foundation


class JsonProvider {

	static let shared = JsonProvider()

    func getData <G: Codable>(type: G.Type, file: String) -> [G] {
        let genericData = [G]()
        do {
            let frameworkBundle = Bundle(for: SampleAppSwiftModule.self)
            
            if let bundlePath = frameworkBundle.path(forResource: file, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath, encoding: .utf8).data(using: .utf8) {
                return try JSONDecoder().decode([G].self, from: jsonData)
            }
            
        } catch {
            print(error)
        }
        
        return genericData
    }
        
	public func readLocalFile() -> [Answers] {
		var questionArray = [Question]()
		var answerArray = [Answers]()
		do {
            let frameworkBundle = Bundle(for: SampleAppSwiftModule.self)
			if let bundlePath = frameworkBundle.path(forResource: "Questions",
												 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath, encoding: .utf8).data(using: .utf8) {
				questionArray = try JSONDecoder().decode([Question].self, from: jsonData)
				for items in questionArray {
					var answer = Answers()
					answer.id = items.id
					answer.question = items.question
					answer.fieldType = items.fieldType
					answerArray.append(answer)
				}
			}
		} catch {
			print(error)
		}
		return answerArray
	}
}

