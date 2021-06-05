//
//  Star.swift
//  UserModule
//
//  Created by Fara Yan on 4/18/21.
//

import UIKit
import PlaygroundSupport

public class Star: UIView {
    var starView = UIImageView()
    public init(x: Int, y: Int, width: Int) {
        super.init(frame: .zero)
        starView.frame = CGRect(x: x, y: y, width: width, height: width)
        starView.image = UIImage(named: "whiteStar")
        let randomNum = Int.random(in: 1...3)
        if randomNum == 1{
            starView.image = UIImage(named: "whiteStar")
        } else if randomNum == 2{
            starView.image = UIImage(named: "yellowerStar")
        } else if randomNum == 3{
            starView.image = UIImage(named: "yellowStar")
        }
        self.addSubview(starView)
        self.addConstraint(NSLayoutConstraint(item: starView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        
        let starRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        starRotation.keyTimes = [0,0.3,1]
        starRotation.values = [0, Double.pi * Double(Int.random(in: 1...3)), Double.pi * Double(Int.random(in: 1...3))]
        starRotation.duration = CFTimeInterval(Int.random(in: 5...12))
        starRotation.repeatCount = Float.infinity
        starView.layer.add(starRotation, forKey: "transform.rotation")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
