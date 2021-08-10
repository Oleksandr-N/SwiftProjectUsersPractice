//
//  CollectionViewController.swift
//  First
//
//  Created by Oleksandr on 27.07.2021.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var usersArray: [User] = []
    
    let formatter = DateFormatter.init()




    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        usersArray = UsersFactory.generateUsers()
        
        formatter.dateFormat = "yyyy"

        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = (UIScreen.main.bounds.width - 30) / 3
                    layout.itemSize = CGSize(
                        width: width,
                        height: width)

                    layout.invalidateLayout()
                }

    }
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "UserCollectionViewCell",
            for: indexPath) as! UserCollectionViewCell
        
        let user = usersArray[indexPath.item]
                        
        cell.update(with: user, formatter: formatter)

        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(
            identifier: "UserDetailViewController") as? UserDetailViewController {
            
            let user = usersArray[indexPath.item]
            viewController.user = user
            navigationController?.pushViewController(viewController, animated: true)
        }

    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        .init(width: 50, height: 50)
//    }
}
