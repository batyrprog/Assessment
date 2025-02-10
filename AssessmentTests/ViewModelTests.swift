//
//  ViewModelTests.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import Testing
import XCTest
@testable import Assessment

final class ViewModelTests: XCTestCase {
    
    var sut: ViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = ViewModel()
    }
 
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_viewModel_init() {

        XCTAssertNotNil(sut)
    }

    func test_viewModel_FetchImages_Success() async throws {

        await sut.fetchImages("test")

        XCTAssertTrue(sut.didFetchImages)
        XCTAssertFalse(sut.isLoading)
    }
    
    func test_viewModel_FetchImages_Failure() async throws {
        
        await sut.fetchImages("")
        
        XCTAssertTrue(sut.didFetchImages)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.imageItems.isEmpty)
    }
}
