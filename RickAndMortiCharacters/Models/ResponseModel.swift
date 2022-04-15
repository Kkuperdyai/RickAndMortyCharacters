//
//  ResponseModel.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct Location: Codable {
    let name: String
    let url: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Results: Codable {
    let created: String
    let episode: [String]
    let gender: String
    let id: Int
    let image: String
    let location: Location
    let name: String
    let origin: Origin
    let species: String
    let status: String
    let type: String
    let url: String
}

struct Response: Codable {
    let info: Info
    let results: [Results]
}
