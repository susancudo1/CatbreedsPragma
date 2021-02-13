//
//  BreedsURLWorker.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

class BreedsURLWorker {

    // MARK: Variable name for the main API URL
    private let apiUrlBreeds = "API_MAIN_URL"

    // MARK: Subdomain for user endpoint
    private let breedsSubdomain = "breeds"

    // MARK: Gets the full endpoint for Block user function
    func getCatsUrl() -> String {
        return getVariableFromPlist(variableName: apiUrlBreeds) + breedsSubdomain
    }

    // MARK: Function used to get the main backend URL from xcconfig file
    private func getVariableFromPlist(variableName: String) -> String {
        return ((Bundle.main.infoDictionary?[variableName] as? String)?.replacingOccurrences(of: "\\", with: ""))!
    }

}
