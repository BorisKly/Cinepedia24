//
//  Router.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//

import Foundation
import Alamofire

enum NetworkApiMethods: URLRequestConvertible {
    
    static let apiKey = ConfigValues.get().AccessKeys.accessKeyToTheMovieDB
    
    case listNowPlaying
    case listUpcoming
    case search(query: String?)
    case movieDetail(movieID: Int?)
    case similarMovies(movieID: Int?)
    
    var baseURL : URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .listNowPlaying,
                .listUpcoming,
                .search,
                .movieDetail,
                .similarMovies:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        var params: Parameters = [:]
        switch self {
        case .listNowPlaying, .listUpcoming:
            return nil
        case .search(query: let query):
            if let query = query {
                params["query"] = query
            }
        case .movieDetail(movieID: let movieID):
            if let movieID = movieID {
                params["movieID"] = movieID
            }
        case .similarMovies(movieID: let movieID):
            if let movieID = movieID {
                params["movieID"] = movieID
            }
        }
        return params
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var path: String {
        switch self {
        case .listNowPlaying:
            return "movie/now_playing"
        case .listUpcoming:
            return "movie/upcoming"
        case .search:
            return "search/movie"
        case .movieDetail(movieID: let movieID):
            if let movieID = movieID {
                return "movie/\(movieID)"
            }
        case .similarMovies(movieID: let movieID):
            if let movieID = movieID {
                return "movie/\(movieID)/similar"
            }
        }
        return ""
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        var completeParameters = parameters ?? [:]
        
        completeParameters["api_key"] = NetworkApiMethods.apiKey
        
        let urlRequestPrint = try encoding.encode(urlRequest, with: completeParameters)
        debugPrint("✅ Reqeusted URL: ", urlRequestPrint.url ?? "")
        
        return try encoding.encode(urlRequest, with: completeParameters)
    }
    
}
