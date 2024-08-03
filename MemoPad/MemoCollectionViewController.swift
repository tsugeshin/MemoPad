//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by 柘植紳太郎 on 2024/08/03.
//

import UIKit

class MemoCollectionViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection setion: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
       var contentConfiguration = UIListContentConfiguration.cell()
        
        contentConfiguration.text = "iOSアプリを開発中！"
                                                      
        contentConfiguration.secondaryText = "コレクションビューを勉強している"
                                                     
       cell.contentConfiguration = contentConfiguration
                                                     
       return cell
    
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
