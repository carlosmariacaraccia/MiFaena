//
//  SuppliersInvoiceSummariesPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import XCTest
@testable import MiFaena


class SuppliersInvoiceSummariesPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuppliersInvoiceSummariesPresetner_WhenCalled_ShouldCallFetchSupplierInvoiceSummaries() {
        
        let mockSuppliersInvoiceSummariesWebService = MockSuppliersInvoiceSummariesWebService()
        let mockSuppliersInvoiceSummeriesViewDelegate = MockSuppliersInvoiceSummeriesViewDelegate()

        let sut = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: mockSuppliersInvoiceSummariesWebService, supplierInvoiceSummariesViewDelegate: mockSuppliersInvoiceSummeriesViewDelegate)

        sut.processFetchSupplierInvoiceSummaries()
        
        XCTAssertTrue(mockSuppliersInvoiceSummariesWebService.fetchIsCalled)
    }
    
    func testSuppliersInvoiceSummariesPresenter_WhenASuccessfullResponseInGiven_ShouldCallViewDelegate() {
        
        let mockSuppliersInvoiceSummariesWebService = MockSuppliersInvoiceSummariesWebService()
        let mockSuppliersInvoiceSummeriesViewDelegate = MockSuppliersInvoiceSummeriesViewDelegate()
        let myExpectation = expectation(description: "Call success method on view delegate.")
        
        mockSuppliersInvoiceSummeriesViewDelegate.expectation = myExpectation

        let sut = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: mockSuppliersInvoiceSummariesWebService, supplierInvoiceSummariesViewDelegate: mockSuppliersInvoiceSummeriesViewDelegate)
        

        sut.processFetchSupplierInvoiceSummaries()
        
        wait(for: [myExpectation], timeout: 3)

        
    }
}
