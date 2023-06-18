//
//  UIImageView+Extension.swift
//  DStoreApp
//
//  Created by Caio Cardozo on 15/06/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }

        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
    func loadFromq(URLAddress: String) {
        if let url = URL(string: URLAddress) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          // Error handling...
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
    
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
