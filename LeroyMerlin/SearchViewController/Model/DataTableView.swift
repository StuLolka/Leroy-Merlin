//
//  DataTableView.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 20.04.2021.
//

import UIKit

final public class DataTableView {
    
    
    public let catalogDataArray = [ Product(image: UIImage(named: "catalog"), price: nil, description: nil),
                                    Product(image: UIImage(named: "catalog1"), price: nil, description: nil),
                                    Product(image: UIImage(named: "catalog2"), price: nil, description: nil),
                                    Product(image: UIImage(named: "catalog4"), price: nil, description: nil),
                                    Product(image: UIImage(named: "catalogAll"), price: nil, description: nil)]
    
    public let limitedOfferDataArray = [Product(image: UIImage(named: "limitedOffer1"), price: "930,60 ₽/кор.", description: "Ламинат Artens \"Тангай\" 33 класс толщина 8 мм 1.986 м"),
                                        Product(image: UIImage(named: "limitedOffer2"), price: "7 788 ₽/шт.", description: "")]
    
    public let bestPriceDataArray = [Product(image: UIImage(named: "bestPrice1"), price: "Цена товара 1", description: "Описание товара 1"),
                                     Product(image: UIImage(named: "bestPrice2"), price: "Цена товара 2", description: "Описание товара 2"),
                                     Product(image: UIImage(named: "bestPrice3"), price: "Цена товара 3", description: "Описание товара 3"),
                                     Product(image: UIImage(named: "bestPrice4"), price: "Цена товара 4", description: "Описание товара 4"),]
}
