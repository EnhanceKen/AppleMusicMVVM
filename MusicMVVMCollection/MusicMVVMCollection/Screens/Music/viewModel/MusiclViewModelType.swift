//
//  MusicCellViewModel.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import Foundation

protocol MusicAlbumViewModelType {
    func bind(completion: @escaping() -> ())
    func fetchPage()
    var count: Int {get}
    func albumTitle(for index: Int) -> String?
    func artist(for index: Int) -> String?
    func releaseDate(for index: Int) -> String?
    func albumGenres(for index: Int) -> [genre]
    func imageData(for index: Int, completion: @escaping (Data?) -> ())
    
}


class MusicAlbumViewModel {
    typealias UpdateHandler = (() -> ())
    
    private var musicPage: MusicPage?
    private var albums: [music] = []
    private let networkManager: NetworkManagerType
    var updateHandler: UpdateHandler?
    
    init(networkManager: NetworkManagerType = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}
extension MusicAlbumViewModel: MusicAlbumViewModelType {
    
    func bind(completion: @escaping () -> ()) {
        self.updateHandler = completion
    }
    
    func fetchPage() {
        let req = NetworkParams.albumsMostPlayed.request
        
        
        self.networkManager.fetchModel(request: req) { (result: Result<MusicPage, Error>) in
            switch result {
                
            case .success(let resultie):
                let albumRes = resultie.feed.results
                self.albums.append(contentsOf: albumRes )
                self.updateHandler?()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var count: Int {
        return self.albums.count
    }
    
    func releaseDate(for index: Int) -> String? {
        guard index < self.count else {return nil}
        return self.albums[index].releaseDate
    }
    
    func albumGenres(for index: Int) -> [genre] {
        guard index < self.count else {return []}
        return self.albums[index].genres
    }
    
    func albumTitle(for index: Int) -> String? {
        guard index < self.count else {return nil}
        return self.albums[index].name
    }
    
    func artist(for index: Int) -> String? {
        guard index < self.count else {return nil}
        return self.albums[index].artistName
    }
    
    func imageData(for index: Int, completion: @escaping (Data?) -> ()) {
        guard index < self.count else {return}
        
        let request = NetworkParams.albumImage("\(self.albums[index].artworkUrl100)").request
        
        self.networkManager.fetchRawData(request: request) { res in
            switch res {
            case .success(let data):
                completion(data)
                
            case .failure(let error):
                print("failed getting image: \(error)")
            }
        }
    }
}
