//
//  BreedsWorker.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

class BreedsWorker {

    let breedsUrlWorkerObj = BreedsURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getSearch(completion: @escaping (Bool, [CatModel]?) -> Void) {
        let getGetProductsSearchUrl = self.breedsUrlWorkerObj.getCatsUrl()
        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: getGetProductsSearchUrl)

        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletion(_ response: URLResponse?,
                                        _ data: Data?,
                                        _ error: Error?,
                                        completion: @escaping (Bool, [CatModel]?) -> Void) {
        DispatchQueue.main.async {
            do {
                let httpStatus = response as? HTTPURLResponse
                if httpStatus?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let queryResultModel = try decoder.decode([CatModel].self, from: data!)
                    completion(true, queryResultModel)
                } else {
                    NSLog("\(httpStatus?.statusCode ?? 400)")
                    NSLog("\(httpStatus?.description ?? "Error getSearch function")")
                    completion(false, nil)
                }
            } catch {
                NSLog(error.localizedDescription)
                completion(false, nil)
            }
        }
    }
}
