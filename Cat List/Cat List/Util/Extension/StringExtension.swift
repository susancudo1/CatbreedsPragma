//
//  StringExtension.swift
//  Cat List
//
//  Created by Javier Susa on 12/02/21.
//

import Foundation

extension String {
    public var localized: String {
        return Localizator.sharedInstance.localize(self)
    }
}
