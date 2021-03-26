//
//  SelectSupplierPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import XCTest
@testable import MiFaena

class SelectSupplierPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectSupplierPresenter_WhenFetchSuppliersIsCalled_ShouldCallFetchSuppliersInWebService() {
        
        let mockDatabaseReference = MockDatabaseReference()
        let mockSelectSupplierWebService = MockSelectSupplierWebService(databaseReference: mockDatabaseReference)
        let mockSelectSupplierViewDelegate = MockSelectSupplierViewDelegate()
    
        let sut = SelectSupplierPresenter(selectSupplierWebService: mockSelectSupplierWebService, selectSupplierViewDelegate: mockSelectSupplierViewDelegate)
        
        sut.fetchSuppliers()
        
        XCTAssertTrue(mockSelectSupplierWebService.isFetchSuppliersCalled, "The fetchSuppliers() method in SelectSuppliersWebService was not called.")
        
    }
    
    func testSelectSupplierPresetner_WhenASuccessfulArrayOfSuppliersIsFetched_ShouldCallTheSuccessMethodOnViewDelegate() {
        
        let mockDatabaseReference = MockDatabaseReference()
        let mockSelectSupplierWebService = MockSelectSupplierWebService(databaseReference: mockDatabaseReference)
        
        let mockDictionaryPassedByFirebase = ["userId": "2L66Qdsv91dmCQumoOutcUfug7t2", "taxId": "30-51266460-8", "country":"Argentina", "shortName":"A J MENDIZABAL Y CIA", "address":"PERON JUAN TTE.GRAL. 683 Piso:08", "bank":"", "city":"", "longName":"A J MENDIZABAL Y CIA SOCIEDAD ANONIMA COMERCIAL MANDATARIA Y AGRO1PECUARIA","phone":"", "state":"CABA", "dateAdded":1580958000.0, "zip":"", "email":"", "cbu":""] as [String:AnyObject]
        
        mockSelectSupplierWebService.dictionary = mockDictionaryPassedByFirebase
        
        let mockSelectSupplierViewDelegate = MockSelectSupplierViewDelegate()
        
        let myExpectation = expectation(description: "Should call the success() method in the view delegate.")
        mockSelectSupplierViewDelegate.expectation = myExpectation
        
        let sut = SelectSupplierPresenter(selectSupplierWebService: mockSelectSupplierWebService, selectSupplierViewDelegate: mockSelectSupplierViewDelegate)
        
        sut.fetchSuppliers()
        
        wait(for: [myExpectation], timeout: 3)

    }
    
    func testSelectSupplierPresetner_WhenAnErrorOccursFetching_ShouldCallTheErrorMethodOnTheViewDelegate() {
        
        let mockDatabaseReference = MockDatabaseReference()
        let mockSelectSupplierWebService = MockSelectSupplierWebService(databaseReference: mockDatabaseReference)
        
        let mockDictionaryPassedByFirebase = ["userId": "2L66Qdsv91dmCQumoOutcUfug7t2", "country":"Argentina", "shortName":"A J MENDIZABAL Y CIA", "address":"PERON JUAN TTE.GRAL. 683 Piso:08", "bank":"", "city":"", "longName":"A J MENDIZABAL Y CIA SOCIEDAD ANONIMA COMERCIAL MANDATARIA Y AGRO1PECUARIA","phone":"", "state":"CABA", "dateAdded":1580958000.0, "zip":"", "email":"", "cbu":""] as [String:AnyObject]
        
        mockSelectSupplierWebService.dictionary = mockDictionaryPassedByFirebase
        
        let mockSelectSupplierViewDelegate = MockSelectSupplierViewDelegate()
        
        let myExpectation = expectation(description: "Should call the fail() method in the view delegate.")
        mockSelectSupplierViewDelegate.expectation = myExpectation
        
        let sut = SelectSupplierPresenter(selectSupplierWebService: mockSelectSupplierWebService, selectSupplierViewDelegate: mockSelectSupplierViewDelegate)
        
        sut.fetchSuppliers()
        
        wait(for: [myExpectation], timeout: 3)
    }
    
    

}
