//
//  Main5Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/17/21.
//

import UIKit
import PlaygroundSupport

public class Main5Scene: UIViewController {
    var titleLabel = UILabel()
    var stepLabel = UILabel()
    var instructionLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var fairyLights = UIImageView()
    var sparks = UIImageView()
    
    var oven = UIImageView()
    var ovenKnob = UIImageView()
    var setTempButton = UIButton()
    var closeOvenDoorButton = UIButton()
    var openOvenDoorButton = UIButton()
    var bakeButton = UIButton()
    var mooncakeInOven = UIImageView()
    var chosenFilling: String? = nil
    var chosenAddition: String? = nil
    var chosenShape: String? = nil
    
    var tasksDone = [false, false, false, false]
    
    var bakingProgressBar = UIImageView()
    
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
        
        backgroundView.image = UIImage(named: "main5bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        titleLabel.text = "Bake your Mooncake"
        titleLabel.font = UIFont(name:"MikadoBlack", size:62)
        titleLabel.textColor = #colorLiteral(red: 0.5294117647, green: 0.7176470588, blue: 1, alpha: 1)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        stepLabel.text = "STEP 5:"
        stepLabel.font = UIFont(name:"MikadoBold", size:30)
        stepLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        stepLabel.contentMode = .scaleAspectFit
        view.addSubview(stepLabel)
        
        instructionLabel.text = "Click each task to prepare the oven!"
        instructionLabel.font = UIFont(name:"MikadoMedium-Italic", size:28)
        instructionLabel.textColor = #colorLiteral(red: 0.4470588235, green: 0.4823529412, blue: 0.6941176471, alpha: 1)
        instructionLabel.contentMode = .scaleAspectFit
        view.addSubview(instructionLabel)
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        setTempButton.titleLabel?.font = UIFont(name:"MikadoMedium", size:28)
        setTempButton.layer.cornerRadius = 5
        setTempButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        setTempButton.setTitle("Set oven to 350° F", for: .normal)
        setTempButton.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        setTempButton.contentMode = .scaleAspectFit
        setTempButton.addTarget(self, action: #selector(setTemp), for: .touchUpInside)
        view.addSubview(setTempButton)
        
        //closeDoor
        closeOvenDoorButton.setTitle("Close oven door", for: .normal)
        closeOvenDoorButton.contentMode = .scaleAspectFit
        closeOvenDoorButton.titleLabel?.font = UIFont(name:"MikadoMedium", size:28)
        closeOvenDoorButton.layer.cornerRadius = 5
        closeOvenDoorButton.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        closeOvenDoorButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        closeOvenDoorButton.addTarget(self, action: #selector(closeOvenDoor), for: .touchUpInside)
        view.addSubview(closeOvenDoorButton)
        
        //Add Oven view
        oven.image = UIImage(named: "ovenOpen")
        oven.contentMode = .scaleAspectFit
        view.addSubview(oven)
        
        //Add Oven view
        ovenKnob.image = UIImage(named: "ovenKnob")
        ovenKnob.contentMode = .scaleAspectFit
        view.addSubview(ovenKnob)
        
        mooncakeInOven.image = UIImage(named: "shape\(Int(chosenShape!) ?? 1)m")
        mooncakeInOven.contentMode = .scaleAspectFit
        view.addSubview(mooncakeInOven)
        view.bringSubviewToFront(mooncakeInOven)
        
        //Add Oven view
        bakingProgressBar.isHidden = true
        bakingProgressBar.image = UIImage(named: "bar11")
        bakingProgressBar.contentMode = .scaleAspectFit
        view.addSubview(bakingProgressBar)
        
        //closeDoor
        openOvenDoorButton.setTitle("Open oven door", for: .normal)
        openOvenDoorButton.titleLabel?.font = UIFont(name:"MikadoMedium", size:28)
        openOvenDoorButton.layer.cornerRadius = 5
        openOvenDoorButton.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        openOvenDoorButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        openOvenDoorButton.contentMode = .scaleAspectFit
        openOvenDoorButton.isHidden = true
        openOvenDoorButton.addTarget(self, action: #selector(openOvenDoor), for: .touchUpInside)
        view.addSubview(openOvenDoorButton)
        
        //setTemp
        bakeButton.setTitle("Bake", for: .normal)
        bakeButton.contentMode = .scaleAspectFit
        bakeButton.titleLabel?.font = UIFont(name:"MikadoMedium", size:28)
        bakeButton.layer.cornerRadius = 5
        bakeButton.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        bakeButton.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        bakeButton.isHidden = true
        bakeButton.addTarget(self, action: #selector(bake), for: .touchUpInside)
        view.addSubview(bakeButton)
        
        sparks.image = UIImage(named: "sparks")
        sparks.contentMode = .scaleAspectFit
        sparks.isHidden = true
        view.addSubview(sparks)
        
        let sparksRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        sparksRotation.keyTimes = [0,0.25, 0.5, 0.75, 1.0]
        sparksRotation.values = [0, Double.pi * 0.06, 0, -1 * Double.pi * 0.04, 0]
        sparksRotation.duration = CFTimeInterval(15)
        sparksRotation.repeatCount = Float.infinity
        sparks.layer.add(sparksRotation, forKey: "transform.rotation")
        

    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
        
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        setTempButton.translatesAutoresizingMaskIntoConstraints = false
        setTempButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -140).isActive = true
        setTempButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        setTempButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
        setTempButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        closeOvenDoorButton.translatesAutoresizingMaskIntoConstraints = false
        closeOvenDoorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 140).isActive = true
        closeOvenDoorButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        closeOvenDoorButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        closeOvenDoorButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        bakeButton.translatesAutoresizingMaskIntoConstraints = false
        bakeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        bakeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        bakeButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        bakeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        openOvenDoorButton.translatesAutoresizingMaskIntoConstraints = false
        openOvenDoorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        openOvenDoorButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        openOvenDoorButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        openOvenDoorButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        oven.translatesAutoresizingMaskIntoConstraints = false
        oven.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        oven.heightAnchor.constraint(equalToConstant: 540).isActive = true
        oven.widthAnchor.constraint(equalToConstant: 566).isActive = true
        oven.topAnchor.constraint(equalTo: view.topAnchor, constant: 480).isActive = true
        
        ovenKnob.translatesAutoresizingMaskIntoConstraints = false
        ovenKnob.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 220).isActive = true
        ovenKnob.heightAnchor.constraint(equalToConstant: 70).isActive = true
        ovenKnob.widthAnchor.constraint(equalToConstant: 70).isActive = true
        ovenKnob.topAnchor.constraint(equalTo: view.topAnchor, constant: 680).isActive = true
        
        mooncakeInOven.translatesAutoresizingMaskIntoConstraints = false
        mooncakeInOven.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30).isActive = true
        mooncakeInOven.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mooncakeInOven.widthAnchor.constraint(equalToConstant: 70).isActive = true
        mooncakeInOven.topAnchor.constraint(equalTo: view.topAnchor, constant: 720).isActive = true
        
        bakingProgressBar.translatesAutoresizingMaskIntoConstraints = false
        bakingProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        bakingProgressBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bakingProgressBar.widthAnchor.constraint(equalToConstant: 500).isActive = true
        bakingProgressBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        sparks.translatesAutoresizingMaskIntoConstraints = false
        sparks.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -200).isActive = true
        sparks.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        sparks.heightAnchor.constraint(equalToConstant: 450).isActive = true
        sparks.widthAnchor.constraint(equalToConstant: 700).isActive = true
    }
    
    @objc func setTemp(){
        UIView.animate(withDuration: 0.3) {
            self.setTempButton.frame = CGRect(x: 117.5, y: 297.5, width: 205, height: 55)
            self.setTempButton.setTitle("✅ Set oven to 350° F", for: .normal)
            Thread.sleep(forTimeInterval: 0.2)
        } completion: { (true) in
            UIView.animate(withDuration: 0.3) {
                self.ovenKnob.transform = CGAffineTransform(rotationAngle: CGFloat(180))
            } completion: { (true) in
                self.tasksDone[0] = true
                if self.tasksDone[0] == true && self.tasksDone[1] == true{
                    self.timeToBake()
                }
            }
        }
    }
    
    @objc func closeOvenDoor(){
        UIView.animate(withDuration: 0.3) {
            self.closeOvenDoorButton.frame = CGRect(x: 377.5, y: 297.5, width: 185, height: 55)
            self.closeOvenDoorButton.setTitle("✅ Close oven door", for: .normal)
            Thread.sleep(forTimeInterval: 0.2)
        } completion: { (true) in
            UIView.animate(withDuration: 0.5) {
                self.oven.image = UIImage(named: "ovenClosed")
            } completion: { (true) in
                self.tasksDone[1] = true
                if self.tasksDone[0] == true && self.tasksDone[1] == true{
                    self.timeToBake()
                }
            }
        }
    }
    
    @objc func openOvenDoor(){
        UIView.animate(withDuration: 0.3) {
            self.openOvenDoorButton.frame = CGRect(x: 297.5, y: 297.5, width: 185, height: 55)
            self.openOvenDoorButton.setTitle("✅ Open oven door", for: .normal)
            Thread.sleep(forTimeInterval: 0.2)
        } completion: { (true) in
            UIView.animate(withDuration: 0.5) {
                self.oven.image = UIImage(named: "ovenOpen")
            } completion: { (true) in
                Thread.sleep(forTimeInterval: 1)
                self.tasksDone[3] = true
                UIView.animate(withDuration: 0.5) {
                    self.ovenKnob.isHidden = true
                    self.mooncakeInOven.isHidden = true
                    self.oven.image = UIImage(named: "shape1b")
                } completion: { (true) in
                    self.finishedOverall()
                    PlaygroundPage.current.assessmentStatus = .pass(message: "You made it! Your mooncake looks incredible. Let's see what's in store on the [**Next Page**](@next)!")
                }
            }
        }
    }
    
    func timeToBake(){
        UIView.animate(withDuration: 0.3) {
            Thread.sleep(forTimeInterval: 0.5)
            self.bakeButton.isHidden = false
            self.closeOvenDoorButton.isEnabled = false
            self.closeOvenDoorButton.isHidden = true
            self.setTempButton.isHidden = true
            self.instructionLabel.text = "Ready? Let’s get baking!"
        }
    }
    
    @objc func bake(){
        var burntness = 1
        UIView.animate(withDuration: 0.3) {
            self.bakeButton.frame = CGRect(x: 297.5, y: 277.5, width: 135, height: 45)
            self.bakeButton.setTitle("✅ Bake", for: .normal)
            Thread.sleep(forTimeInterval: 0.2)
        } completion: { (true) in
            UIView.animate(withDuration: 0.5) {
                self.bakeButton.isHidden = true
                self.bakingProgressBar.isHidden = false
                self.instructionLabel.text = "Baking..."
            } completion: { (true) in
                for i in 1...12{
                    self.bakingProgressBar.image = UIImage(named: "bar1\(i)")
                    Thread.sleep(forTimeInterval: 0.8)
                    if (i+1)%3 == 0{
                        self.mooncakeInOven.image = UIImage(named: "shape\(Int(self.chosenShape!) ?? 1).\(burntness)")
                        burntness += 1
                    }
                }
                self.mooncakeInOven.image = UIImage(named: "shape\(Int(self.chosenShape!) ?? 1)b")
                self.tasksDone[2] = true
                self.finishedbaking()
            }
        }
    }
    
    func finishedbaking(){
        bakingProgressBar.isHidden = true
        instructionLabel.text = "Done!"
        openOvenDoorButton.isHidden = false
    }
    
    func finishedOverall(){
        openOvenDoorButton.isHidden = true
        sparks.isHidden = false
        instructionLabel.text = "You just made a mooncake!"
    }
    
}
