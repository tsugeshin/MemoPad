//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by 柘植紳太郎 on 2024/08/03.
//

import UIKit

class MemoCollectionViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection setion: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
       var contentConfiguration = UIListContentConfiguration.cell()
        
        contentConfiguration.text = titles[indexPath.item]
                                                      
        contentConfiguration.secondaryText = contents[indexPath.item]
                                                     
       cell.contentConfiguration = contentConfiguration
                                                     
       return cell
    
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles": [], "contents": [] ])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        collectionView.dataSource = self
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
}
