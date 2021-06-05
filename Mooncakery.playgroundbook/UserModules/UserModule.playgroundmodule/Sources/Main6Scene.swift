//
//  Main6Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/18/21.
//

import UIKit
import PlaygroundSupport

public class Main6Scene: UIViewController {
    var backgroundImageView = UIImageView()
    var mooncake = UIButton()
    var moon = UIButton()
    var lantern = UIButton()
    var lantern2 = UIButton()
    var chosenFilling: String? = nil
    var chosenAddition: String? = nil
    var chosenShape: String? = nil
    var starView = UIImageView()
    var cloud1 = UIImageView()
    var cloud2 = UIImageView()
    var cloud3 = UIImageView()
    var cloud4 = UIImageView()
    var fairyLights = UIImageView()
    
    func setDataValues(){
        if let keyValue = PlaygroundKeyValueStore.current["filling"],
            case .string(let fillingType) = keyValue {
            chosenFilling = fillingType
        }

        if let keyValue = PlaygroundKeyValueStore.current["addition"],
            case .string(let additionType) = keyValue {
            chosenAddition = additionType
        }
        
        if let keyValue = PlaygroundKeyValueStore.current["shape"],
            case .string(let shapeType) = keyValue {
            chosenShape = shapeType
        }

        if chosenAddition == nil{
            chosenAddition = "0"
        }
        if chosenFilling == nil{
            chosenFilling = "0"
        }
        if chosenShape == nil{
            chosenShape = "1"
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setDataValues()
        
        //setTemp
        mooncake.setImage(UIImage(named: "shape\(Int(self.chosenShape!) ?? 1)b"), for: .normal)
        mooncake.contentMode = .scaleAspectFit
        //mooncake.addTarget(self, action: #selector(mooncake), for: .touchUpInside)
        view.addSubview(mooncake)
        
        moon.setImage(UIImage(named: "moon"), for: .normal)
        moon.contentMode = .scaleAspectFit
        //moon.addTarget(self, action: #selector(moon), for: .touchUpInside)
        view.addSubview(moon)
        
        fairyLights.image = UIImage(named: "fairylightDouble")
        view.addSubview(fairyLights)
        
        lantern.setImage(UIImage(named: "lantern1-1"), for: .normal)
        lantern.contentMode = .scaleAspectFit
        //lantern.addTarget(self, action: #selector(lantern), for: .touchUpInside)
        view.addSubview(lantern)
        view.bringSubviewToFront(lantern)
        
        lantern2.setImage(UIImage(named: "lantern2-1"), for: .normal)
        lantern2.contentMode = .scaleAspectFit
        //lantern.addTarget(self, action: #selector(lantern), for: .touchUpInside)
        view.addSubview(lantern2)
        view.bringSubviewToFront(lantern2)
        
        cloud1.image = UIImage(named: "cloud1")
        cloud1.contentMode = .scaleAspectFit
        view.addSubview(cloud1)
        view.sendSubviewToBack(cloud1)
        
        cloud2.image = UIImage(named: "cloud2")
        cloud2.contentMode = .scaleAspectFit
        view.addSubview(cloud2)
        view.sendSubviewToBack(cloud2)
        
        cloud3.image = UIImage(named: "cloud3")
        cloud3.contentMode = .scaleAspectFit
        view.addSubview(cloud3)
        view.sendSubviewToBack(cloud3)
        
        cloud4.image = UIImage(named: "cloud4")
        cloud4.contentMode = .scaleAspectFit
        view.addSubview(cloud4)
        view.sendSubviewToBack(cloud4)
        
        addStarryBackground()
        addStarryBackground()
        addStarryBackground()
        
        backgroundImageView.frame = .zero
        backgroundImageView.image = UIImage(named: "main6bkg1")
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        
        let cloudRotation = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudRotation.keyTimes = [0,0.3,0.7, 0.8, 1.0]
        cloudRotation.values = [1.0, 0.9, 1.1, 0.9, 1.0]
        cloudRotation.duration = CFTimeInterval(Int.random(in: 15...30))
        cloudRotation.repeatCount = Float.infinity
        cloud1.layer.add(cloudRotation, forKey: "transform.scale")
        
        let cloudRotation2 = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudRotation2.keyTimes = [0,0.3, 0.5,0.9, 1.0]
        cloudRotation2.values = [1.0, 0.8, 1.1, 1.2, 1.0]
        cloudRotation2.duration = CFTimeInterval(Int.random(in: 16...35))
        cloudRotation2.repeatCount = Float.infinity
        cloud2.layer.add(cloudRotation2, forKey: "transform.scale")
        
        let cloudRotation3 = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudRotation3.keyTimes = [0,0.3, 0.6,0.8, 1.0]
        cloudRotation3.values = [1.0, 0.9, 1.2, 0.7, 1.0]
        cloudRotation3.duration = CFTimeInterval(Int.random(in: 16...35))
        cloudRotation3.repeatCount = Float.infinity
        cloud3.layer.add(cloudRotation3, forKey: "transform.scale")
        
        let cloudRotation4 = CAKeyframeAnimation(keyPath: "transform.scale")
        cloudRotation4.keyTimes = [0,0.2, 0.4,0.7, 1.0]
        cloudRotation4.values = [1.0, 0.7, 1.1, 1.3, 1.0]
        cloudRotation4.duration = CFTimeInterval(Int.random(in: 17...40))
        cloudRotation4.repeatCount = Float.infinity
        cloud4.layer.add(cloudRotation4, forKey: "transform.scale")
        
        PlaygroundPage.current.assessmentStatus = .pass(message: "Thank you for joining me today! I hope you learned a lot about mooncakes 💗")
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         
        cloud1.translatesAutoresizingMaskIntoConstraints = false
        cloud1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -200).isActive = true
        cloud1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 250).isActive = true
        cloud1.heightAnchor.constraint(equalToConstant: 673).isActive = true
        cloud1.widthAnchor.constraint(equalToConstant: 900).isActive = true
        
        cloud2.translatesAutoresizingMaskIntoConstraints = false
        cloud2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100).isActive = true
        cloud2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 400).isActive = true
        cloud2.heightAnchor.constraint(equalToConstant: 872).isActive = true
        cloud2.widthAnchor.constraint(equalToConstant: 970).isActive = true
        
        cloud3.translatesAutoresizingMaskIntoConstraints = false
        cloud3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 240).isActive = true
        cloud3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        cloud3.heightAnchor.constraint(equalToConstant: 760).isActive = true
        cloud3.widthAnchor.constraint(equalToConstant: 900).isActive = true
        
        cloud4.translatesAutoresizingMaskIntoConstraints = false
        cloud4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -240).isActive = true
        cloud4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        cloud4.heightAnchor.constraint(equalToConstant: 770).isActive = true
        cloud4.widthAnchor.constraint(equalToConstant: 800).isActive = true
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        mooncake.translatesAutoresizingMaskIntoConstraints = false
        mooncake.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        mooncake.heightAnchor.constraint(equalToConstant: 300).isActive = true
        mooncake.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mooncake.topAnchor.constraint(equalTo: view.topAnchor, constant: 650).isActive = true

        moon.translatesAutoresizingMaskIntoConstraints = false
        moon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120).isActive = true
        moon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        moon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        moon.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        
        lantern.translatesAutoresizingMaskIntoConstraints = false
        lantern.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30).isActive = true
        lantern.heightAnchor.constraint(equalToConstant: 320).isActive = true
        lantern.widthAnchor.constraint(equalToConstant: 160).isActive = true
        lantern.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        lantern2.translatesAutoresizingMaskIntoConstraints = false
        lantern2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        lantern2.heightAnchor.constraint(equalToConstant: 320).isActive = true
        lantern2.widthAnchor.constraint(equalToConstant: 160).isActive = true
        lantern2.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        fairyLights.translatesAutoresizingMaskIntoConstraints = false
        fairyLights.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        fairyLights.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        fairyLights.heightAnchor.constraint(equalToConstant: 357).isActive = true
        fairyLights.widthAnchor.constraint(equalToConstant: 850).isActive = true
    }
    
    func lanternAnimate(){

    }
    
    func addStarryBackground(){
        let star = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star)
        let star1 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star1)
        let star2 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star2)
        let star3 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star3)
        let star4 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star4)
        let star5 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star5)
        let star6 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star6)
        let star7 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star7)
        let star8 = Star(x: Int.random(in: 10...720), y: Int.random(in: 10...650), width: Int.random(in: 4...12))
        view.addSubview(star8)
        view.sendSubviewToBack(star)
        view.sendSubviewToBack(star1)
        view.sendSubviewToBack(star2)
        view.sendSubviewToBack(star3)
        view.sendSubviewToBack(star4)
        view.sendSubviewToBack(star5)
        view.sendSubviewToBack(star6)
        view.sendSubviewToBack(star7)
        view.sendSubviewToBack(star8)
    }
    
}
