//
//  SearchExtensions.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 19.04.2021.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    //  MARK:- Sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 5))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: -5, width: headerView.frame.width - 30, height: 40)
        label.font = UIFont.boldSystemFont(ofSize: view.bounds.height / 33)
        switch section {
        case 1:
            label.text = "Предложение ограничено"
        case 2:
            label.text = "Лучшая цена"
        default:
            label.text = ""
        }
        headerView.addSubview(label)
        
        return headerView
    }
    
    //  MARK:- Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifierCell", for: indexPath) as? CustomCellTableView else { return UITableViewCell()}
        let data = DataTableView()
        switch indexPath.section {
        case 0:
            cell.dataArray = data.catalogDataArray
            cell.typeCategory = Category.сatalog
        case 1:
            cell.dataArray = data.limitedOfferDataArray
            cell.typeCategory = Category.limitedOffer
        case 2:
            cell.dataArray = data.bestPriceDataArray
            cell.typeCategory = Category.bestPrice
        default:
            break
        }
        return cell
    }
    
    //  MARK:- Animation, scroll
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if targetContentOffset.pointee.y < 20 && !isUpstairs{
            miniView.isHidden = false
            
            UIView.animate(withDuration: 0.3) {
                self.searchButton.frame.origin.x = 20
                self.searchButton.center.y = self.scanButton.center.y
                self.miniView.backgroundColor = UIColor(named: "tabBarSelected")
            }
            
            animationTableView(view: tableView, newPosition: CGPoint(x: tableView.center.x, y: tableView.center.y + miniView.frame.height), duration: 0.3)
            navigationController?.navigationBar.isHidden = true
            isUpstairs = true
        }
        else if targetContentOffset.pointee.y >= 20 && isUpstairs {
            UIView.animate(withDuration: 0.3) {
                self.searchButton.frame.origin.x = 0
                self.searchButton.frame.origin.y = 0
                self.miniView.backgroundColor = .white
            }
            animationTableView(view: tableView, newPosition: CGPoint(x: tableView.center.x, y: tableView.center.y - miniView.frame.height), duration: 0.3)
            navigationController?.navigationBar.isHidden = false
            isUpstairs = false
        }
    }
    
    private func animationTableView(view: UIView, newPosition: CGPoint, duration: CFTimeInterval) {
        let animationMove = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animationMove.fromValue = view.layer.position
        animationMove.toValue = newPosition
        animationMove.duration = duration
        view.layer.add(animationMove, forKey: "animationMove")
        view.layer.position = newPosition
    }
}

