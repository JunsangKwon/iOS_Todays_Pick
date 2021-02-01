//
//  ItemList.swift
//  RecommendItem
//
//  Created by 권준상 on 2021/02/01.
//

import UIKit

class ItemInfo: NSObject {
    let price: Int;
    let name: String;
    let imgname: String;
    let descript: String;
    
    var img: UIImage? {
        return UIImage(named: "\(imgname).jpeg")
    }
    
    init(price: Int, name: String, imgname: String, descript: String) {
        self.price = price
        self.name = name
        self.imgname = imgname
        self.descript = descript
    }
}

