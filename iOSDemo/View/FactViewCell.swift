//
//  FactViewCell.swift
//  iOSDemo
//
//  Created by Apple on 30/06/22.
//

import UIKit

class FactViewCell: UITableViewCell {
    var imgView     = UIImageView();
      var lblTitle = UILabel();
      var lblDescription  = UILabel();
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            imgView.contentMode = .scaleAspectFit
            imgView.clipsToBounds = true
        imgView.layer.borderWidth = 1
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        imgView.backgroundColor = .black

        lblTitle.font = UIFont.boldSystemFont(ofSize: 18)
        lblTitle.textColor = .systemBlue
        
        lblDescription.numberOfLines = 0
        lblDescription.textColor = .secondaryLabel
        
            contentView.addSubview(imgView)
            contentView.addSubview(lblTitle)
            contentView.addSubview(lblDescription)

        imgView.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        
        
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        
        lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true

        lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 10).isActive = true
        lblDescription.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        lblDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        let c1 = NSLayoutConstraint(item: lblDescription, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        c1.isActive = true
        
        
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
