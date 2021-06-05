//
//  Popover.swift
//  UserModule
//
//  Created by Fara Yan on 4/14/21.
//

import PlaygroundSupport
import AVFoundation
import UIKit
import Foundation

public class Popover: UIView, UIGestureRecognizerDelegate{
    public var x_pos = 0
    public var y_pos = 0
    public var step = 0
    public var filling = 0
    public var addition = 0
    
    var showImage = UIImageView()
    var showImageTitleLabel = UILabel()
    var showImageLabel = UILabel()
    
    public init(x: Int, y: Int) {
        super.init(frame: .zero)
        x_pos = x
        y_pos = y
        self.setupView()
        self.isUserInteractionEnabled = true;
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func forGoldenSyrup(){
        step = 0
        showImageTitleLabel.text = "Golden Syrup"
        showImageLabel.text = "A thick, smooth golden-colored syrup made with sugar, water, and citric acid"
    }
    
    public func forVegetableOil(){
        step = 1
        showImageTitleLabel.text = "Vegetable Oil"
        showImageLabel.text = "An oil derived from plants (Common types include soybean and corn oil)"
    }
    
    public func forLyeWater(){
        step = 2
        showImageTitleLabel.text = "Lye Water"
        showImageLabel.text = "A food grade potassium carbonate solution used to neutralize acidity"
    }
    
    public func forCakeFlour(){
        step = 3
        showImageTitleLabel.text = "Cake Flour"
        showImageLabel.text = "A finely ground flour made from soft wheat"
    }
    
    public func forRedBean(){
        filling = 0
        addition = -1
        showImageTitleLabel.text = "Red Bean Paste"
        showImageLabel.text = "A sweet red paste containing red beans"
    }
    
    public func forLotusSeed(){
        filling = 1
        addition = -1
        showImageTitleLabel.text = "Lotus Seed Paste"
        showImageLabel.text = "A luxurious paste made from dried lotus seeds"
    }
    
    public func forJujube(){
        filling = 2
        addition = -1
        showImageTitleLabel.text = "Jujube Paste"
        showImageLabel.text = "A fruity paste made from ripe jujube plants"
    }
    
    public func forFiveKernels(){
        filling = 3
        addition = -1
        showImageTitleLabel.text = "Five Kernels"
        showImageLabel.text = "A filling containing 5 types of nuts and seeds in maltose syrup"
    }
    
    public func forEggYolk(){
        addition = 0
        filling = -1
        showImageTitleLabel.text = "Salted Egg Yolk"
        showImageLabel.text = "A salted duck egg yolk representing the full moon"
    }
    
    public func forCustard(){
        addition = 1
        filling = -1
        showImageTitleLabel.text = "Custard"
        showImageLabel.text = "A sweet yellow sauce made from milk and eggs"
    }
    
    public func forNone(){
        addition = 2
        filling = -1
        showImageTitleLabel.text = "None"
        showImageLabel.text = "Zero. Nada. Zilch."
    }
    
    public func setPosition(x: Int, y: Int){
        x_pos = x
        y_pos = y
    }
    
    func setupView(){
        //Add background view
        showImage.frame = CGRect(x: x_pos, y: y_pos, width: 293, height: 220)
        showImage.image = UIImage(named: "popup")
        showImage.isHidden = false
        self.addSubview(showImage)
        showImage.contentMode = .scaleAspectFit
        showImage.translatesAutoresizingMaskIntoConstraints = true

        showImageTitleLabel.frame = CGRect(x: x_pos+20, y: y_pos+30, width: 250, height: 50)
        showImageTitleLabel.text = "Golden Syrup"
        showImageTitleLabel.font = UIFont(name:"MikadoBold", size:30)
        showImageTitleLabel.textColor = #colorLiteral(red: 1.0045443773269653, green: 0.5785312652587891, blue: 0.13649874925613403, alpha: 1.0)
        showImageTitleLabel.isHidden = false
        self.addSubview(showImageTitleLabel)
        showImageTitleLabel.translatesAutoresizingMaskIntoConstraints = true

        showImageLabel = UILabel(frame: CGRect(x: x_pos+20, y: y_pos+10, width: 250, height: 200))
        showImageLabel.isHidden = false
        showImageLabel.text = "This is an ingredient that is super cool and it is golden. Wow this is awesome."
        showImageLabel.font = UIFont(name:"MikadoMedium", size:20)
        showImageLabel.numberOfLines = 0
        showImageLabel.contentMode = .scaleAspectFit
        self.addConstraint(NSLayoutConstraint(item: showImageLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        self.addSubview(showImageLabel)
        
    }
}
