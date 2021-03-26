//
//  SelectSupplierPresenterTests.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import XCTest
@testable import MiFaena

class SelectSupplierPresenterTests: XCTestCase {
    
    var mockDatabaseReference:MockDatabaseReference!
    var mockSelectSupplierWebService: MockSelectSupplierWebService!
    var mockSelectSupplierViewDelegate: MockSelectSupplierViewDelegate!
    var sut:SelectSupplierPresenter!

    override func setUpWithError() throws {
        mockDatabaseReference = MockDatabaseReference()
        mockSelectSupplierWebService = MockSelectSupplierWebService(databaseReference: mockDatabaseReference)
        mockSelectSupplierViewDelegate = MockSelectSupplierViewDelegate()
        sut = SelectSupplierPresenter(selectSupplierWebService: mockSelectSupplierWebService, selectSupplierViewDelegate: mockSelectSupplierViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectSupplierPresenter_WhenFetchSuppliersIsCalled_ShouldCallFetchSuppliersInWebService() {
        
        sut.fetchSuppliers()
        
        XCTAssertTrue(mockSelectSupplierWebService.isFetchSuppliersCalled, "The fetchSuppliers() method in SelectSuppliersWebService was not called.")
        
    }
    
    func testSelectSupplierPresetner_WhenASuccessfulArrayOfSuppliersIsFetched_ShouldCallTheSuccessMethodOnViewDelegate() {
        
        let mockDictionaryPassedByFirebase = ["userId": "2L66Qdsv91dmCQumoOutcUfug7t2", "taxId": "30-51266460-8", "country":"Argentina", "shortName":"A J MENDIZABAL Y CIA", "address":"PERON JUAN TTE.GRAL. 683 Piso:08", "bank":"", "city":"", "longName":"A J MENDIZABAL Y CIA SOCIEDAD ANONIMA COMERCIAL MANDATARIA Y AGRO1PECUARIA","phone":"", "state":"CABA", "dateAdded":1580958000.0, "zip":"", "email":"", "cbu":""] as [String:AnyObject]
        
        mockSelectSupplierWebService.dictionary = mockDictionaryPassedByFirebase
                
        let myExpectation = expectation(description: "Should call the success() method in the view delegate.")
        mockSelectSupplierViewDelegate.expectation = myExpectation
                
        sut.fetchSuppliers()
        
        wait(for: [myExpectation], timeout: 3)

    }
    
    func testSelectSupplierPresetner_WhenAnErrorOccursFetching_ShouldCallTheErrorMethodOnTheViewDelegate() {
        
        let mockDictionaryPassedByFirebase = ["userId": "2L66Qdsv91dmCQumoOutcUfug7t2", "country":"Argentina", "shortName":"A J MENDIZABAL Y CIA", "address":"PERON JUAN TTE.GRAL. 683 Piso:08", "bank":"", "city":"", "longName":"A J MENDIZABAL Y CIA SOCIEDAD ANONIMA COMERCIAL MANDATARIA Y AGRO1PECUARIA","phone":"", "state":"CABA", "dateAdded":1580958000.0, "zip":"", "email":"", "cbu":""] as [String:AnyObject]
        
        mockSelectSupplierWebService.dictionary = mockDictionaryPassedByFirebase
                
        let myExpectation = expectation(description: "Should call the fail() method in the view delegate.")
        mockSelectSupplierViewDelegate.expectation = myExpectation
                
        sut.fetchSuppliers()
        
        wait(for: [myExpectation], timeout: 3)
    }
    
    

}
