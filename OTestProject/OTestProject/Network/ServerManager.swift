//
//  ServerManager.swift
//  OTestProject
//
//  Created by Marat on 10.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation

class ServerManager : HTTPRequestManager {
    
    static let server = ServerManager()
    
    func getAlbums(completion: @escaping ([Album]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.albums, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Album].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getPhotos(albumId: Int, completion: @escaping ([Photo]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.albums)\(albumId)/\(Constants.Network.EndPoint.photos)", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Photo].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
}
