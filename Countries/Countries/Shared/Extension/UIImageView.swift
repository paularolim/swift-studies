//
//  UIImageView.swift
//  Countries
//
//  Created by Paula Rolim on 04/08/23.
//

import UIKit

extension UIImageView {
    func imageFromURL(_ urlString: String, placeholder: UIImage? = nil) {
        self.image = nil
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    DispatchQueue.main.async {
                        self.image = placeholder
                    }
                    return
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        if let downloaded = UIImage(data: data) {
                            self.image = downloaded
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
