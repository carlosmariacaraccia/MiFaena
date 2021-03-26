//
//  MockSelectSupplierViewDelegate.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
import XCTest
@testable import MiFaena

class MockSelectSupplierViewDelegate:SelectSupplierViewDelegateProtocol {
    
    var expectation:XCTestExpectation?
    
    func successfulFetchOfSuppliers(suppliers: [Supplier]) {
        expectation?.fulfill()
    }
    
    func errorFetchingSuppliers(error: Error) {
        expectation?.fulfill()
    }
    
}
