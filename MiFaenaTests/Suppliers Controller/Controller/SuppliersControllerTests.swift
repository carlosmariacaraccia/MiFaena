//
//  SuppliersControllerTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/22/21.
//

import XCTest
@testable import MiFaena


class SuppliersControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuppliersController_WhenCreated_ContainsOneConllectionView() {
        let layout = UICollectionViewFlowLayout()
        let sut = SuppliersController(collectionViewLayout: layout)
        
        XCTAssertNotNil(sut.collectionView, "The collection view controller was supposed to contain a collection view.")
        
    }
    
    
    func testSuppliersController_WhenInitialized_CallsFetchInvoiceSummariesOnPresneter() {
        
        let layout = UICollectionViewFlowLayout()
        let sut = SuppliersController(collectionViewLayout: layout)
        let mockWebService = MockSuppliersInvoiceSummariesWebService()
        let mockDelegate = MockSuppliersInvoiceSummeriesViewDelegate()
        let mockPresenter = MockSupplierInvoiceSummariesPresenter(supplierInvoiceSummariesWebService: mockWebService, supplierInvoiceSummariesViewDelegate: mockDelegate)
        sut.presenter = mockPresenter
        
        mockPresenter.processFetchSupplierInvoiceSummaries()
        
        XCTAssertTrue(mockPresenter.processFetchSupInvSumsIsCalled, "The fetchSupplierInvoiceSummaries() should be called but it was not.")
        
    }
    
    func testSuppliersController_WhenFetch5MockSupInvSumsObjecs_SupInvsSumsArrayShouldContain5Elements() throws {
        let layout = UICollectionViewFlowLayout()
        let sut = SuppliersController(collectionViewLayout: layout)
        sut.loadViewIfNeeded()
        let mockWebService = MockSuppliersInvoiceSummariesWebService()
        let mockDelegate = MockSuppliersInvoiceSummeriesViewDelegate()
        let mockPresenter = MockSupplierInvoiceSummariesPresenter(supplierInvoiceSummariesWebService: mockWebService, supplierInvoiceSummariesViewDelegate: mockDelegate)

        sut.presenter = mockPresenter
        
        mockPresenter.processFetchSupplierInvoiceSummaries()
        
        let sups = try XCTUnwrap(sut.supplierInvoiceSummaries, "The supplierInvoicesSummaries array was nil, and it should not")
        
        XCTAssertEqual(sups.count, 5, "The supplierInvoicesSummaries array should contain 5 elements.")

    }

}
