//
//  ExtensionString.swift
//  SwiftUIList
//
//  Created by Uri on 20/7/23.
//

import Foundation

extension String {
    
    func removeHTMLTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
}
