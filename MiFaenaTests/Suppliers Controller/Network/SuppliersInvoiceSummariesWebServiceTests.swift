//
//  SuppliersInvoiceSummariesWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import XCTest
@testable import MiFaena


class SupsInvsSumsWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSupsInvsSumsWebService_WhenGetSuppliersSummaryInvoicesIsCalled_SuppliersSummaryInvoicesAreReturned() {
        let mockDatabaseReference = MockDatabaseReference()
        let mockSnapShot = MockSnapshotSuppliersInvoicesSummary()
        mockDatabaseReference.mockSnapShot = mockSnapShot
        let sut = SupsInvsSumsWebService(databaseReference: mockDatabaseReference)
        
        let myExpectation = expectation(description: "returnSuppliersInvoiceSummaries")
        
        sut.getSuppliersInvoiceSummaries { supplierInvoiceSummaries in
                XCTAssertTrue(supplierInvoiceSummaries?.count == 1, "The supplierInvoiceSummaries did not contained 1 element.")
                myExpectation.fulfill()
        }
        
        self.wait(for: [myExpectation], timeout: 2)
    }
}
