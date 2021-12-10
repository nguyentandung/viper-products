//
//  ExtensionView.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

extension UIImageView {
    func loadImage(url:URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

