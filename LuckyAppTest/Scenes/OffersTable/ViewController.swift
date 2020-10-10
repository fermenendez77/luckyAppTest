//
//  ViewController.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import UIKit

protocol OffersView : class {
    
    func showData()
    func showLoading()
    func hideLoading()
    func offerSelected()
}

class ViewController: UIViewController {
    
    var presenter : OffersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OffersPresenterImp(view: self)
        configureNavbar()
        presenter?.viewDidLoad()
    }

    func configureNavbar() {
        //navigationController?.navigationBar.prefersLargeTitles = true
        title = "Offers"
    }
}

extension ViewController : OffersView {
    
    func showData() {
            
    }
    
    func showLoading() {
            
    }
    
    func hideLoading() {
            
    }
    
    func offerSelected() {
        
    }
    
}

