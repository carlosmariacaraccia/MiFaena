//
//  SuppliersInvoiceSummariesWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import XCTest
@testable import MiFaena


class SuppliersInvoiceSummariesWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUnpaidInvoicesWebService_WhenCalled_FetchesUnpaidInvoices() {
        
        let sut = SuppliersInvoiceSummariesWebService()
        
        sut.getSuppliersInvoiceSummaries { (supInvSummaries) in
            XCTAssertNotNil(supInvSummaries, "The suppliers invoice summaries where nil.")
        }
        
    }

}
