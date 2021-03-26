//
//  SelectSupplierWebServiceTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import XCTest
@testable import MiFaena

class SelectSupplierWebServiceTests: XCTestCase {
    
    var mockDatabaseReference:MockDatabaseReference!
    var sut:SelectSupplierWebService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDatabaseReference = MockDatabaseReference()
        sut = SelectSupplierWebService(databaseReference: mockDatabaseReference)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockDatabaseReference = nil
        sut = nil
    }

    func testSelectSupplierWebService_WhenCalledFetchSuppliers_ReturnsArrayOfSuppliers() {
        
        let mockSupplierSnapshot = MockSupplierSnapshot()
        
        mockDatabaseReference.mockSnapShot = mockSupplierSnapshot
        
        let myExpectation = expectation(description: "Get an array of suppliers from Firebase.")
        
        
        sut.fetchSuppliers { suppliers in
            XCTAssertNotNil(suppliers, "The suppliers returned from firebase is not supposed to be nil, but it was.")
            myExpectation.fulfill()
        }
        
        wait(for: [myExpectation], timeout: 3)
        
    }
    
    func testSelectSupplierWebService_WhenObtainedASuccessfulResponse_ReturnsArrayOfSuppliersWithOneSupplier() {
        
        let mockSupplierSnapshot = MockSupplierSnapshot()
        
        mockDatabaseReference.mockSnapShot = mockSupplierSnapshot
        
        let myExpectation = expectation(description: "Get an array of suppliers from Firebase.")
                
        sut.fetchSuppliers { suppliers in
            XCTAssertTrue(suppliers?.count == Optional(1), "The suppliers count should be 1, but it was not.")
            myExpectation.fulfill()
        }
        
        wait(for: [myExpectation], timeout: 3)
    }
    
    
    func testSelectSupplierWebService_WhenAnInvalidSupplierIsInFirebase_TheSupplierObjectIsNil() {
        
        // in this case a value from the snapshot is missing
        let failMockSnapShot = MockFailSnapshot()
        
        mockDatabaseReference.mockSnapShot = failMockSnapShot
        
        let myExpectation = expectation(description: "Get an nil array of suppliers from Firebase.")
        
        
        sut.fetchSuppliers { suppliers in
            XCTAssertNil(suppliers, "The suppliers array should be nil, but it was not.")
            myExpectation.fulfill()
        }
        
        wait(for: [myExpectation], timeout: 3)
    }

        
}
