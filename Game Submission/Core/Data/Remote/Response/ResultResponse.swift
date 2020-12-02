//
//  ResultResponse.swift
//  Game Submission
//
//  Created by danny santoso on 01/12/20.
//

import Foundation

struct ResultResponse<T: Decodable>: Decodable {
    
    let results: T
}
