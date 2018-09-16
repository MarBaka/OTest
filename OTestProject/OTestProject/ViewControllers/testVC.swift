//
//  testVC.swift
//  OTestProject
//
//  Created by Marat on 11.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit

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
        
        var objectsMassive : [Album] = []
        var randomNumberOfElementsOnScreen = Int(arc4random_uniform(14)) + 1
        
        while randomNumberOfElementsOnScreen < 10 {
            randomNumberOfElementsOnScreen = Int(arc4random_uniform(14)) + 1
        }
        
        while objectsMassive.count < randomNumberOfElementsOnScreen {
            let randomIndexOfElement = Int(arc4random_uniform(UInt32(result.count)))
            if !(containsInAlbumArray(array: objectsMassive, object: result[randomIndexOfElement])){
                
            objectsMassive.append(result[randomIndexOfElement])
                print("username : \(result[randomIndexOfElement].title!)")
            }
        }
        
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
    func containsInAlbumArray (array : [Album], object : Album) -> Bool {
        
        for album in array {
            if album.id == object.id {
                return true
                break
            }
        }
        return false
        
    }
}
