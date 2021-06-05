//
//  FairyLight.swift
//  UserModule
//
//  Created by Fara Yan on 4/18/21.
//

import PlaygroundSupport
import UIKit

public class Main0Scene: UIViewController {
    var titleLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var blob1 = UIImageView()
    var blob2 = UIImageView()
    var mooncake = UIButton()
    var moon = UIButton()
    var fairyLights = UIImageView()
    var welcomeLabel = UILabel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "WELCOME TO"
        welcomeLabel.font = UIFont(name:"MikadoBold", size:30)
        welcomeLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        welcomeLabel.contentMode = .scaleAspectFit
        view.addSubview(welcomeLabel)
    
        backgroundView.image = UIImage(named: "main0bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        blob1.image = UIImage(named: "blob1")
        view.addSubview(blob1)
        
        blob2.image = UIImage(named: "blob2")
        view.addSubview(blob2)
        
        titleLabel.text = "Mooncakery"
        titleLabel.font = UIFont(name:"MikadoBlack", size:82)
        titleLabel.textColor = #colorLiteral(red: 1.0079002380371094, green: 0.5658143162727356, blue: 0.2509881556034088, alpha: 1.0)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        mooncake.setImage(UIImage(named: "shape2b"), for: .normal)
        view.addSubview(mooncake)
        
        moon.setImage(UIImage(named: "moon"), for: .normal)
        view.addSubview(moon)
        
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        let blob1Rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        blob1Rotation.keyTimes = [0,1]
        blob1Rotation.values = [0, Double.pi * 2.0]
        blob1Rotation.duration = CFTimeInterval(15)
        blob1Rotation.repeatCount = Float.infinity
        blob1.layer.add(blob1Rotation, forKey: "transform.rotation")
        
        let blob2Rotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        blob2Rotation.keyTimes = [0,1]
        blob2Rotation.values = [0, -1.0 * Double.pi * 2.0]
        blob2Rotation.duration = CFTimeInterval(20)
        blob2Rotation.repeatCount = Float.infinity
        blob2.layer.add(blob2Rotation, forKey: "transform.rotation")
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 295).isActive = true
        
        blob1.translatesAutoresizingMaskIntoConstraints = false
        blob1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blob1.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        blob1.heightAnchor.constraint(equalToConstant: 400).isActive = true
        blob1.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        blob2.translatesAutoresizingMaskIntoConstraints = false
        blob2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blob2.topAnchor.constraint(equalTo: view.topAnchor, constant: 405).isActive = true
        blob2.heightAnchor.constraint(equalToConstant: 620).isActive = true
        blob2.widthAnchor.constraint(equalToConstant: 620).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 330).isActive = true
        
        mooncake.translatesAutoresizingMaskIntoConstraints = false
        mooncake.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mooncake.heightAnchor.constraint(equalToConstant: 270).isActive = true
        mooncake.widthAnchor.constraint(equalToConstant: 270).isActive = true
        mooncake.topAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
        
        moon.translatesAutoresizingMaskIntoConstraints = false
        moon.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 105).isActive = true
        moon.heightAnchor.constraint(equalToConstant: 220).isActive = true
        moon.widthAnchor.constraint(equalToConstant: 220).isActive = true
        moon.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        fairyLights.translatesAutoresizingMaskIntoConstraints = false
        fairyLights.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        fairyLights.heightAnchor.constraint(equalToConstant: 130).isActive = true
        fairyLights.widthAnchor.constraint(equalToConstant: 770).isActive = true
        
        
        PlaygroundPage.current.assessmentStatus = .pass(message: "Welcome! Are you excited to learn how to make a mooncake? When you're ready, head over to the [**Next Page**](@next)!")
    }
    
}
