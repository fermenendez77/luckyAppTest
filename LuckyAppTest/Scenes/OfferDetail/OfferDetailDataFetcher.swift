//
//  OfferDetailDataFetcher.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 11/10/2020.
//

import Foundation

protocol OffersDetailFetcherDelegate : class {
    
    func successRequest(response offerDetail : OfferDetail)
    func error(error : ErrorData)
}

protocol OfferDetailDataFetcher {
    
    init(url : String)
    func fetchOfferDetail()
    var delegate : OffersDetailFetcherDelegate? { get set }
}


class OfferDetailDataFetcherImp : OfferDetailDataFetcher {
    
    let urlBase = "www.nasable.com"
    let endPoint : String
    
    weak var delegate : OffersDetailFetcherDelegate?
    
    required init(url : String) {
        let offerURL = URL(string: url)!
        self.endPoint = offerURL.path
    }
    
    func fetchOfferDetail() {
        let restClient = RestClientService(urlBase: urlBase, scheme: .https)
        restClient.dataRequest(endpoint: endPoint,
                               method: .GET,
                               returnType: OfferDetail.self,
                               completionHandler: { [weak self] response in
                                self?.delegate?.successRequest(response : response)
                               },
                               errorHandler: {[weak self] error in
                                self?.delegate?.error(error :error)
                               })
    }
}
