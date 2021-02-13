//
//  URLSessionMock.swift
//  Cat List
//
//  Created by Javier Susa on 12/02/21.
//

import Foundation

class URLSessionMock: URLSessionProtocol {

    var nextDataTask = URLSessionDataTaskMock()
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?

    private (set) var lastURL: URL?

    func dataTask(with request: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
