//
//  extensionTextAlignment.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 12/05/25.
//


import Foundation
import UIKit

extension NSTextAlignment {
    var semanticContentAlignment: NSTextAlignment {
        if UIView.userInterfaceLayoutDirection(for: UIView.appearance().semanticContentAttribute) == .rightToLeft {
            if self == .left {
                return .right
            } else if self == .right {
                return .left
            }
        }
        return self
    }
}
