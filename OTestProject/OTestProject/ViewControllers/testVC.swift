//
//  testVC.swift
//  OTestProject
//
//  Created by Marat on 11.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation
import UIKit

class TestVC : UIViewController {
    
    
    
    override func viewDidLoad() {
        ServerManager.server.getAlbums(completion: isGettingAlbums, error: printError)
        ServerManager.server.getPosts(completion: isGettingPosts, error: printError)
    }
    
    func printError(error : String) {
        print(error)
    }
    
    func isGettingAlbums(result : [Album]) {
        print("-----------ALBUMS------------")
        for a in result {
            print(a.title!)
        }
    }
    
    func isGettingPosts(result : [Post]) {
        
        print("-----------POSTS------------")
        
        for p in result {
            print(p.title!)
        }
        
    }
    
    
}
