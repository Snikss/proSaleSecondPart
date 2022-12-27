//
//  SellerModel.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import Foundation
import UIKit

struct SellerModel: Decodable {
    let id: Int
    let sellerId: Int
    let title: String
    let subtitle: String
    let advertsCount: String?
    let actionButton: String?
    
    init(id: Int,
         sellerId: Int,
         title: String,
         subtitle: String,
         advertsCount: String? = nil,
         actionButton: String? = nil) {
        self.id = id
        self.sellerId = sellerId
        self.title = title
        self.subtitle = subtitle
        self.advertsCount = advertsCount
        self.actionButton = actionButton
    }
}
