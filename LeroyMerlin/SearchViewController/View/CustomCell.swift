//
//  CustomCellCollectionView.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 21.04.2021.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    private let heightView = SearchViewController.searchView?.frame.height ?? 667
    
    public let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public let priceLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.9
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: heightView / 40)
        descriptionLabel.font = UIFont.systemFont(ofSize: heightView / 52)
        
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        addConstraints()
    }
    
    public func addConstrainsImageView() {
        addSubview(imageView)
        NSLayoutConstraint.deactivate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: heightView / 45),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -heightView / 45),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    public func addConstrainsImageViewForCatalog() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant:  5),
            priceLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: priceLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
            
        ])
    }
    
    
}
