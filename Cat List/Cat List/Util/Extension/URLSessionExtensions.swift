//
//  URLSessionExtensions.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

protocol URLSessionProtocol { typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with request: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let daTa: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
        return daTa as URLSessionDataTaskProtocol
    }
}
