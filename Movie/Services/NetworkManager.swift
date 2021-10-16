//
//  NetworkManager.swift
//  Movie
//
//  Created by Dmitry Kononchuk on 11.10.2021.
//

import Foundation

enum NetworkError: String, Error {
    case badURL = "Bad URL or nil"
    case noData = "Unable to get data"
    case noDecodedData = "The data couldn’t be read because it isn’t in the correct format"
}

class NetworkManager {
    // MARK: - Public Properties
    static let shared = NetworkManager()
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func fetchData(from url: String, with completion: @escaping (Result<Box, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.badURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decode = try decoder.decode(Box.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decode))
                }
                print(decode)
            } catch {
                print(error)
                completion(.failure(.noDecodedData))
            }
        }.resume()
    }
    
    func fetchImageData(from url: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return completion(.failure(.badURL))}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return completion(.failure(.noData)) }
            
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
}
