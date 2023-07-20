//
//  ExtensionString.swift
//  SwiftUIList
//
//  Created by Uri on 20/7/23.
//

import Foundation
import SwiftUI

extension String {
    
    func removeHTMLTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
}


/*
 var str = "An apple a day, keeps doctor away!"
 let removeCharacters: Set<Character> = ["p", "y"]
 str.removeAll(where: { removeCharacters.contains($0) } )
 print(str)
 
 */
