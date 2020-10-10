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
    func configure(title : String)
}

class OffersTableViewController: UIViewController {
    
    var presenter : OffersPresenter?
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter = OffersPresenterImp(view: self)
        presenter?.viewDidLoad()
    }
    
    func configureTableView() {
        tableView.separatorStyle = .none
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }

}

extension OffersTableViewController : OffersView {
    
    func configure(title: String) {
        self.title = title
    }
    
    func showData() {
        tableView.reloadData()
    }
    
    func showLoading() {
            
    }
    
    func hideLoading() {
            
    }
    
    func offerSelected() {
        
    }
}

extension OffersTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114.0
    }
}

extension OffersTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.sections[section].items.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OfferTableViewCell
        presenter?.configure(cell: cell, at: indexPath)
        return cell
    }
    
    
}

