//
//  ViewController.swift
//  FurnitureAR
//
//  Created by sameeramjad.
//  Copyright © 2022 sameeramjad. All rights reserved.
//

import UIKit

class FurnitureTVC: UICollectionViewCell{
    @IBOutlet weak var furnitureImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var heartimg: UIButton!
    @IBOutlet weak var cartimg: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arBtn: UIButton!
    @IBOutlet weak var heartbtn: UIButton!
    @IBOutlet weak var lineview: UIView!
    
    
}

protocol TypeDelegate
{
    func objectType(desc : String)
}

class ModalViewController: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate : TypeDelegate?
    var check1 = 0
    var check2 = 0
    var check3 = 0
    var check4 = 0
    @IBOutlet weak var product: UICollectionView!
    
    let desc = ["Sofa", "Dragon", "Table", "Chair","..."]
    let price = ["RS-50000", "RS-8000", "RS-2000", "RS-4500","..."]
    let img = ["blacksofa.jpg", "dragon.jpg", "table.jpg", "chair.jpg" , "121"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return desc.count
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "furniture", for: indexPath) as! FurnitureTVC
        if indexPath.row == 4
        {
            cell.heartimg.isHidden = true
            cell.priceLabel.isHidden = true
            cell.descriptionLabel.isHidden = true
            cell.arBtn.isHidden = true
            cell.cartimg.isHidden = true
            cell.lineview.isHidden = true
        }
        else
        {
            cell.lineview.isHidden = false
            cell.descriptionLabel.isHidden = false
            cell.arBtn.isHidden = false
            cell.heartimg.isHidden = false
            cell.priceLabel.isHidden = false
            cell.cartimg.isHidden = false
        }
        if check1 == 0 && indexPath.row == 0
        {
            cell.heartimg.tintColor = UIColor(hexString: "000000")
            print("ali")
        }
        else if check1 == 1 && indexPath.row == 0
        {
            cell.heartimg.tintColor = UIColor(hexString: "E95363")
            print("sameer")
            
        }
        
    
        cell.descriptionLabel.text = desc[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
        cell.furnitureImage.image = UIImage(named: img[indexPath.row])
        cell.arBtn.tag = indexPath.row
        cell.arBtn.addTarget(self, action:#selector(arBtnPressed(sender:)), for: .touchUpInside)
        cell.heartbtn.tag = indexPath.row
        cell.heartbtn.addTarget(self, action:#selector(heartPressed(sender:)), for: .touchUpInside)
        cell.cartimg.addTarget(self, action:#selector(cartPressed(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func arBtnPressed(sender : UIButton) {
        delegate?.objectType(desc: desc[sender.tag])
        self.removeAnimate()
    }
    @objc func heartPressed(sender : UIButton) {
        
//        if check1 == 0
//        {
//            check1 = 1
//        }
//        else
//        {
//            check1 = 0
//        }
//        self.product.reloadData()
//
        showTool(msg: "Coming Soon", state: .error)
    }
    @objc func cartPressed(sender : UIButton) {
        
        showTool(msg: "Coming Soon", state: .error)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        product.delegate = self
        product.dataSource = self
        self.showAnimate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController{
            if let PassedData = sender as? String{
                destination.object = PassedData
            }
        }
    }
    
}
