//
//  Cat_ListTests.swift
//  Cat ListTests
//
//  Created by Javier Susa on 11/02/21.
//

import XCTest
@testable import Cat_List

class CatListTests: XCTestCase {

    let mockListCats = """
    [
       {
          "weight":{
             "imperial":"7  -  10",
             "metric":"3 - 5"
          },
          "id":"abys",
          "name":"Abyssinian",
          "cfa_url":"http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
          "vetstreet_url":"http://www.vetstreet.com/cats/abyssinian",
          "vcahospitals_url":"https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
          "temperament":"Active, Energetic, Independent, Intelligent, Gentle",
          "origin":"Egypt",
          "country_codes":"EG",
          "country_code":"EG",
          "description":"The Abyssinian is easy to care for, and a joy to have in your home.",
          "life_span":"14 - 15",
          "indoor":0,
          "lap":1,
          "alt_names":"",
          "adaptability":5,
          "affection_level":5,
          "child_friendly":3,
          "dog_friendly":4,
          "energy_level":5,
          "grooming":1,
          "health_issues":2,
          "intelligence":5,
          "shedding_level":2,
          "social_needs":5,
          "stranger_friendly":5,
          "vocalisation":1,
          "experimental":0,
          "hairless":0,
          "natural":1,
          "rare":0,
          "rex":0,
          "suppressed_tail":0,
          "short_legs":0,
          "wikipedia_url":"https://en.wikipedia.org/wiki/Abyssinian_(cat)",
          "hypoallergenic":0,
          "reference_image_id":"0XYvRd7oD",
          "image":{
             "id":"0XYvRd7oD",
             "width":1204,
             "height":1445,
             "url":"https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
          }
       },
       {
          "weight":{
             "imperial":"7 - 10",
             "metric":"3 - 5"
          },
          "id":"aege",
          "name":"Aegean",
          "vetstreet_url":"http://www.vetstreet.com/cats/aegean-cat",
          "temperament":"Affectionate, Social, Intelligent, Playful, Active",
          "origin":"Greece",
          "country_codes":"GR",
          "country_code":"GR",
          "description":"Native to the Greek islands known as the Cyclades in the Aegean Sea,",
          "life_span":"9 - 12",
          "indoor":0,
          "alt_names":"",
          "adaptability":5,
          "affection_level":4,
          "child_friendly":4,
          "dog_friendly":4,
          "energy_level":3,
          "grooming":3,
          "health_issues":1,
          "intelligence":3,
          "shedding_level":3,
          "social_needs":4,
          "stranger_friendly":4,
          "vocalisation":3,
          "experimental":0,
          "hairless":0,
          "natural":0,
          "rare":0,
          "rex":0,
          "suppressed_tail":0,
          "short_legs":0,
          "wikipedia_url":"https://en.wikipedia.org/wiki/Aegean_cat",
          "hypoallergenic":0,
          "reference_image_id":"ozEvzdVM-",
          "image":{
             "id":"ozEvzdVM-",
             "width":1200,
             "height":800,
             "url":"https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg"
          }
       }
    ]
    """

    func test01DownloadListCatsSuccess() {
        let session = URLSessionMock()
        let worker = BreedsWorker()

        let data = Data(self.mockListCats.utf8)
        session.nextData = data
        let url = URL(string: worker.breedsUrlWorkerObj.getCatsUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: [CatModel]?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch { (success, cats) in
            successResponse = success
            response = cats
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertEqual(response![0].iden, "abys")
        XCTAssertEqual(response![1].iden, "aege")
    }

    func test02DownloadListCatsError() {
        let session = URLSessionMock()
        let worker = BreedsWorker(session: session)

        let url = URL(string: worker.breedsUrlWorkerObj.getCatsUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)
        let data = Data(self.mockListCats.utf8)
        session.nextData = data

        // Perform the request and verify the result
        var successResponse: Bool?
        var response: [CatModel]?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch { (success, cats) in
            successResponse = success
            response = cats
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

    func test03SuccessDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker()

        let image = #imageLiteral(resourceName: "catSplash")
        let data = image.pngData()
        session.nextData = data
        let cat = CatModel(weight: nil, iden: nil, name: nil, cfaUrl: nil, vetstreetUrl: nil, vcahospitalsUrl: nil,
                           temperament: nil, origin: nil, countryCodes: nil, countryCode: nil, description: nil,
                           lifeSpan: nil, indoor: nil, lap: nil, altNames: nil, adaptability: nil, affectionLevel: nil,
                           childFriendly: nil, dogFriendly: nil, energyLevel: nil, grooming: nil, healthIssues: nil,
                           intelligence: nil, sheddingLevel: nil, socialNeeds: nil, strangerFriendly: nil,
                           vocalisation: nil, experimental: nil, hairless: nil, natural: nil, rare: nil, rex: nil,
                           suppressedTail: nil, shortLegs: nil, wikipediaUrl: nil, hypoallergenic: nil,
                           referenceImageId: nil,
                           image: ImageModel(iden: nil,
                                             width: nil,
                                             height: nil,
                                             url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"),
                           imageData: nil)

        let url = URL(string: (cat.image?.url)!)
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")
        worker.getImage(cat) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertNotNil(response)
    }

    func test04FailDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker()

        let image = #imageLiteral(resourceName: "catSplash")
        let data = image.pngData()
        session.nextData = data
        let cat = CatModel(weight: nil, iden: nil, name: nil, cfaUrl: nil, vetstreetUrl: nil, vcahospitalsUrl: nil,
                           temperament: nil, origin: nil, countryCodes: nil, countryCode: nil, description: nil,
                           lifeSpan: nil, indoor: nil, lap: nil, altNames: nil, adaptability: nil, affectionLevel: nil,
                           childFriendly: nil, dogFriendly: nil, energyLevel: nil, grooming: nil, healthIssues: nil,
                           intelligence: nil, sheddingLevel: nil, socialNeeds: nil, strangerFriendly: nil,
                           vocalisation: nil, experimental: nil, hairless: nil, natural: nil, rare: nil, rex: nil,
                           suppressedTail: nil, shortLegs: nil, wikipediaUrl: nil, hypoallergenic: nil,
                           referenceImageId: nil,
                           image: ImageModel(iden: nil,
                                             width: nil,
                                             height: nil,
                                             url: nil),
                           imageData: nil)

        let url = URL(string: "https://www.google.com/")
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")
        worker.getImage(cat) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

    func test05Localized() {
        let string = "title_app".localized
        XCTAssertEqual(string, "Catbreeds")
    }
}
