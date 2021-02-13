//
//  DownloadImageWorker.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

class DownloadImageWorker {

    let setupRequestWorkerObj = SetupRequestWorker()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getImage(_ catModel: CatModel, completion: @escaping (Bool, Data?) -> Void) {
        guard let imageUrl = catModel.image?.url else {
            completion(false, nil)
            return
        }
        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: imageUrl)
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletionImage(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletionImage(_ response: URLResponse?,
                                             _ data: Data?,
                                             _ error: Error?,
                                             completion: @escaping (Bool, Data?) -> Void) {
        DispatchQueue.main.async {
            let httpStatus = response as? HTTPURLResponse
            if httpStatus?.statusCode == 200 {
                completion(true, data)
            } else {
                NSLog("\(httpStatus?.statusCode ?? 400)")
                NSLog("\(httpStatus?.description ?? "Error getImage Function")")
                completion(false, nil)
            }
        }
    }
}
