//
//  CatModel.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

struct CatModel: Codable {
    var weight: WeightModel?
    var iden: String?
    var name: String?
    var cfaUrl: String?
    var vetstreetUrl: String?
    var vcahospitalsUrl: String?
    var temperament: String?
    var origin: String?
    var countryCodes: String?
    var countryCode: String?
    var description: String?
    var lifeSpan: String?
    var indoor: Int?
    var lap: Int?
    var altNames: String?
    var adaptability: Int?
    var affectionLevel: Int?
    var childFriendly: Int?
    var dogFriendly: Int?
    var energyLevel: Int?
    var grooming: Int?
    var healthIssues: Int?
    var intelligence: Int?
    var sheddingLevel: Int?
    var socialNeeds: Int?
    var strangerFriendly: Int?
    var vocalisation: Int?
    var experimental: Int?
    var hairless: Int?
    var natural: Int?
    var rare: Int?
    var rex: Int?
    var suppressedTail: Int?
    var shortLegs: Int?
    var wikipediaUrl: String?
    var hypoallergenic: Int?
    var referenceImageId: String?
    var image: ImageModel?
    var imageData: Data?

    enum CodingKeys: String, CodingKey {
        case weight
        case iden = "id"
        case name
        case cfaUrl = "cfa_url"
        case vetstreetUrl = "vetstreet_url"
        case vcahospitalsUrl = "vcahospitals_url"
        case temperament
        case origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor
        case lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation
        case experimental
        case hairless
        case natural
        case rare
        case rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaUrl = "wikipedia_url"
        case hypoallergenic
        case referenceImageId = "reference_image_id"
        case image
        case imageData
    }
}

struct WeightModel: Codable {
    var imperial: String?
    var metric: String?
}

struct ImageModel: Codable {
    var iden: String?
    var width: Int?
    var height: Int?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case iden = "id"
        case width
        case height
        case url
    }
}
