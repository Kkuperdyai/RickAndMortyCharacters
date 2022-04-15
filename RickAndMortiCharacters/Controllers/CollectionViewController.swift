//
//  CollectionViewController.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import UIKit
import Kingfisher

class CollectionViewController: UICollectionViewController {
    
    var data: Response?

    override func viewDidLoad() {
        super.viewDidLoad()

        ReadData.shared.delegateData = self
        ReadData.shared.readData()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let count = (data == nil) ? 0 : data!.results.count
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell

        let imageURL = data!.results[indexPath.row].image
        
        DispatchQueue.main.async {
            cell.image.kf.indicatorType = .activity
            let resource = ImageResource(downloadURL: URL(string: imageURL)!)
            cell.image.kf.setImage(with: resource)
            cell.image.contentMode = .scaleAspectFill
          
        }

        
        cell.labelOne.text = data!.results[indexPath.row].name
        cell.labelTwo.text = data!.results[indexPath.row].species
        cell.gender.text = data!.results[indexPath.row].gender
    
        return cell
    }
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: .main)
        let detailVCView = detailVC.view as! DetailView
        let image = (collectionView.cellForItem(at: indexPath) as! CollectionViewCell).image.image
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: { self.setupDetail(detailVCView: detailVCView, indexPath: indexPath, image: image!) })
    }
    
    private func setupDetail(detailVCView: DetailView, indexPath: IndexPath, image: UIImage){
        
        detailVCView.charName.text = data!.results[indexPath.row].name
        detailVCView.charType.text = data!.results[indexPath.row].species
        detailVCView.charGender.text = data!.results[indexPath.row].gender
        detailVCView.charStatus.text = data!.results[indexPath.row].status
        detailVCView.charLastLocation.text = data!.results[indexPath.row].location.name
        detailVCView.charNumberOfEpisodes.text = String(data!.results[indexPath.row].episode.count)
        
        detailVCView.image.image = image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        detailVCView.image.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc private func didTapImageView() {
        print("TAP Ok!!!")
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width / 2 - 20
         let size = CGSize(width: width , height: width)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int)->UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8)
    }
}

//MARK: - ReadDataProtocol

extension CollectionViewController: ReadDataProtocol{
    func readDataOk(data: Response?) {
        self.data = data
        self.collectionView.reloadData()
    }
}
