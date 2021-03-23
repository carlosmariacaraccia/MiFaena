//
//  SuppliersInvoiceSummariesPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import XCTest
@testable import MiFaena



class SuppliersInvoiceSummariesPresenterTests: XCTestCase {
    
    var mockSuppliersInvoiceSummariesWebService:MockSuppliersInvoiceSummariesWebService!
    var mockSuppliersInvoiceSummeriesViewDelegate:MockSuppliersInvoiceSummeriesViewDelegate!
    var sut:SuppliersInvoiceSummiersPresenter!

    override func setUpWithError() throws {
        
        let mockDatabaseReference = MockDatabaseReference()
        mockSuppliersInvoiceSummariesWebService = MockSuppliersInvoiceSummariesWebService(databaseReference: mockDatabaseReference)
        mockSuppliersInvoiceSummeriesViewDelegate = MockSuppliersInvoiceSummeriesViewDelegate()
        sut = SuppliersInvoiceSummiersPresenter(supplierInvoiceSummariesWebService: mockSuppliersInvoiceSummariesWebService, supplierInvoiceSummariesViewDelegate: mockSuppliersInvoiceSummeriesViewDelegate)
    }

    override func tearDownWithError() throws {
        
        mockSuppliersInvoiceSummariesWebService = nil
        mockSuppliersInvoiceSummeriesViewDelegate = nil
        sut = nil
        
    }

    func testSuppliersInvoiceSummariesPresetner_WhenCalled_ShouldCallFetchSupplierInvoiceSummaries() {

        sut.processFetchSupplierInvoiceSummaries()
        
        XCTAssertTrue(mockSuppliersInvoiceSummariesWebService.fetchIsCalled)
    }
    
    func testSuppliersInvoiceSummariesPresenter_WhenASuccessfullResponseInGiven_ShouldCallViewDelegate() {
        
        let myExpectation = expectation(description: "Call success method on view delegate.")
        
        mockSuppliersInvoiceSummeriesViewDelegate.expectation = myExpectation
        
        sut.processFetchSupplierInvoiceSummaries()
        
        wait(for: [myExpectation], timeout: 3)
        
    }
}
