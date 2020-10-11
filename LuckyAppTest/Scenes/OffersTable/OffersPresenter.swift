//
//  OffersPresenter.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

protocol OffersPresenter {
    
    init(view : OffersView, dataFetcher : OffersDataFetcherImp)
    
    func viewDidLoad()
    func offerSelected(at indexPath : IndexPath)
    func configure(cell : OfferTableViewCell, at indexPath : IndexPath)
    func configure(header : OfferHeaderTableView, in section : Int)
    var sections : [Section] {get set}
}

class OffersPresenterImp : OffersPresenter {
   
    weak var view : OffersView?
    let dataFetcher : OffersDataFetcher
    
    var sections: [Section] = []
    
    required init(view: OffersView, dataFetcher: OffersDataFetcherImp = OffersDataFetcherImp()) {
        self.view = view
        self.dataFetcher = dataFetcher
        dataFetcher.delegate = self
    }
    
    func viewDidLoad() {
        dataFetcher.fetchOffers()
    }
    
    func offerSelected(at indexPath: IndexPath) {
        
    }
    
    func configure(cell: OfferTableViewCell, at indexPath: IndexPath) {
        let offer = sections[indexPath.section].items[indexPath.row]
        cell.configure(title: offer.title)
        cell.configure(brand: offer.brand)
        cell.configure(favCount: offer.favoriteCount)
        cell.configure(tags: offer.tags)
    }
    
    func configure(header: OfferHeaderTableView, in section: Int) {
        let sectionModel = sections[section]
        header.configure(title: sectionModel.title)
    }
    
}

extension OffersPresenterImp : OffersDataFetcherDelegate {
    
    func successRequest(sections: [Section], title: String) {
        self.sections = sections
        view?.configure(title: title)
        view?.showData()
    }
    
    func error(_ error: ErrorData) {
        
    }
    
    
}
