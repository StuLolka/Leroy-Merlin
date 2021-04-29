//
//  StructProductsCell.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 21.04.2021.
//

import UIKit

public class Product {
    public let image: UIImage?
    public let price: String?
    public let description: String?
    
    init(image: UIImage?, price: String?, description: String?) {
        self.image = image
        self.price = price
        self.description = description
    }
}
