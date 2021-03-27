//
//  MainTabBarController.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/21/21.
//

import XCTest
@testable import MiFaena


class MainTabBarControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


//    func testMainTabBarController_WhenCreated_Contains5ViewControllers() throws {
//        let sut = MainTabBarController()
//        sut.loadViewIfNeeded()
//        
//        let numberOfViewControllers = try XCTUnwrap(sut.viewControllers, "The main tab controller has no view controlles assigned to it.")
//        XCTAssertEqual(numberOfViewControllers.count, 5, "The number of view controllers inside the main tab bar controller is not 5.")
//        
//    }
    
    func testMainTabBarController_WhenViewIsLoaded_ChecksIfUserIsSignedIn() {
        
        let sut = MainTabBarController()
        sut.loadViewIfNeeded()
        
        let mockMainTabValidator = MockMainTabValidator()
        let mockMainTabWebService = MockMainTabWebService()
        let mockMainTabViewDelegate = MockMainTabViewDelegate()
        
        let mockMainTabBarControllerPresenter = MockMainTabBarControllerPresenter(mainTabValidator: mockMainTabValidator, mainTabWebService: mockMainTabWebService, delegate: mockMainTabViewDelegate)
        
        sut.mainTabBarControllerPresenter = mockMainTabBarControllerPresenter
        
        mockMainTabBarControllerPresenter.processIsUserSignedIn()
        
        XCTAssertTrue(mockMainTabBarControllerPresenter.processCheckIfUserIsSignedInIsCalled, "The processIsUserSignedIn() was not called when the MainTabBarController was loaded.")
    }
    
    func testMainTabController_WhenViewIsLoadedIfUserIsNotSignedIn_SigninViewControllerIsPresented() {
        
        let sut = MainTabBarController()
        sut.loadViewIfNeeded()
        
        let mockMainTabValidator = MockMainTabValidator()
        let mockMainTabWebService = MockMainTabWebService()
        let mockMainTabViewDelegate = MockMainTabViewDelegate()
        
        let mockMainTabBarControllerPresenter = MockMainTabBarControllerPresenter(mainTabValidator: mockMainTabValidator, mainTabWebService: mockMainTabWebService, delegate: mockMainTabViewDelegate)
        
        sut.mainTabBarControllerPresenter = mockMainTabBarControllerPresenter
        
        mockMainTabBarControllerPresenter.processIsUserSignedIn()
        
        XCTAssertTrue(mockMainTabBarControllerPresenter.processCheckIfUserIsSignedInIsCalled, "The processIsUserSignedIn() was not called when the MainTabBarController was loaded.")
        
    }
    
    func testMainTabController_WhenCreated_HasActionButtonAndActionAttached() throws {
        
        let sut = MainTabBarController()
        sut.loadViewIfNeeded()
        
        let actions = try XCTUnwrap(sut.actionButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "The buttons has not actions attached to it.")
        
        XCTAssertEqual(actions.count, 1, "The buttons attached actions where not 1.")
        
    }
    
    func testMainTabController_WhenActionButtonIsTapped_NewSuppliersInvoiceControllerIsCreated() throws {
        
        let sut = MainTabBarController()
        let navCon = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
        
        sut.actionButton.sendActions(for: .touchUpInside)
        
        let exp = expectation(description: "Test after 1.5 second wait")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(navCon.visibleViewController is UploadSuppliersInvoiceController)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
