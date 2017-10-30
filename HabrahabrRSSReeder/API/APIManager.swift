//
//  APIManager.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    fileprivate var sessionManager: SessionManager?
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    internal func request(_ urlRequest: String, method: HTTPMethod, completion:@escaping ServerResponse){
        
        switch method {
        case .get:
            
            self.sessionManager?.request(urlRequest, method: .get)
                .responseData(completionHandler: { (response) in
                    
                    self.handler(response: response, completion: { (result) in
                        completion(result)
                    })
                })
            
        default:
            break
        }
    }
    
    fileprivate func handler(response: DataResponse<Data>, completion:@escaping ServerResponse) {
        
        switch response.result {
            
        case .success(let dataOk):
            let statusCode = response.response!.statusCode
            switch statusCode {
            case 200..<300:
                DispatchQueue.main.async() {
                    completion(.success(dataOk))
                }
            default:
                DispatchQueue.main.async() {
                    let errorObject = PError(with: statusCode)
                    completion(.failure(errorObject))
                }
            }
            
        case .failure(let error):
            DispatchQueue.main.async {
                completion(.failure(PError(from: error)))
            }
        }
    }
}

