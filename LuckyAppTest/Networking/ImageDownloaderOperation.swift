//
//  ImageDownloaderOperation.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//


import Foundation
import UIKit.UIImage

class ImageDownloaderOperation : Operation {
    
    let url : URL
    var image : UIImage?
    
    init(withURL url : URL) {
        self.url = url
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let imageData = try? Data(contentsOf: url) else {
            self.image = UIImage(named: "image-placeholder")
            return
        }
        
        if isCancelled {
            return
        }
        
        if (!imageData.isEmpty) {
            self.image = UIImage(data: imageData)
        } else {
            self.image = UIImage(named: "image-placeholder")
        }
    }
}
