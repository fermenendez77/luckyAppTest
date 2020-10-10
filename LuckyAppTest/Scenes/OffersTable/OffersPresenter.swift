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
    
}

extension OffersPresenterImp : OffersDataFetcherDelegate {
    
    func successRequest(with: [Section], title: String) {
        
    }
    
    func error(_ error: ErrorData) {
        
    }
    
    
}
