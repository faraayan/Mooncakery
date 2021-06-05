//
//  Main1Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/19/21.
//

import UIKit
import PlaygroundSupport

public class Main1Scene: UIViewController {
    var titleLabel = UILabel()
    var stepLabel = UILabel()
    var instructionLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var blob1 = UIImageView()
    var blob2 = UIImageView()
    var mooncake = UIButton()
    var moon = UIButton()
    var fairyLights = UIImageView()
    var bowl = UIButton()
    var addButton = UIButton()
    var progressBarView = UIImageView()
    var spikes = UIImageView()
    
    var goldenSyrupButton = UIButton()
    var vegetableOilButton = UIButton()
    var lyeWaterButton = UIButton()
    var cakeFlourButton = UIButton()
    var popupView = Popover(x: 0, y: 0)
    
    var stepsCompleted = [false, false, false, false]
    var numberOfMixes = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.isHidden = true
        view.addSubview(popupView)
        
        backgroundView.image = UIImage(named: "main1bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        titleLabel.text = "Craft the Dough"
        titleLabel.font = UIFont(name:"MikadoBlack", size:62)
        titleLabel.textColor = #colorLiteral(red: 1, green: 0.894117713, blue: 0.4117647409, alpha: 1)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        stepLabel.text = "STEP 1:"
        stepLabel.font = UIFont(name:"MikadoBold", size:30)
        stepLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        stepLabel.contentMode = .scaleAspectFit
        view.addSubview(stepLabel)
        
        instructionLabel.text = "Tap the ingredients to add them in!"
        instructionLabel.font = UIFont(name:"MikadoMedium-Italic", size:28)
        instructionLabel.textColor = #colorLiteral(red: 0.4470588235, green: 0.4823529412, blue: 0.6941176471, alpha: 1)
        instructionLabel.contentMode = .scaleAspectFit
        view.addSubview(instructionLabel)
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        goldenSyrupButton.setImage(UIImage(named: "goldenSyrup"), for: .normal)
        view.addSubview(goldenSyrupButton)
        goldenSyrupButton.addTarget(self, action: #selector(goldenSyrupClicked), for: .touchUpInside)
        
        vegetableOilButton.setImage(UIImage(named: "vegetableOil"), for: .normal)
        view.addSubview(vegetableOilButton)
        vegetableOilButton.addTarget(self, action: #selector(vegetableOilClicked), for: .touchUpInside)
        vegetableOilButton.setImage(desaturate(image: UIImage(named:"vegetableOil")!), for: .normal)
        
        lyeWaterButton.setImage(UIImage(named: "lyeWater"), for: .normal)
        view.addSubview(lyeWaterButton)
        lyeWaterButton.addTarget(self, action: #selector(lyeWaterClicked), for: .touchUpInside)
        lyeWaterButton.setImage(desaturate(image: UIImage(named:"lyeWater")!), for: .normal)
        
        cakeFlourButton.setImage(UIImage(named: "cakeFlour"), for: .normal)
        view.addSubview(cakeFlourButton)
        cakeFlourButton.addTarget(self, action: #selector(cakeFlourClicked), for: .touchUpInside)
        cakeFlourButton.setImage(desaturate(image: UIImage(named:"cakeFlour")!), for: .normal)
        
        bowl.setImage(UIImage(named: "bowl"), for: .normal)
        view.addSubview(bowl)
        bowl.addTarget(self, action: #selector(bowlMixingClicked), for: .touchUpInside)
        
        spikes.image = UIImage(named: "spikes")
        spikes.contentMode = .scaleAspectFit
        spikes.isHidden = true
        view.addSubview(spikes)
        
        let spikesRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        spikesRotation.keyTimes = [0,0.25, 0.5, 0.75, 1.0]
        spikesRotation.values = [0, Double.pi * 0.06, 0, -1 * Double.pi * 0.04, 0]
        spikesRotation.duration = CFTimeInterval(15)
        spikesRotation.repeatCount = Float.infinity
        spikes.layer.add(spikesRotation, forKey: "transform.rotation")
            
        addButton.setTitle("Add", for: .normal)
        addButton.isHidden = true
        addButton.layer.cornerRadius = 5
        addButton.titleLabel?.font = UIFont(name:"MikadoBold", size:25)
        addButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        view.addSubview(addButton)

        progressBarView.image = UIImage(named: "bar1")
        progressBarView.isHidden = true
        view.addSubview(progressBarView)
        
        view.bringSubviewToFront(popupView)
        view.bringSubviewToFront(addButton)
    }
    
    @objc func goldenSyrupClicked() {
        if popupView.isHidden == true || popupView.step == 0{
            popupView.step = 0
            if stepsCompleted[popupView.step] == true{
                addButton.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
                addButton.setTitle("Added", for: .normal)
            }else{
                addButton.backgroundColor = UIColor(red: 189/255, green: 176/255, blue: 0/255, alpha: 1)
                addButton.setTitle("Add", for: .normal)
            }
            popupView.forGoldenSyrup()
            if popupView.isHidden == true {
                popupView.frame = CGRect(x: 10, y: 580, width: 300, height: 220)
                addButton.frame = CGRect(x: 115, y: 745, width: 85, height: 35)
                openPopup()
            } else {
                popupView.isHidden = true
                addButton.isHidden = true
            }
        }
    }
    
    @objc func vegetableOilClicked() {
        if stepsCompleted[0] == true{
            if popupView.isHidden == true || popupView.step == 1{
                popupView.step = 1
                if stepsCompleted[popupView.step] == true{
                    addButton.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
                    addButton.setTitle("Added", for: .normal)
                }else{
                    addButton.backgroundColor = UIColor(red: 189/255, green: 176/255, blue: 0/255, alpha: 1)
                    addButton.setTitle("Add", for: .normal)
                }
                popupView.forVegetableOil()
                if popupView.isHidden == true {
                    addButton.frame = CGRect(x: 270, y: 745, width: 85, height: 35)
                    popupView.frame = CGRect(x: 160, y: 580, width: 300, height: 220)
                    openPopup()
                    addButton.frame = CGRect(x: 270, y: 745, width: 85, height: 35)
                } else {
                    popupView.isHidden = true
                    addButton.isHidden = true
                }
            }
        }
    }
    
    @objc func lyeWaterClicked() {
        if stepsCompleted[1] == true{
            if popupView.isHidden == true || popupView.step == 2{
                popupView.step = 2
                if stepsCompleted[popupView.step] == true{
                    addButton.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
                    addButton.setTitle("Added", for: .normal)
                }else{
                    addButton.backgroundColor = UIColor(red: 189/255, green: 176/255, blue: 0/255, alpha: 1)
                    addButton.setTitle("Add", for: .normal)
                }
                popupView.forLyeWater()
                if popupView.isHidden == true {
                    addButton.frame = CGRect(x: 405, y: 745, width: 85, height: 35)
                    popupView.frame = CGRect(x: 300, y: 580, width: 300, height: 220)
                    openPopup()
                    addButton.frame = CGRect(x: 405, y: 745, width: 85, height: 35)
                } else {
                    popupView.isHidden = true
                    addButton.isHidden = true
                }
            }
        }
    }
    
    @objc func cakeFlourClicked() {
        if stepsCompleted[2] == true{
            if popupView.isHidden == true || popupView.step == 3{
                popupView.step = 3
                if stepsCompleted[popupView.step] == true{
                    addButton.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
                    addButton.setTitle("Added", for: .normal)
                    addButton.frame = CGRect(x: 550, y: 745, width: 85, height: 35)
                }else{
                    addButton.backgroundColor = UIColor(red: 189/255, green: 176/255, blue: 0/255, alpha: 1)
                    addButton.setTitle("Add", for: .normal)
                }
                popupView.forCakeFlour()
                if popupView.isHidden == true {
                    addButton.frame = CGRect(x: 545, y: 745, width: 85, height: 35)
                    popupView.frame = CGRect(x: 440, y: 580, width: 300, height: 220)
                    openPopup()
                    addButton.frame = CGRect(x: 545, y: 745, width: 85, height: 35)
                } else {
                    popupView.isHidden = true
                    addButton.isHidden = true
                }
            }
        }
    }
    
    @objc func addButtonClicked() {
        if stepsCompleted[popupView.step] == false{
            popupView.isHidden = true
            addButton.isHidden = true
            popupView.alpha = 0
            if popupView.step == 0{
                bowl.setImage(UIImage(named:"bowl2"), for: .normal)
                vegetableOilButton.setImage(UIImage(named:"vegetableOil"), for: .normal)
            }else if popupView.step == 1{
                bowl.setImage(UIImage(named:"bowl3"), for: .normal)
                lyeWaterButton.setImage(UIImage(named:"lyeWater"), for: .normal)
            }else if popupView.step == 2{
                bowl.setImage(UIImage(named:"bowl4"), for: .normal)
                cakeFlourButton.setImage(UIImage(named:"cakeFlour"), for: .normal)
            }else if popupView.step == 3{
                bowl.setImage(UIImage(named:"bowl5"), for: .normal)
                instructionLabel.text = "Great job! Now, mix your ingredients by tapping the bowl."
                progressBarView.isHidden = false
                goldenSyrupButton.isHidden = true
                vegetableOilButton.isHidden = true
                lyeWaterButton.isHidden = true
                cakeFlourButton.isHidden = true
            }
            stepsCompleted[popupView.step] = true
        }
    }
    
    @objc func bowlMixingClicked() {
        if stepsCompleted[3] == true{
            if(numberOfMixes<7){
                numberOfMixes += 1
                UIView.transition(with: bowl, duration: 0.5, options: .transitionCrossDissolve, animations: { [self] in
                        bowl.setImage(UIImage(named:"mix\(numberOfMixes)"), for: .normal)
                                            }, completion: nil)
                progressBarView.image = UIImage(named: "bar\(numberOfMixes+1)")
            }
            if(numberOfMixes >= 7){
                instructionLabel.text = "Perfect! You have created your mooncake dough."
                spikes.isHidden = false
                progressBarView.isHidden = true
                //setupDone()
                PlaygroundPage.current.assessmentStatus = .pass(message: "You are on a roll! Now you're ready for the [**Next Page**](@next)!")
            }
        }
    }
    
    func desaturate(image: UIImage) -> UIImage {
        let ciImage = CIImage(image: image)
        let grayscale = ciImage!.applyingFilter("CIColorControls",
                                                parameters: [ kCIInputSaturationKey: 0.0 ])
        return UIImage(ciImage: grayscale)
    }
    
    func openPopup(){
        popupView.alpha = 0
        popupView.isHidden = false
        addButton.isHidden = false
        popupView.alpha = 1
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        progressBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 470).isActive = true
        progressBarView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        progressBarView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = true
        
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
        
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 245).isActive = true
        
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        instructionLabel.numberOfLines = 0
        instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        
        fairyLights.translatesAutoresizingMaskIntoConstraints = false
        fairyLights.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        fairyLights.heightAnchor.constraint(equalToConstant: 130).isActive = true
        fairyLights.widthAnchor.constraint(equalToConstant: 770).isActive = true
        
        goldenSyrupButton.translatesAutoresizingMaskIntoConstraints = false
        goldenSyrupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 105).isActive = true
        goldenSyrupButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        goldenSyrupButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        goldenSyrupButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        
        vegetableOilButton.translatesAutoresizingMaskIntoConstraints = false
        vegetableOilButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 265).isActive = true
        vegetableOilButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        vegetableOilButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        vegetableOilButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        
        spikes.translatesAutoresizingMaskIntoConstraints = false
        spikes.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -200).isActive = true
        spikes.topAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
        spikes.heightAnchor.constraint(equalToConstant: 147).isActive = true
        spikes.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        lyeWaterButton.translatesAutoresizingMaskIntoConstraints = false
        lyeWaterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 415).isActive = true
        lyeWaterButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        lyeWaterButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        lyeWaterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        
        cakeFlourButton.translatesAutoresizingMaskIntoConstraints = false
        cakeFlourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 525).isActive = true
        cakeFlourButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cakeFlourButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cakeFlourButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 460).isActive = true
        
        bowl.translatesAutoresizingMaskIntoConstraints = false
        bowl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bowl.heightAnchor.constraint(equalToConstant: 450).isActive = true
        bowl.widthAnchor.constraint(equalToConstant: 550).isActive = true
        bowl.topAnchor.constraint(equalTo: view.topAnchor, constant: 660).isActive = true
    }
}
