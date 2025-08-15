//
//  AppMenuModel.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI
import Foundation

struct AppMenuModel: Codable {
	let id: Int?
	let pageName: String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case pageName = "pageName"
	}
}

extension AppMenuModel: Hashable {
	static func == (lhs: AppMenuModel, rhs: AppMenuModel) -> Bool {
		return lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
		hasher.combine(pageName)
	}
}
