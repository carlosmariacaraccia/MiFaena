//
//  SelectSupplierWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import XCTest
@testable import MiFaena

class SelectSupplierWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectSupplierWebService_WhenCalledFetchSuppliers_ReturnsArrayOfSuppliers() {
        
        let mockDatabseReference = MockDatabaseReference()
        let mockSupplierSnapshot = MockSupplierSnapshot()
        
        mockDatabseReference.mockSnapShot = mockSupplierSnapshot
        
        let myExpectation = expectation(description: "Get an array of suppliers from Firebase.")
        
        let sut = SelectSupplierWebService(databaseReference: mockDatabseReference)
        
        sut.fetchSuppliers { suppliers in
            XCTAssertNotNil(suppliers, "The suppliers returned from firebase is not supposed to be nil, but it was.")
            myExpectation.fulfill()
        }
        
        wait(for: [myExpectation], timeout: 3)
        
    }
    
    func testSelectSupplierWebService_WhenObtainedASuccessfulResponse_ReturnsArrayOfSuppliersWithOneSupplier() {
        
        let mockDatabseReference = MockDatabaseReference()
        let mockSupplierSnapshot = MockSupplierSnapshot()
        
        mockDatabseReference.mockSnapShot = mockSupplierSnapshot
        
        let myExpectation = expectation(description: "Get an array of suppliers from Firebase.")
        
        let sut = SelectSupplierWebService(databaseReference: mockDatabseReference)
        
        sut.fetchSuppliers { suppliers in
            
            XCTAssertTrue(suppliers?.count == Optional(1), "The suppliers count should be 1, but it was not.")
            myExpectation.fulfill()
        }
        
        wait(for: [myExpectation], timeout: 3)
    }
}
