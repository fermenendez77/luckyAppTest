//
//  OfferDetailPresenter.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 11/10/2020.
//

import Foundation

protocol OfferDetailPresenter {
    
    init(view: OfferDetailView, dataFetcher: OfferDetailDataFetcher )
    func viewDidLoad()
    var offerDetail : OfferDetail? {get set}
}

class OfferDetailPresenterImp : OfferDetailPresenter {
    
    var offerDetail: OfferDetail?
    var imageQueue : OperationQueue = OperationQueue()
    
    weak var view : OfferDetailView?
    var dataFetcher : OfferDetailDataFetcher
    
    required init(view: OfferDetailView, dataFetcher: OfferDetailDataFetcher) {
        self.view = view
        self.dataFetcher = dataFetcher
        self.dataFetcher.delegate = self
    }
    
    
    func viewDidLoad() {
        view?.showLoading()
        dataFetcher.fetchOfferDetail()
    }
    
    func configureLayout() {
        view?.configure(brand: offerDetail?.brand)
        view?.configure(favsCounter: offerDetail?.favoriteCount)
        view?.configure(title: offerDetail?.title)
        view?.configure(description: offerDetail?.offerDetailDescription)
        view?.configure(oldPrice: offerDetail?.price.old)
        view?.configure(newPrice: offerDetail?.price.new)
        view?.configure(expiration: offerDetail?.expiration)
        view?.configure(redeptionCap: offerDetail?.redemptionsCap)
        
        guard let offerDetail = offerDetail,
              let url = URL(string: offerDetail.imageURL) else {
            return
        }
        
        let imageOperation = ImageDownloaderOperation(withURL: url)
        imageOperation.completionBlock = { [weak self] in
            DispatchQueue.main.async {
                self?.view?.configure(offerImage: imageOperation.image)
            }
        }
        imageQueue.addOperation(imageOperation)
        view?.hideLoading()
    }
}

extension OfferDetailPresenterImp : OffersDetailFetcherDelegate {
    
    func successRequest(response offerDetail: OfferDetail) {
        self.offerDetail = offerDetail
        configureLayout()
    }
    
    func error(error: ErrorData) {
        view?.hideLoading()
        view?.showError()
    }
    
}
