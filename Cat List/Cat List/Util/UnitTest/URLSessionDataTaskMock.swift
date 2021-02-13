//
//  URLSessionDataTaskMock.swift
//  Cat List
//
//  Created by Javier Susa on 12/02/21.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {

    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true
    }
}
