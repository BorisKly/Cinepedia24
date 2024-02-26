//
//  NetworkService.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 23.02.2024.
//

import Foundation
import Alamofire

final class NetworkService {
    
    static let shared: NetworkService = {
        let instance = NetworkService()
        return instance
    }()
    
    let reachabilityManager = NetworkReachabilityManager()?.isReachable
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager ?? false
    }
    
    func request<T: Codable>(_ request: URLRequestConvertible,
                             decodeToType type: T.Type,
                             completionHandler: @escaping (Result<T,Error>) -> ()) {
        AF.request(request).responseData { response in
            
            switch response.result {
                
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(type.self, from: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
