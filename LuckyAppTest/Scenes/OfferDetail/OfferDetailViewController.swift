//
//  OfferDetailViewController.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import UIKit

protocol OfferDetailView : class {
    
    func configure(offerImage : UIImage?)
    func configure(brand : String?)
    func configure(favsCounter : Int?)
    func configure(title : String?)
    func configure(description : String?)
    func configure(oldPrice : String?)
    func configure(newPrice : String?)
    func configure(expiration : String?)
    func configure(redeptionCap : String?)
}

class OfferDetailViewController: UIViewController {

    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var redeptionCapsLabel: UILabel!
    
    var presenter : OfferDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbarButtons()
        presenter?.viewDidLoad()
    }
    
    func configureNavbarButtons() {
        var favsIcon = UIImage(named: "favs")
        favsIcon = favsIcon?.withRenderingMode(.alwaysOriginal)
        let favsButton = UIBarButtonItem(image: favsIcon, style:.plain, target: nil, action: #selector(favsButtonPressed))
        
        var shareIcon = UIImage(named: "share")
        shareIcon = shareIcon?.withRenderingMode(.alwaysOriginal)
        let shareButton = UIBarButtonItem(image: shareIcon, style:.plain, target: nil, action: #selector(shareButtonPressed))
        
        self.navigationItem.rightBarButtonItems = [shareButton, favsButton]
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func favsButtonPressed() {
        
    }
    
    @objc func shareButtonPressed() {
        
    }
}

extension OfferDetailViewController : OfferDetailView {
    
    func configure(offerImage: UIImage?) {
        let image = offerImage ?? UIImage(named: "image-placeholder")
        offerImageView.image = image
    }
    
    func configure(brand: String?) {
        let brand = brand ?? ""
        brandLabel.text = brand.uppercased()
    }
    
    func configure(favsCounter: Int?) {
        
        let favCount = favsCounter ?? 0
        
        let imageAttachment = NSTextAttachment()
        
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "heart.fill", withConfiguration: smallConfiguration)
        image?.withTintColor(#colorLiteral(red: 0.4425225556, green: 0.5315181017, blue: 0.5904234052, alpha: 1), renderingMode: .alwaysOriginal)
        imageAttachment.image = image
        
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: " \(favCount)"))
        likesLabel.attributedText = fullString
    }
    
    func configure(title: String?) {
        let title = title ?? ""
        titleLabel.text = title
    }
    
    func configure(description: String?) {
        let description = description ?? ""
        descriptionLabel.text = description
    }
    
    func configure(oldPrice: String?) {
        if let oldPrice = oldPrice {
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: oldPrice)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                             value: 2, range: NSMakeRange(0, attributeString.length))
            oldPriceLabel.attributedText = attributeString
        } else {
            oldPriceLabel.text = ""
        }

    }
    
    func configure(newPrice: String?) {
        let newPrice = newPrice ?? ""
        priceLabel.text = newPrice
    }
    
    func configure(expiration: String?) {
        let expiration = expiration ?? ""
        expirationLabel.text = expiration
    }
    
    func configure(redeptionCap: String?) {
        let redeptionCap = redeptionCap?.uppercased() ?? ""
        redeptionCapsLabel.text = "REDEPTION CAP : \(redeptionCap)"
    }
    
    
   
    
}
