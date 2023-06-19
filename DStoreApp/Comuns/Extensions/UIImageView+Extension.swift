//
//  UIImageView+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 15/06/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(imageURL: String?) {
        if let imgURL = imageURL {
            if imgURL.isEmpty || imgURL.contains("miss") {
                self.image = UIImage(named: "")
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.sd_setImage(with: URL(string: imgURL), completed: nil)
                }
            }
        } else {
            self.image = UIImage(named: AppConstantsGeneral.placeholderNoPhoto)
        }
    }
}
