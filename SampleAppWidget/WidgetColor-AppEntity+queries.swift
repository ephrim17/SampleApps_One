//
//  WidgetColor-AppEntity.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 21/06/25.
//

import Foundation
import SwiftUI
import AppIntents

struct WidgetColorRanger: Hashable, Codable, Identifiable {
    
    var colorString: ColorValues?
    var id: String {
        colorString?.rawValue ?? UUID().uuidString
    }
    
    static let IncrementerRangerWidgetKind: String = "IncrementerWidget"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var allValues :[WidgetColorRanger] = [
        WidgetColorRanger(colorString: .yellow),
        WidgetColorRanger(colorString: .green),
        WidgetColorRanger(colorString: .red)
    ]
}

enum ColorValues: String, Decodable, Encodable {
    case red = "red"
    case yellow = "yellow"
    case green = "green"
}

extension WidgetColorRanger: AppEntity {
    
    typealias DefaultQuery = WidgetColorRangerQuery
    
    static var defaultQuery: DefaultQuery {
        WidgetColorRangerQuery()
    }
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(name: "WidgetColorRanger")
    }
}

struct WidgetColorRangerQuery: DynamicOptionsProvider, EntityQuery {
    
    
    func entities(for identifiers: [WidgetColorRanger.ID]) async throws -> [WidgetColorRanger] {
       // return WidgetColorRanger.allValues
        WidgetColorRanger.allValues.filter {
            identifiers.contains($0.id)
        }
    }
    
    func suggestedEntities() async throws -> [WidgetColorRanger] {
        return WidgetColorRanger.allValues
    }
    
    func defaultResult() -> WidgetColorRanger? {
        WidgetColorRanger.allValues[0]
    }
}
