//
//  Constants.swift
//  OTestProject
//
//  Created by Marat on 10.09.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Network{
        struct EndPoint {
            static let categories = "categories/"
            static let subcategories = "subcategories/"
            static let cources = "courses/"
            static let news = "news/"
        }
        
        struct ErrorMessage {
            static let NO_INTERNET_CONNECTION = "No internet connection"
            static let UNABLE_LOAD_DATA = "Unable load data"
            static let NO_HTTP_STATUS_CODE = "Unable to get response HTTP status code"
            static let UNAUTHORIZED = "Unauthorized error"
        }
    }
}
