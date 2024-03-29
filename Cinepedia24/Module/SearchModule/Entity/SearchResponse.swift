//
//  SearchResponse.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 28.02.2024.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let page: Int?
    let results: [SearchOutput]?
    let total_pages, total_results: Int?
}

// MARK: - MovieDetailResult
struct SearchOutput: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date, title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}
