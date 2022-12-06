//
//  NetworkManagerType.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import Foundation


protocol NetworkManagerType {
    func fetchModel<T: Decodable>(request: URLRequest?, completion: @escaping (Result<T, Error>) -> ())
    func fetchRawData(request: URLRequest?, completion: @escaping (Result<Data, Error>) -> ())
}
