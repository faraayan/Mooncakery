//
//  File.swift
//  UserModule
//
//  Created by Fara Yan on 4/17/21.
//

import PlaygroundSupport
import AVFoundation
import UIKit

public class ViewWithImage: UIView {
    var itemImageView = UIImageView()
    
    public init(imageName: String) {
        super.init(frame: .zero)
        itemImageView.frame = .zero
        itemImageView.image = UIImage(named: imageName)
        self.addSubview(itemImageView)
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: itemImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: itemImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: itemImageView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: itemImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
