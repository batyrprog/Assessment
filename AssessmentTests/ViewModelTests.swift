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

    func test_viewModel_init() {
        let viewModel = ViewModel()

        XCTAssertNotNil(viewModel)
    }

    func test_viewModel_FetchImages_Success() async throws {

        let viewModel = ViewModel()

        await viewModel.fetchImages("test")

        XCTAssertTrue(viewModel.didFetchImages)
        XCTAssertFalse(viewModel.isLoading)
    }
}
