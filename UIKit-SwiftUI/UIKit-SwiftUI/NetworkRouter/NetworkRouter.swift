//
//  NetworkRouter.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import Foundation
protocol PhotoNetworkService {
    static func getPhotos(completion: @escaping (Result<SamplePhoto,ErrorHandler>) -> Void)
}
class PhotoNetwork: PhotoNetworkService {
    static func getPhotos(completion: @escaping (Result<SamplePhoto, ErrorHandler>) -> Void) {
        let defaultConfiguration = URLSessionConfiguration.default
        defaultConfiguration.waitsForConnectivity = true
        defaultConfiguration.timeoutIntervalForRequest = 300
        let sharedSession = URLSession(configuration: defaultConfiguration)
        
        var request = URLRequest(url: URL(string: "https://api.slingacademy.com/v1/sample-data/photos")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "GET"
        
        sharedSession.dataTask(with: request) { data,response,error in
            
            if error != nil {
                completion(.failure(ErrorHandler.FailWithError(error)))
                return
            }
            do {
                let userPhotos = try JSONDecoder().decode(SamplePhoto.self, from: data!)
                completion(.success(userPhotos))
                
            } catch {
                completion(.failure(ErrorHandler.customError("\(error.localizedDescription)")))
            }
            
        }.resume()
    }
}
