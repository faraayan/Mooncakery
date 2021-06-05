//
//  FariyLights.swift
//  mooncakery.d
//
//  Created by Fara Yan on 4/18/21.
//

import UIKit
import PlaygroundSupport



public class FairyLights: UIView {
    public init() {
        super.init(frame: .zero)
        //Add title label
        let titleLabel = UILabel(frame: CGRect(x: 170, y: 120, width: UIScreen.main.bounds.width, height: 150))
        titleLabel.text = "Shape the Mooncake"
        titleLabel.font = titleLabel.font.withSize(50.0)
        titleLabel.contentMode = .scaleAspectFit
        self.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        self.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
