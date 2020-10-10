//
//  OffersDataFetcher.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation

protocol OffersDataFetcherDelegate : class {
    
    func successRequest(with : [Section], title : String)
    func error(_ error : ErrorData)
}

protocol OffersDataFetcher {
    
    func fetchOffers()
}

class OffersDataFetcherImp : OffersDataFetcher {
    
    let urlBase = "www.nasable.com"
    let endPoint = "/luckytest/api/offers/"
    
    weak var delegate : OffersDataFetcherDelegate?
    
    func fetchOffers() {
        let restClient = RestClientService(urlBase: urlBase, scheme: .https)
        restClient.dataRequest(endpoint: endPoint,
                               method: .GET,
                               returnType: OffersResponse.self,
                               completionHandler: { [weak self] response in
                                self?.delegate?.successRequest(with: response.sections,
                                                               title: response.title)
                               },
                               errorHandler: {[weak self] error in
                                self?.delegate?.error(error)
                               })
    }
    
    
    
}
