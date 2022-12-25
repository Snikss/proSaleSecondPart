//
//  Model.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import Foundation
import UIKit

struct TypeModel {
    let cabinetType: CabinetType
    let title: String
    let description: String
    let numberOfAdverts: String?
    let needShowButton: Bool?
    let companyLogo: UIImage?
    
    init(cabinetType: CabinetType,
         title: String,
         description: String,
         numberOfAdverts: String? = nil,
         needShowButton: Bool? = nil,
         companyLogo: UIImage? = nil) {
        self.cabinetType = cabinetType
        self.title = title
        self.description = description
        self.numberOfAdverts = numberOfAdverts
        self.needShowButton = needShowButton
        self.companyLogo = companyLogo
    }
}
