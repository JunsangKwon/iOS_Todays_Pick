//
//  ViewController.swift
//  RecommendItem
//
//  Created by 권준상 on 2021/02/01.
//

import UIKit

let viewModel = ItemListViewModel()

class ItemViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let iteminfo = viewModel.getInfo(index: index)
                vc?.viewModel.update(model: iteminfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfitem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let iteminfo = viewModel.getInfo(index: indexPath.item)
        cell.updateUI(itemInfo: iteminfo)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemspacing: CGFloat = 3
        let textAreaHeight: CGFloat = 70
        let width: CGFloat = (collectionView.bounds.width/3)-itemspacing*3
        let height: CGFloat = width*10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ItemHeaderView", for: indexPath) as? ItemHeaderView else {
            return UICollectionReusableView()
        }
        
        return header
    }

}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let viewModel = ItemListViewModel()
    
    func updateUI(itemInfo: ItemInfo) {
        itemImage.image = itemInfo.img
        priceLabel.text = "\(itemInfo.price)"
        nameLabel.text = itemInfo.name
    }
}

class ItemListViewModel {
    let itemList: [ItemInfo] = [
        ItemInfo(price: 120000, name: "애플워치 3세대", imgname: "appleWatch", descript: "애플워치 3세대이고 애플 정품입니다."),
        ItemInfo(price: 70000, name: "목도리", imgname: "scarf", descript: "jw앤더슨 목도리입니다."),
        ItemInfo(price: 100000, name: "삼국지 60권", imgname: "samgookji.jpeg", descript: "만화 삼국지 1권~60권 팝니다."),
        ItemInfo(price: 30000, name: "게이밍 마우스", imgname: "mouse", descript: "AMD 게이밍 마우스입니다."),
        ItemInfo(price: 250000, name: "Canon 700D", imgname: "dslr", descript: "Canon 700D DSLR 팝니다. 메모리카드는 16G입니다."),
        ItemInfo(price: 150000, name: "무탠다드 더플코트", imgname: "coat", descript: "무신사 스탠다드 캐시미어 블렌드 더플 코트입니다."),
        ItemInfo(price: 30000, name: "릴 하이브리드", imgname: "lilHybrid", descript: "릴 하이브리드 1세대 팝니다."),
        ItemInfo(price: 70000, name: "iab studio 옷", imgname: "iab", descript: "iab studio 회색 롱슬리브 판매합니다."),
        ItemInfo(price: 100000, name: "아이폰 6s", imgname: "iPhone", descript: "아이폰 6s 128G 판매합니다."),
        ItemInfo(price: 300000, name: "덩크 로우 범고래", imgname: "dunkLow", descript: "나이키 덩크 로우 레트로 275mm 판매합니다."),
    ]
    
    var numOfitem: Int {
        return itemList.count
    }
    
    func getInfo(index: Int) -> ItemInfo {
        return itemList[index]
    }
    
}

class ItemHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
