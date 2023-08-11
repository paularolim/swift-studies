//
//  DetailsManager.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import Foundation

protocol DetailsManagerDelegate {
    func didUpdateData(country: CountryDetails)
    func didFailWithError(error: Error)
}

struct DetailsManager {
    public var delegate: DetailsManagerDelegate?
    
    private let baseURL = "https://restcountries.com/v3.1"
    
    public func getDetails(code: String) {
        let urlString = "\(baseURL)/alpha/\(code)"
        performRequest(for: urlString)
    }
    
    private func performRequest(for urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let e = error {
                    delegate?.didFailWithError(error: e)
                }
                
                if let safeData = data {
                    let country = self.parseJSON(data: safeData)
                    if country != nil {
                        delegate?.didUpdateData(country: country!)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    private func parseJSON(data: Data) -> CountryDetails? {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode([CountryDetailsResponse].self, from: data)
            
            var currencies: [String] = []
            if response[0].currencies != nil {
                for currency in response[0].currencies!.keys {
                    currencies.append("\(response[0].currencies![currency]!.name) (\(response[0].currencies![currency]!.symbol))")
                }
            }

            var languages: [String] = []
            if response[0].languages != nil {
                for language in response[0].languages!.keys {
                    languages.append(response[0].languages![language]!)
                }
            }
            
            return CountryDetails(
                name: response[0].name.common,
                capital: response[0].capital?.joined(separator: " | ") ?? "",
                flag: response[0].flags.png,
                language: languages.joined(separator: " | "),
                independent: response[0].independent,
                currencies: currencies.joined(separator: " | "),
                region: "\(response[0].region)" + (response[0].subregion != nil ? " >> \(response[0].subregion!)" : ""),
                area: response[0].area,
                population: response[0].population
            )
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
