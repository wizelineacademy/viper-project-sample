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
        // Given
        let card = Card(title: "", cardNumber: "", expirationDate: "", cvv: "")
        let resultExpected = Model(title: "Home", description: "", card: card)
        
        // When
        interactor?.fetchModel()
        
        // Then
        XCTAssertEqual(presenter?.model?.title, resultExpected.title)
    }
    
    func testFormatCardNumberHasExpected() {
        // Given
        let resultExpected = "1234 5678 9876 5432"
        
        // When
        interactor?.fetchModel()
        interactor?.getFormatCardNumber()
        
        // Then
        XCTAssertEqual(presenter?.formatCardNumber, resultExpected)
    }
    
    func testFormatCardNumberHasNotExpected() {
        // When
        interactor?.getFormatCardNumber()
        
        // Then
        XCTAssertNil(presenter?.formatCardNumber)
    }
    
    func testMaskedCardNumberHasExpected() {
        // Given
        let resultExpected = "**** **** **** 5432"
        
        // When
        interactor?.fetchModel()
        interactor?.getMaskedCardNumber()
        
        // Then
        XCTAssertEqual(presenter?.maskedCardNumber, resultExpected)
    }
    
    func testMaskedCardNumberHasNotExpected() {
        // When
        interactor?.getMaskedCardNumber()
        
        // Then
        XCTAssertNil(presenter?.maskedCardNumber)
    }
    
    func testToggleFunctionExpected() {
        // Given
        let resultExpected = true
        
        // When
        interactor?.toggleFunction()
        
        // Then
        XCTAssertEqual(interactor?.isMaskedCardNumber, resultExpected)
    }
    func testToggleFunctionExpected2() {
        // Given
        let resultExpected = false
        
        // When
        interactor?.toggleFunction()
        interactor?.toggleFunction()
        
        // Then
        XCTAssertEqual(interactor?.isMaskedCardNumber, resultExpected)
    }
}

class MockPresenter: HomeInteractorOutputProtocol {
    var model: Model?
    var formatCardNumber: String?
    var maskedCardNumber: String?

    func setFormatCardNumber(_ cardNumber: String) {
        self.formatCardNumber = cardNumber
    }
    
    func setMaskedCardNumber(_ cardNumber: String) {
        self.maskedCardNumber = cardNumber
    }
    
    func presentView(model: Model) {
        self.model = model
    }
}
