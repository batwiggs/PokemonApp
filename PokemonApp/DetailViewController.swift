//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Brennan Twiggs on 2/24/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    var creature: Creature!

    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = creature.name
        
        let creatureDetail = CreatureDetail()
        creatureDetail.urlString = creature.url
        creatureDetail.getData {
            DispatchQueue.main.async {
                self.height.text = "\(creatureDetail.height)"
                self.weight.text = "\(creatureDetail.weight)"
                guard let url = URL(string: creatureDetail.imageURL) else {return}
                do {
                    let data = try Data(contentsOf: url)
                    self.image.image = UIImage(data: data)
                } catch {
                    print("ERROR getting image")
                }
            }
        }
    }
    
    

    
}
