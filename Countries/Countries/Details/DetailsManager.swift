//
//  DetailsManager.swift
//  Countries
//
//  Created by Paula Rolim on 03/08/23.
//

import Foundation

protocol DetailsManagerDelegate {
    func didUpdateData(country: Country)
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
    
    private func parseJSON(data: Data) -> Country? {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode([CountriesResponse].self, from: data)
            return Country(
                name: response[0].name.common,
                capital: response[0].capital?.joined(separator: " | ") ?? "",
                flag: response[0].flags.png,
                code: response[0].cca2
            )
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
