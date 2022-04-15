//
//  DetailViewController.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        (self.view as! DetailView).delegate = self
        
    }
    
    func addTapInImage(_ image: UIImageView){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        
        // Add Tap Gesture Recognizer
        image.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func didTapImageView(){
        print("TAP inside Image Ok!!!")
    }

}

extension DetailViewController: DetailViewProtocol {
    func close() {
        dismiss(animated: true, completion: nil)
    }
}
