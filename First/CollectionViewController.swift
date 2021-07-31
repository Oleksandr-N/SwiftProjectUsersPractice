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



    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
}

func getUsersList() -> [User] {

        if let path = Bundle.main.path(forResource: "users", ofType: "json") {

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users: [User] = try decoder.decode([User].self, from: data)

                return users
            } catch {
                print(error)
                // handle error
                return []
            }
        }

        return []
    }

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        let user = usersArray[indexPath.row]
        cell.imageView.image = UIImage(named: user.picture)

        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
}
