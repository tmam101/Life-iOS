//
//  Network.swift
//  LifeiOS
//
//  Created by Thomas Goss on 2/25/20.
//  Copyright © 2020 Thomas Goss. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    let herokuURL = "https://lifebackend.herokuapp.com/"
    let publicKey = "2546832ef75ef78c9a14bab270a19b"
    // Parameters example
//    func postImageFromURL(imageURL: String) {
//        let parameters: [String: String] = [
//            "text" : "",
//            "imageURL" : imageURL
//        ]
//        post(path: "", parameters: parameters)
//    }
    
    func post(path: String, parameters: [String: String]?) {
        guard let url = URL(string: herokuURL + path) else {
            return
        }
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                let json = try? JSONSerialization.jsonObject(with: response.data!, options: [])
                guard
                    let urlResponse = json as? [String: Any]    // todo any or string? optional?
                    else {
                        print("Get failed")
                        return
                }
//                print(urlResponse)
            }
    }
    
    func get(path: String, _ callback: @escaping (_ response: [String: Any]) -> ()) {
        guard let url = URL(string: herokuURL + path) else {
            return
        }
        AF.request(url,
                   method: .get,
                   parameters: nil)
            .validate()
            .responseJSON { response in
                let json = try? JSONSerialization.jsonObject(with: response.data!, options: [])
                guard
                    let urlResponse = json as? [String: Any]    // todo any or string? optional?
                    else {
                        print("Get failed")
                        return
                }
                callback(urlResponse)
        }
    }
    
}
