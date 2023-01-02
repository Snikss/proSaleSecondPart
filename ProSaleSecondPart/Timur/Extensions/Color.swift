//
//  Color.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 23.12.2022.
//

import Foundation
import UIKit

@objc public class Color: NSObject {
    @objc public static let whiteDarkest = UIColor(hexString: "#F2F2F3")
    @objc public static let bluePrimary = UIColor(hexString: "#2A81DD")
    @objc public static let grayLightest = UIColor(hexString: "#d4d4da")
    @objc public static let gray = UIColor(hexString: "#888b94")
    @objc public static let blueLighter = UIColor(hexString: "#D6ECFB")
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
