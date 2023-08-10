//
//  HomeManager.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import Foundation

protocol HomeManagerDelegate {
    func didUpdateData(countries: [Country])
    func didFailWithError(error: Error)
}

struct HomeManager {
    public var delegate: HomeManagerDelegate?
    
    private let baseURL = "https://restcountries.com/v3.1"
    
    public func getCountries() {
        let urlString = "\(baseURL)/all?fields=name,capital,flags,cca2"
        performRequest(for: urlString)
    }
    
    private func performRequest(for urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let e = error {
                    delegate?.didFailWithError(error: e)
                    return
                }
                
                if let safeData = data {
                    let countries = self.parseJSON(data: safeData)
                    delegate?.didUpdateData(countries: countries ?? [])
                    return
                }
            }
            
            task.resume()
        }
    }
    
    private func parseJSON(data: Data) -> [Country]? {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode([CountriesResponse].self, from: data)
            
            var countries: [Country] = []
            for country in response {
                let formatted = Country(
                    name: country.name.common,
                    capital: country.capital?.joined(separator: " | ") ?? "",
                    flag: country.flags.png,
                    code: country.cca2
                )
                countries.append(formatted)
            }
            return countries
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
