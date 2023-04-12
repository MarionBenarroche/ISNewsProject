//
//  ArticleTableCellViewModelTests.swift
//  ISNewsProjectTests
//
//  Created by Marion Benarroche on 12/04/2023.
//

import XCTest
@testable import ISNewsProject

class ArticleTableCellViewModelTests: XCTestCase {
    
    func testInit() {
        let source = Source(id: "test-id", name: "Test source")
        let article = Article(
            source: source,
            title: "Test article",
            url: "www.testurl.com",
            publishedAt: "2023-04-12T20:10:00Z",
            author: "Test author",
            description: nil,
            urlToImage: "www.testimgurl.com",
            content: nil
        )
        let viewModel = ArticleTableCellViewModel(article: article)
        
        XCTAssertEqual(viewModel.title, "Test article")
        XCTAssertEqual(viewModel.imageURL, "www.testimgurl.com")
    }
}
