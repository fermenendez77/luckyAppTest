//
//  UIViewController+Dialogs.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 11/10/2020.
//

import Foundation
import UIKit

class UIViewControllerDialogBehaviours : UIViewController {
    
    lazy var fetchingDataAlert : UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
    
    lazy var errorAlert : UIAlertController = {
        
        let alert = UIAlertController(title: "Error", message: "There is an error Fetching the data", preferredStyle: .alert)
        let action = UIAlertAction(title: "Try Again", style: .default) { [weak self] alert in
            self?.onErrorMessageClosed?()
        }
        alert.addAction(action)
        return alert
    }()
    
    var onErrorMessageClosed : (() -> Void)?
}
