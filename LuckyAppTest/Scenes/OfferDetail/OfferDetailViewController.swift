//
//  OfferDetailViewController.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbarButtons()
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
