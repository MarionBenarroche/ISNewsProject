//
//  ArticleViewModelTests.swift
//  ISNewsProjectTests
//
//  Created by Marion Benarroche on 12/04/2023.
//

import XCTest
@testable import ISNewsProject

class ArticleViewModelTests: XCTestCase {

    func testInit() {
        let source = Source(id: "test-id", name: "Test source")
        let article = Article(
            source: source,
            title: "Test article",
            url: "www.testurl.com",
            publishedAt: "2023-04-12T20:10:00Z",
            author: "Test author",
            description: "This is test content",
            urlToImage: "www.testimgurl.com",
            content: nil
        )
        let viewModel = ArticleViewModel(article: article)
        
        XCTAssertEqual(viewModel.articleTitle, "Test article")
        XCTAssertEqual(viewModel.articleImage, "www.testimgurl.com")
        XCTAssertEqual(viewModel.articleContent, "This is test content")
        XCTAssertEqual(viewModel.articleURL, "www.testurl.com")
    }

}
