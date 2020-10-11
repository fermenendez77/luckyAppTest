//
//  OfferTableViewCell.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView! {
        didSet {
            mainImageView.layer.cornerRadius = 10.0
            mainImageView.image = UIImage(named: "image-placeholder")
        }
    }
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favsCounterLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    func configure(brand : String) {
        brandLabel.text = brand
    }
    
    func configure(title : String) {
        titleLabel.text = title
    }
    
    func configure(favCount : Int) {
        let imageAttachment = NSTextAttachment()
        
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "heart.fill", withConfiguration: smallConfiguration)
        image?.withTintColor(#colorLiteral(red: 0.4425225556, green: 0.5315181017, blue: 0.5904234052, alpha: 1), renderingMode: .alwaysOriginal)
        imageAttachment.image = image
        
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " \(favCount)"))
        favsCounterLabel.attributedText = fullString
    }
    
    func configure(tags : String?) {
        if let tags = tags {
            tagsLabel.text = tags
        } else {
            tagsLabel.isHidden = true
        }
    }
    
    func configure(image : UIImage) {
        mainImageView.image = image
    }
}
