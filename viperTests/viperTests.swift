//
//  viperTests.swift
//  viperTests
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import XCTest
@testable import viper

final class viperTests: XCTestCase {
    var interactor: HomeInteractor?
    var presenter: MockPresenter?
    
    override func setUp() {
        super.setUp()
        interactor = HomeInteractor()
        presenter = MockPresenter()
        interactor?.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
        presenter = nil
    }
    
    func testHomeModelHasExpected() {
        let titleExpected = "Home"
        let descriptionExpected = "Home Screen"
        let systemNameExpected = "house"
        
        interactor?.fetchModel()
        
        let model = presenter?.model
        XCTAssertEqual(model?.title, titleExpected)
        XCTAssertEqual(model?.description, descriptionExpected)
        XCTAssertEqual(model?.systemName, systemNameExpected)
    }
}

class MockPresenter: HomeInteractorOutputProtocol {
    var model: Model?
    
    func presentView(model: viper.Model) {
        self.model = model
    }
}
