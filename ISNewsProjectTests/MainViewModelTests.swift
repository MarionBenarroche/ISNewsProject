//
//  MainViewModelTests.swift
//  ISNewsProjectTests
//
//  Created by Marion Benarroche on 12/04/2023.
//

import XCTest
@testable import ISNewsProject

class MainViewModelTests: XCTestCase {
    
    func testNumberOfRows() {
        // If no dataSource is giving to the mainModelView, row should be 0
        let mainViewModel = MainViewModel()
        XCTAssertEqual(mainViewModel.numberOfRows(in: 0), 0)
        
        let source = Source(id: "test-id", name: "Test source")
        let article1 = Article(
            source: source,
            title: "Test title 1",
            url: "www.testurl.com",
            publishedAt: "2023-04-12T20:10:00Z",
            author: "Test author",
            description: nil,
            urlToImage: nil,
            content: nil
        )
        let article2 = Article(
            source: source,
            title: "Test title 2",
            url: "www.testurl.com",
            publishedAt: "2023-04-12T20:10:00Z",
            author: "Test author",
            description: nil,
            urlToImage: nil,
            content: nil
        )
        var latestNewsModel = LatestNewsModel(
            status: "ok",
            totalResults: 1,
            articles: [article1],
            code: nil,
            message: nil
        )
        mainViewModel.dataSource = latestNewsModel
        // If data have one article, row should be one
        XCTAssertEqual(mainViewModel.numberOfRows(in: 0), 1)
        
        // The number of rows should
        latestNewsModel = LatestNewsModel(
            status: "ok",
            totalResults: 1,
            articles: [article1, article2],
            code: nil,
            message: nil
        )
        XCTAssertEqual(mainViewModel.numberOfRows(in: 0), 1)
    }
    
    func testRetriveArticle() {
        // If the view have no data, method should return nil
        let mainViewModel = MainViewModel()
        XCTAssertNil(mainViewModel.retriveArticle(with:"unkown"))
        
        let source = Source(id: "test-id", name: "Test source")
        let title = "Test title 1"
        let article1 = Article(
            source: source,
            title: title,
            url: "www.testurl.com",
            publishedAt: "2023-04-12T20:10:00Z",
            author: "Test author",
            description: nil,
            urlToImage: nil,
            content: nil
        )
        let latestNewsModel = LatestNewsModel(
            status: "ok",
            totalResults: 1,
            articles: [article1],
            code: nil,
            message: nil
        )
        mainViewModel.dataSource = latestNewsModel
        
        // If we pass a worng title, method should return nil
        XCTAssertNil(mainViewModel.retriveArticle(with:"unkown"))
        
        // If we pass the correct tile, method sould return the Article
        XCTAssertNotNil(mainViewModel.retriveArticle(with: title))
    }
}
