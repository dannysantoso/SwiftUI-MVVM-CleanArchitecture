//
//  API.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation

struct API {
    static let baseURL = "https://api.rawg.io/api/"
    static let imageUrl = ""
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case games
        
        public var url: String {
            switch self {
            case .games:
                return "\(API.baseURL)games"
            }
        }
    }
}
