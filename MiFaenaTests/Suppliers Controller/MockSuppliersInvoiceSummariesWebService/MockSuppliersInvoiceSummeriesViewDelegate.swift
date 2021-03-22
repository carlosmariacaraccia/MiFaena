//
//  MockSuppliersInvoiceSummeriesViewDelegate.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import Foundation
import XCTest

@testable import MiFaena

class MockSuppliersInvoiceSummeriesViewDelegate:SuppliersInvoiceSummariesViewDelegateProtocol {
    
    var expectation:XCTestExpectation?
    
    func successfulRetrieveOfInvSummaries(invoiceSummaries: [SuppliersInvSummary]) {
        
        expectation?.fulfill()
    }
    
    func unsuccessfulRetrieveOfInvSummaries(error: Error) {
        
    }
    
    

}
