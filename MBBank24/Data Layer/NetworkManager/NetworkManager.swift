//
//  NetworkManager.swift
//  MBBank24
//
//  Created by Marin Bagrin on 30.09.2025.
//
import Foundation
protocol NetworkManager {
    func fetchImage(strImage: String,handle: @escaping (_ image:Data) -> Void)
}
class NetworkManagerImpl:NetworkManager {
    init () {}
    func fetchImage(strImage: String,handle: @escaping (_ image:Data) -> Void) {
        //https://res.cloudinary.com/<cloud_name>/<asset_type>/<delivery_type>/<transformations>/<version>/<public_id_full_path>.<extension>
        //https://res.cloudinary.com/dt9ndrtps/image/upload/v1759520129/mia.png
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "res.cloudinary.com"
        urlComponents.path = "/dt9ndrtps/image/upload/" + strImage
        
        guard let url = urlComponents.url else {fatalError("не поулчилсоь создать URL")}
        
        var request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { fatalError("не получилось дату получить")}
            handle(data)
        }.resume()
    }
    
    func fetchPhoto(handler: @escaping (_ rawImage:Data) -> Void) {
        let apiKey:String = "Wnev8AMOWJ6jWYvqKR7Qd19PNO41AbzD-c_HP-Jsna0"
        print("nachalo")
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/search/photos"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: apiKey),
            URLQueryItem(name: "query", value: "car"),
        ]
        guard let url = urlComponents.url else {fatalError("not able do url from components")}
        
        //var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {fatalError("data is nil1")}
            
            do {
                guard let recievePhoto = try? JSONDecoder().decode(PhotoUnsplash.self, from: data).results[0].urls.raw else {fatalError("Do not decode data")}
                print(recievePhoto)
                guard let urlRawPhoto = URL(string: recievePhoto) else {fatalError("neudacha pri konverzii v url")}
                //request = URLRequest(url: urlRawPhoto)
                URLSession.shared.dataTask(with: urlRawPhoto) {(data, _, error) in
                    print(222)
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    guard let data = data else {fatalError("data is nil2")}
                    handler(data)
                }.resume()
            }
            
        }.resume()
    }
}
