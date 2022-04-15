//
//  DetailView.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import UIKit

protocol DetailViewProtocol {
    func close()
}

class DetailView: UIView {
        
        var delegate: DetailViewProtocol?

        @IBOutlet weak var image: UIImageView!
        @IBOutlet weak var charName: UILabel!
        @IBOutlet weak var charType: UILabel!
        @IBOutlet weak var charGender: UILabel!
        @IBOutlet weak var charStatus: UILabel!
        @IBOutlet weak var charLastLocation: UILabel!
        @IBOutlet weak var charNumberOfEpisodes: UILabel!
        
        

        @IBAction func closeVC(_ sender: Any) {
            delegate?.close()
        }

    }

