//
//  Main2Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/19/21.
//

import UIKit
import PlaygroundSupport

public class Main2Scene: UIViewController {
    var titleLabel = UILabel()
    var stepLabel = UILabel()
    var instructionLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var fairyLights = UIImageView()
    var globe = UIImageView()
    var filling1Button = UIButton()
    var filling2Button = UIButton()
    var filling3Button = UIButton()
    var filling4Button = UIButton()
    var eggYolk = UIButton()
    var custard = UIButton()
    var none = UIButton()
    var chooseButton = UIButton()
    let popupView = Popover(x: 0, y: 0)
    var enter = UIButton()
    
    var chosenFilling = 0
    var chosenAddition = 0
    var currentSelected = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        popupView.isHidden = true
        view.addSubview(popupView)
        
        chooseButton.frame = CGRect(x: popupView.frame.origin.x+200, y: popupView.frame.origin.y+160, width: 85, height: 25)
        chooseButton.contentMode = .scaleAspectFit
        chooseButton.setTitle("Choose", for: .normal)
        chooseButton.isHidden = true
        chooseButton.layer.cornerRadius = 5
        chooseButton.titleLabel?.font = UIFont(name:"MikadoBold", size:25)
        chooseButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
        view.addSubview(chooseButton)
        
        filling1Button.frame = CGRect(x: 30, y: 340, width: 190, height: 240)
        filling1Button.setImage(UIImage(named:"filling1s"), for: .normal)
        filling1Button.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: filling1Button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        filling1Button.addTarget(self, action: #selector(filling1Clicked), for: .touchUpInside)
        view.addSubview(filling1Button)

        //Add Filling 2 Button
        filling2Button.frame = CGRect(x: 200, y: 340, width: 250, height: 240)
        filling2Button.setImage(UIImage(named:"filling2"), for: .normal)
        filling2Button.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: filling2Button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        filling2Button.addTarget(self, action: #selector(filling2Clicked), for: .touchUpInside)
        view.addSubview(filling2Button)

        //Add Filling 3 Button
        filling3Button.frame = CGRect(x: 368, y: 340, width: 190, height: 240)
        filling3Button.setImage(UIImage(named:"filling3"), for: .normal)
        filling3Button.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: filling3Button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        filling3Button.addTarget(self, action: #selector(filling3Clicked), for: .touchUpInside)
        view.addSubview(filling3Button)

        //Add Filling 4 Button
        filling4Button.frame = CGRect(x: 540, y: 340, width: 190, height: 240)
        filling4Button.setImage(UIImage(named:"filling4"), for: .normal)
        filling4Button.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: filling4Button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        filling4Button.addTarget(self, action: #selector(filling4Clicked), for: .touchUpInside)
        view.addSubview(filling4Button)
        
        eggYolk.frame = CGRect(x: 540, y: 340, width: 190, height: 240)
        eggYolk.setImage(UIImage(named: "eggYolks"), for: .normal)
        eggYolk.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: eggYolk, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        eggYolk.addTarget(self, action: #selector(eggYolkClicked), for: .touchUpInside)
        view.addSubview(eggYolk)
        
        custard.frame = CGRect(x: 540, y: 340, width: 190, height: 240)
        custard.setImage(UIImage(named:"custard"), for: .normal)
        custard.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: custard, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        custard.addTarget(self, action: #selector(custardClicked), for: .touchUpInside)
        view.addSubview(custard)
        
        none.frame = CGRect(x: 540, y: 340, width: 190, height: 240)
        none.setImage(UIImage(named:"none"), for: .normal)
        none.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: none, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        none.addTarget(self, action: #selector(noneClicked), for: .touchUpInside)
        view.addSubview(none)
        
        //Add Filling 4 Button
        enter.frame = CGRect(x: 540, y: 340, width: 100, height: 60)
        enter.setTitle("Enter", for: .normal)
        enter.titleLabel?.font = UIFont(name:"MikadoMedium", size:35)
        enter.layer.cornerRadius = 5
        enter.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        enter.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        enter.contentMode = .scaleAspectFit
        view.addConstraint(NSLayoutConstraint(item: enter, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        enter.addTarget(self, action: #selector(enterClicked), for: .touchUpInside)
        view.addSubview(enter)
        
        backgroundView.image = UIImage(named: "main2bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        titleLabel.text = "Prepare the Filling"
        titleLabel.font = UIFont(name:"MikadoBlack", size:62)
        titleLabel.textColor = #colorLiteral(red: 1, green: 0.894117713, blue: 0.4117647409, alpha: 1)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        stepLabel.text = "STEP 2:"
        stepLabel.font = UIFont(name:"MikadoBold", size:30)
        stepLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        stepLabel.contentMode = .scaleAspectFit
        view.addSubview(stepLabel)
        
        instructionLabel.text = "Choose the fillings you want in your mooncake!"
        instructionLabel.font = UIFont(name:"MikadoMedium-Italic", size:28)
        instructionLabel.textColor = #colorLiteral(red: 0.4470588235, green: 0.4823529412, blue: 0.6941176471, alpha: 1)
        instructionLabel.contentMode = .scaleAspectFit
        view.addSubview(instructionLabel)
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        globe.image = UIImage(named: "globe")
        view.addSubview(globe)
        
        let globeRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        globeRotation.keyTimes = [0,1]
        globeRotation.values = [0, Double.pi * 2.0]
        globeRotation.duration = CFTimeInterval(70)
        globeRotation.repeatCount = Float.infinity
        globe.layer.add(globeRotation, forKey: "transform.rotation")
        
        view.bringSubviewToFront(enter)
        view.bringSubviewToFront(popupView)
        view.bringSubviewToFront(chooseButton)
    }
    
    @objc func enterClicked() {
        PlaygroundKeyValueStore.current["filling"] = .string(String(chosenFilling))
        PlaygroundKeyValueStore.current["addition"] = .string(String(chosenAddition))
        enter.setTitle("Entered", for: .normal)
        enter.backgroundColor = #colorLiteral(red: 0.6677497029304504, green: 0.6677497029304504, blue: 0.6677497029304504, alpha: 1.0)
        PlaygroundPage.current.assessmentStatus = .pass(message: "Delicious choices! Let's dive onto the [**Next Page**](@next)!")
    }
    
    func popoverPosition(change: Int){
        if popupView.filling == 0{
            popupView.frame = CGRect(x: 10, y: 480+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 196, y: 640+change, width: 75, height: 25)
        }else if popupView.filling == 1{
            popupView.frame = CGRect(x: 177, y: 480+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 373, y: 640+change, width: 75, height: 25)
        }else if popupView.filling == 2{
            popupView.frame = CGRect(x: 314, y: 480+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 510, y: 640+change, width: 75, height: 25)
        }else if popupView.filling == 3{
            popupView.frame = CGRect(x: 420, y: 480+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 616, y: 640+change, width: 75, height: 25)
        }else if popupView.addition == 0{
            popupView.frame = CGRect(x: 57, y: 840+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 253, y: 1000+change, width: 75, height: 25)
        }else if popupView.addition == 1{
            popupView.frame = CGRect(x: 244, y: 840+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 440, y: 1000+change, width: 75, height: 25)
        }else if popupView.addition == 2{
            popupView.frame = CGRect(x: 410, y: 840+change, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 606, y: 1000+change, width: 75, height: 25)
        }
    }
    
    @objc func filling1Clicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 10, y: 580, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 113, y: 745, width: 80, height: 35)
            currentSelected = 0
            popupView.forRedBean()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    
    @objc func filling2Clicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 150, y: 580, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 260, y: 745, width: 80, height: 35)
            currentSelected = 0
            popupView.forLotusSeed()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    
    @objc func filling3Clicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 305, y: 580, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 415, y: 745, width: 80, height: 35)
            currentSelected = 0
            popupView.forJujube()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    
    @objc func filling4Clicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 450, y: 580, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 560, y: 745, width: 80, height: 35)
            currentSelected = 0
            popupView.forFiveKernels()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    
    @objc func eggYolkClicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 40, y: 760, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 150, y: 925, width: 80, height: 35)
            currentSelected = 0
            popupView.forEggYolk()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    @objc func custardClicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 220, y: 760, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 330, y: 925, width: 80, height: 35)
            currentSelected = 0
            popupView.forCustard()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    @objc func noneClicked(sender: UIButton!){
        if popupView.isHidden == true {
            popupView.frame = CGRect(x: 410, y: 760, width: 300, height: 220)
            chooseButton.frame = CGRect(x: 520, y: 925, width: 80, height: 35)
            currentSelected = 0
            popupView.forNone()
            popupView.isHidden = false
            chooseButton.isHidden = false
        } else {
            popupView.isHidden = true
            chooseButton.isHidden = true
        }
    }
    
    @objc func chooseButtonClicked(){
        if popupView.filling == 0 || popupView.filling == 1 || popupView.filling == 2 || popupView.filling == 3{
            if popupView.filling == 0{
                filling1Button.setImage(UIImage(named:"filling1s"), for: .normal)
                filling2Button.setImage(UIImage(named:"filling2"), for: .normal)
                filling3Button.setImage(UIImage(named:"filling3"), for: .normal)
                filling4Button.setImage(UIImage(named:"filling4"), for: .normal)
            } else if popupView.filling == 1{
                filling1Button.setImage(UIImage(named:"filling1"), for: .normal)
                filling2Button.setImage(UIImage(named:"filling2s"), for: .normal)
                filling3Button.setImage(UIImage(named:"filling3"), for: .normal)
                filling4Button.setImage(UIImage(named:"filling4"), for: .normal)
            }else if popupView.filling == 2{
                filling1Button.setImage(UIImage(named:"filling1"), for: .normal)
                filling2Button.setImage(UIImage(named:"filling2"), for: .normal)
                filling3Button.setImage(UIImage(named:"filling3s"), for: .normal)
                filling4Button.setImage(UIImage(named:"filling4"), for: .normal)
            }else if popupView.filling == 3{
                filling1Button.setImage(UIImage(named:"filling1"), for: .normal)
                filling2Button.setImage(UIImage(named:"filling2"), for: .normal)
                filling3Button.setImage(UIImage(named:"filling3"), for: .normal)
                filling4Button.setImage(UIImage(named:"filling4s"), for: .normal)
            }
            chosenFilling = popupView.filling
        }else if popupView.addition == 0 || popupView.addition == 1 || popupView.addition == 2{
            if popupView.addition == 0{
                eggYolk.setImage(UIImage(named:"eggYolks"), for: .normal)
                custard.setImage(UIImage(named:"custard"), for: .normal)
                none.setImage(UIImage(named:"none"), for: .normal)
            } else if popupView.addition == 1{
                eggYolk.setImage(UIImage(named:"eggYolk"), for: .normal)
                custard.setImage(UIImage(named:"custards"), for: .normal)
                none.setImage(UIImage(named:"none"), for: .normal)
            }else if popupView.addition == 2{
                eggYolk.setImage(UIImage(named:"eggYolk"), for: .normal)
                custard.setImage(UIImage(named:"custard"), for: .normal)
                none.setImage(UIImage(named:"nones"), for: .normal)
            }
            chosenAddition = popupView.addition
        }
        popupView.isHidden = true
        chooseButton.isHidden = true
    }
    
    func openPopup(){
        popupView.isHidden = false
        chooseButton.isHidden = false
    }

    func closePopup(){
        popupView.isHidden = true
        chooseButton.isHidden = true
    }

    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
        
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 245).isActive = true
        
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        
        fairyLights.translatesAutoresizingMaskIntoConstraints = false
        fairyLights.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        fairyLights.heightAnchor.constraint(equalToConstant: 130).isActive = true
        fairyLights.widthAnchor.constraint(equalToConstant: 770).isActive = true
        
        globe.translatesAutoresizingMaskIntoConstraints = false
        globe.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        globe.topAnchor.constraint(equalTo: view.topAnchor, constant: 870).isActive = true
        globe.heightAnchor.constraint(equalToConstant: 1280).isActive = true
        globe.widthAnchor.constraint(equalToConstant: 1280).isActive = true
        
        filling1Button.translatesAutoresizingMaskIntoConstraints = false
        filling1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        filling1Button.heightAnchor.constraint(equalToConstant: 205).isActive = true
        filling1Button.widthAnchor.constraint(equalToConstant: 170).isActive = true
        filling1Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        filling2Button.translatesAutoresizingMaskIntoConstraints = false
        filling2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        filling2Button.heightAnchor.constraint(equalToConstant: 205).isActive = true
        filling2Button.widthAnchor.constraint(equalToConstant: 170).isActive = true
        filling2Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        filling3Button.translatesAutoresizingMaskIntoConstraints = false
        filling3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 360).isActive = true
        filling3Button.heightAnchor.constraint(equalToConstant: 205).isActive = true
        filling3Button.widthAnchor.constraint(equalToConstant: 170).isActive = true
        filling3Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        filling4Button.translatesAutoresizingMaskIntoConstraints = false
        filling4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 520).isActive = true
        filling4Button.heightAnchor.constraint(equalToConstant: 205).isActive = true
        filling4Button.widthAnchor.constraint(equalToConstant: 170).isActive = true
        filling4Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        eggYolk.translatesAutoresizingMaskIntoConstraints = false
        eggYolk.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        eggYolk.heightAnchor.constraint(equalToConstant: 176).isActive = true
        eggYolk.widthAnchor.constraint(equalToConstant: 170).isActive = true
        eggYolk.topAnchor.constraint(equalTo: view.topAnchor, constant: 670).isActive = true
        
        custard.translatesAutoresizingMaskIntoConstraints = false
        custard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280).isActive = true
        custard.heightAnchor.constraint(equalToConstant: 176).isActive = true
        custard.widthAnchor.constraint(equalToConstant: 170).isActive = true
        custard.topAnchor.constraint(equalTo: view.topAnchor, constant: 670).isActive = true
        
        none.translatesAutoresizingMaskIntoConstraints = false
        none.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 470).isActive = true
        none.heightAnchor.constraint(equalToConstant: 176).isActive = true
        none.widthAnchor.constraint(equalToConstant: 170).isActive = true
        none.topAnchor.constraint(equalTo: view.topAnchor, constant: 670).isActive = true
        
        enter.translatesAutoresizingMaskIntoConstraints = false
        enter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enter.heightAnchor.constraint(equalToConstant: 60).isActive = true
        enter.widthAnchor.constraint(equalToConstant: 130).isActive = true
        enter.topAnchor.constraint(equalTo: view.topAnchor, constant: 880).isActive = true
        
        chooseButton.translatesAutoresizingMaskIntoConstraints = true
        
    }
}
