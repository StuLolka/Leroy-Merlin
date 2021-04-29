//
//  CustomTableViewCell.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 19.04.2021.
//

import UIKit

final public class CustomCellTableView: UITableViewCell {
    
    static var sectionTableView = 0
    public var dataArray = [Product]()
    public var typeCategory = Category.сatalog
    
    lazy private var collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "identifierCellCollection")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceHorizontal = true
        collection.isScrollEnabled = true
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        contentView.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collection.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collection.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
