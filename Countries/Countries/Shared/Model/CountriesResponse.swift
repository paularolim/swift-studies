//
//  CountriesResponse.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import Foundation

struct CountriesResponse: Decodable {
    let name: Name
    let capital: [String]?
    let flags: Flags
    let cca2: String
    
    struct Name: Decodable {
        let common: String
    }
    
    struct Flags: Decodable {
        let png: String
    }
}
