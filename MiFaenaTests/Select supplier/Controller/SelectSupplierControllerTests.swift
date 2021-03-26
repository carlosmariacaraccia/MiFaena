//
//  SelectSupplierControllerTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import XCTest

@testable import MiFaena


class SelectSupplierControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSelectSupplierController_UponCreation_ContainsUICollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        let sut = SelectSupplierController(collectionViewLayout: layout)
        
        XCTAssertNotNil(sut.collectionView, "The collectionView inside the controller is not nil.")
            
    }
    
    func testSelectSupplierController_UponCreation_CallsFetchSuppliersInThePresenter() {
        
        let layout = UICollectionViewFlowLayout()
        let mockDatabaseRef = MockDatabaseReference()
        let mockWebService = MockSelectSupplierWebService(databaseReference: mockDatabaseRef)
        let mockViewDelegate = MockSelectSupplierViewDelegate()
        let mockPresenter = MockSelectSupplierPresenter(selectSupplierWebService: mockWebService, selectSupplierViewDelegate: mockViewDelegate)

        let sut = SelectSupplierController(collectionViewLayout: layout)
        sut.presenter = mockPresenter
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(mockPresenter.isFetchSuppliersCalled, "The fetchSuppliers() method was not called.")
        
    }
    
}
