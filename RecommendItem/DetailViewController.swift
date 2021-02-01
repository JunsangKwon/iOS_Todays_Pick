//
//  DetailViewController.swift
//  RecommendItem
//
//  Created by 권준상 on 2021/02/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let iteminfo = viewModel.itemInfo {
            itemImage.image = iteminfo.img
            priceLabel.text = "\(iteminfo.price)"
            nameLabel.text = iteminfo.name
            descriptionLabel.text = iteminfo.descript
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }    

}

class DetailViewModel {
    var itemInfo: ItemInfo?
    
    func update(model: ItemInfo?) {
        itemInfo = model
    }
}
