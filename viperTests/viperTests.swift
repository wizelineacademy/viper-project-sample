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
        // TODO: testHomeModelHasExpected
    }
}

class MockPresenter: HomeInteractorOutputProtocol {
    var model: Model?

    func setFormatCardNumber(_ cardNumber: String) {
        // TODO: setFormatCardNumber
    }
    
    func setMaskedCardNumber(_ cardNumber: String) {
        // TODO: setMaskedCardNumber
    }
    
    func presentView(model: Model) {
        self.model = model
    }
}
