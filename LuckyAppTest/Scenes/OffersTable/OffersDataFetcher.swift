//
//  OffersDataFetcher.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

protocol OffersDataFetcherDelegate : class {
    
    func successRequest(sections: [Section], title : String)
    func error(_ error : ErrorData)
}

protocol OffersDataFetcher {
    
    func fetchOffers()
    var delegate : OffersDataFetcherDelegate? { get set }
}

class OffersDataFetcherImp : OffersDataFetcher {
    
    let urlBase = "www.nasable.com"
    let endPoint = "/luckytest/api/offers/"
    
    weak var delegate : OffersDataFetcherDelegate?
    
    open func fetchOffers() {
        let restClient = RestClientService(urlBase: urlBase, scheme: .https)
        restClient.dataRequest(endpoint: endPoint,
                               method: .GET,
                               returnType: OffersResponse.self,
                               completionHandler: { [weak self] response in
                                self?.delegate?.successRequest(sections: response.sections,
                                                               title: response.title)
                               },
                               errorHandler: {[weak self] error in
                                self?.delegate?.error(error)
                               })
    }
    
    
    
}
