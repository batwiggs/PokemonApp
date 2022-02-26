//
//  CreatureDetail.swift
//  PokemonApp
//
//  Created by Brennan Twiggs on 2/24/22.
//

import Foundation


class CreatureDetail {
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprites
    }
    
    private struct Sprites: Codable {
        var front_default: String
    }
    
    var height = 0.0
    var weight = 0.0
    var imageURL = ""
    var urlString = ""
    
    func getData(completed: @escaping ()->()) {
        
        //create URL
        guard let url = URL(string: urlString) else {
            print("🥶 ERROR: Couldn't Create URL.")
            return
        }
        
        //open session
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {(data, response, error) in
            
            if let error = error {
                print("🤬 ERROR: \(error.localizedDescription)")
            }
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                //print("😝 Here's what was returned: \(returned)")
                self.height = returned.height
                self.weight = returned.weight
                self.imageURL = returned.sprites.front_default
            } catch {
                print("🤯 JSON ERROR")
            }
            completed()
            
        }
        task.resume()
    }
}
