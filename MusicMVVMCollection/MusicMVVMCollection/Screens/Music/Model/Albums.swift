//
//  Albums.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import Foundation

struct MusicPage: Decodable {
    let feed: Albums
}

struct Albums: Decodable {
    let results : [music]
}

struct music: Decodable {
    let artistName : String
    let id : String
    let name : String
    let releaseDate : String
    let kind : String
//    let artistUrl : URL?
    let artworkUrl100 : URL
    let genres : [genre]
}

struct genre : Decodable {
    let name : String
    
}
