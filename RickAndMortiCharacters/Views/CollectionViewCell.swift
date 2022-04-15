//
//  CollectionViewCell.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "Cell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var gender: UILabel!
    
}
