//
//  URLSessionDataTaskExtensions.swift
//  Cat List
//
//  Created by Javier Susa on 11/02/21.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {
}
