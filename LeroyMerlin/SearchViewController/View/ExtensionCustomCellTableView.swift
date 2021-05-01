//
//  ExtensionCustomCellTableView.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 21.04.2021.
//

import UIKit

extension CustomCellTableView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    //  MARK:- Number
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let data = DataTableView()
        switch CustomCellTableView.sectionTableView {
        case 0:
            CustomCellTableView.sectionTableView += 1
            return data.catalogDataArray.count
        case 1:
            CustomCellTableView.sectionTableView += 1
            return data.limitedOfferDataArray.count
        case 2:
            CustomCellTableView.sectionTableView += 1
            return data.bestPriceDataArray.count
        default:
            return 0
        }
    }
    
    //  MARK:- Cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierCellCollection", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()}
        if typeCategory == Category.сatalog {
            cell.addConstrainsImageViewForCatalog()
        }
        else {
            cell.addConstrainsImageView()
            cell.imageView.clipsToBounds = false
        }
        if indexPath.row < dataArray.count {
            cell.imageView.image = dataArray[indexPath.row].image
            cell.priceLabel.text = dataArray[indexPath.row].price
            cell.descriptionLabel.text = dataArray[indexPath.row].description
        }
        return cell
        
    }
    
    //  MARK:- Size
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let view = SearchViewController.searchView else {return CGSize(width: 170, height: 215)}
        return CGSize(width: view.frame.width / 2, height: view.frame.height / 3 + 10)
    }

    
    
}
