//
//  extensionString.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import Foundation

extension String {
	var replacingLastSpace: String {
		if let lastSpace = range(of: " ", options: .backwards, locale: .current) {
			return replacingCharacters(in: lastSpace, with: "\u{00a0}")
		}
		return self
	}
}
