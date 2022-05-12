//
//  shoeCell.swift
//  shoesApp
//
//  Created by Mina Namlı on 11.05.2022.
//

import UIKit
import SnapKit


class shoeCell: UITableViewCell {
    
    
    var view : UIView!
    
    let shoeImage : UIImageView = {
       let img = UIImageView()
        img.layer.cornerRadius = 14
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
       return img
    }()
    
    let shoeName : UILabel = {
        let lbl = UILabel()
         lbl.textAlignment = .center
         lbl.font = UIFont.systemFont(ofSize: 15)
         lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl}()
    
//    let shoePrice : UILabel = {
//        lbl.textAlignment = .right
//    }()
//    
    let shoeModelName : UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
       return lbl}()
    

    override func setNeedsUpdateConstraints() {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
