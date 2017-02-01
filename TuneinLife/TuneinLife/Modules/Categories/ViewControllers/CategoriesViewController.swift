//
//  CategoriesViewController.swift
//  til2
//
//  Created by Kanchan on 26/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var selectedCategoriesArray : [Category]?
    let categories = Categories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryNib = UINib(nibName:UIConstants.NibNames.kCategoriesCellNib , bundle: nil)
        self.collectionView.register(categoryNib, forCellWithReuseIdentifier: UIConstants.CellIdentifiers.kCategoryCellIdentifier)
        
        
    }
}

extension CategoriesViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
       // let allCategories :[Category] = categories.getCategories()
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let allCategories :[Category] = categories.getCategories()
        return allCategories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let allCategories :[Category] = categories.getCategories()
        let currentCat = allCategories[indexPath.row]
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: UIConstants.CellIdentifiers.kCategoryCellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = currentCat.catName
        cell.catImageview.image = UIImage(named: currentCat.catImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("did select: \(indexPath.row) ")
        let allCategories :[Category] = categories.getCategories()
        var currentCat = allCategories[indexPath.row]
        currentCat.isSelected = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        print("did De-select: \(indexPath.row) ")

        var allCategories :[Category] = categories.getCategories()
        var currentCat = allCategories[indexPath.row]
        currentCat.isSelected = false
        
        //remove this cat from the array.
        
        
        
    }
}
