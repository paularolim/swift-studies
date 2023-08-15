//
//  CountriesResponse.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import Foundation

struct CountryDetailsResponse: Decodable {
    let name: Name
    let capital: [String]?
    let flags: Flags
    let independent: Bool
    let currencies: [String: Currency]?
    let languages: [String: String]?
    
    let region: String
    let subregion: String?
    let area: Int
    let population: Int

    struct Name: Decodable {
        let common: String
    }
    
    struct Flags: Decodable {
        let png: String
    }
    
    struct Currency: Decodable {
        let name: String
        let symbol: String?
    }
}
