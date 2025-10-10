//
//  JSON2Swift.swift
//  MBBank24
//
//  Created by Marin Bagrin on 30.09.2025.
//

struct PhotoUnsplash: Codable {
    //var id: String
    var results: [Photo]
}
struct Photo:Codable {
    var urls:Urls
}
struct Urls: Codable {
    var raw: String
}
