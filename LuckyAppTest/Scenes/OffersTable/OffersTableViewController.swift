//
//  ViewController.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import UIKit

protocol OffersView : class {
    
    func showErrorAlert()
    func showData()
    func showLoading()
    func hideLoading()
    func presentDetailScene(with dataFetcher : OfferDetailDataFetcher)
    func configure(title : String)
    func reloadCell(at indexPath : IndexPath)
}

class OffersTableViewController: UIViewControllerDialogBehaviours {
    
    var presenter : OffersPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.viewDidLoad()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "OfferTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
        tableView.register(OfferHeaderTableView.self,
                                forHeaderFooterViewReuseIdentifier:"headerTitleView")
    }

}

extension OffersTableViewController : OffersView {
    
    func showErrorAlert() {
        func showError() {
            onErrorMessageClosed = { [weak self] in
                self?.navigationController?.dismiss(animated: true, completion: nil)
            }
            present(errorAlert, animated: true, completion: {})
        }
    }
    
    
    func presentDetailScene(with dataFetcher : OfferDetailDataFetcher) {
        let offerDetailVC = OfferDetailViewController()
        let presenter = OfferDetailPresenterImp(view: offerDetailVC, dataFetcher: dataFetcher)
        offerDetailVC.presenter = presenter
        navigationController?.pushViewController(offerDetailVC, animated: true)
    }
    
    
    func configure(title: String) {
        self.title = title
    }
    
    func showData() {
        tableView.reloadData()
    }
    
    func showLoading() {
        present(fetchingDataAlert, animated: true, completion: nil)
    }
    
    func hideLoading() {
        fetchingDataAlert.dismiss(animated: true, completion: nil)
    }
    
    func reloadCell(at indexPath : IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension OffersTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.offerSelected(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerTitleView")
                as? OfferHeaderTableView
        else {
            return nil
        }
        
        presenter?.configure(header: view, in: section)
        
        return view
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 104.0
    }
}


