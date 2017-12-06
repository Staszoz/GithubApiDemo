//
//  NetworkCommunicator.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

final class NetworkCommunicator {
    
    enum Result {
        case success(Data)
        case failure(Data?, Error?)
    }
    
    func getRequest(url: URL, headers: [String: String]?, completion: @escaping (Result)->()) {
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url) { (data, response, error) in
            switch (data, response, error) {
            case (let data, let response as HTTPURLResponse, nil) where response.statusCode == 200:
                guard let _data = data else { fallthrough }
                completion(.success(_data))
                
            default:
                completion(.failure(data, error))
            }
        }.resume()
    }
}
