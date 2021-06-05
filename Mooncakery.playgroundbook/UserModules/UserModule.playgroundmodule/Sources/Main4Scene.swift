//
//  Main4Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/17/21.
//

import UIKit
import PlaygroundSupport

public class Main4Scene: UIViewController {
    var titleLabel = UILabel()
    var stepLabel = UILabel()
    var instructionLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var fairyLights = UIImageView()
    var updownArrow = UIImageView()
    var leftArrow = UIImageView()
    var glow = UIImageView()
    var sparkle1 = UIImageView()
    var sparkle2 = UIImageView()
    
    var toStepTwo = UIButton()
    
    var removeMold = false
    var afterMold = UIButton()
    var shapeSelected = 1
    var shape1 = UIButton()
    var shape2 = UIButton()
    var shape3 = UIButton()
    
    var instructionLabel2 = UILabel()
    var beforeDough = UIImageView()
    var beforeMold = UIButton()
    var moldTop = UIButton()
    var moldBottom = UIImageView()
    var moldPlaced = UIImageView()
    var moldedMooncake = UIImageView()
    var count = 0
    var numOfPresses = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.image = UIImage(named: "main4bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        titleLabel.text = "Shape your Mooncake"
        titleLabel.font = UIFont(name:"MikadoBlack", size:62)
        titleLabel.textColor = #colorLiteral(red: 0.8274509804, green: 0.6078431373, blue: 1, alpha: 1)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        stepLabel.text = "STEP 4:"
        stepLabel.font = UIFont(name:"MikadoBold", size:30)
        stepLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        stepLabel.contentMode = .scaleAspectFit
        view.addSubview(stepLabel)
        
        instructionLabel.text = "Choose a mooncake mold"
        instructionLabel.font = UIFont(name:"MikadoMedium-Italic", size:28)
        instructionLabel.textColor = #colorLiteral(red: 0.4470588235, green: 0.4823529412, blue: 0.6941176471, alpha: 1)
        instructionLabel.contentMode = .scaleAspectFit
        view.addSubview(instructionLabel)
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        //Add Shape 1 Button
        shape1.setImage(UIImage(named:"shape1s"), for: .normal)
        shape1.contentMode = .scaleAspectFit
        shape1.addTarget(self, action: #selector(shape1Clicked), for: .touchUpInside)
        view.addSubview(shape1)
        shape1.adjustsImageWhenHighlighted = false
        
        //Add Shape 2 Button
        shape2.setImage(UIImage(named:"shape2"), for: .normal)
        shape2.contentMode = .scaleAspectFit
        shape2.addTarget(self, action: #selector(shape2Clicked), for: .touchUpInside)
        view.addSubview(shape2)
        shape2.adjustsImageWhenHighlighted = false
        
        //Add Shape 3 Button
        shape3.setImage(UIImage(named:"shape3"), for: .normal)
        shape3.contentMode = .scaleAspectFit
        shape3.addTarget(self, action: #selector(shape3Clicked), for: .touchUpInside)
        view.addSubview(shape3)
        shape3.adjustsImageWhenHighlighted = false
        
        toStepTwo.setTitle("Next", for: .normal)
        toStepTwo.titleLabel?.font = UIFont(name:"MikadoMedium", size:35)
        toStepTwo.layer.cornerRadius = 5
        toStepTwo.setTitleColor(#colorLiteral(red: 0.2822709381580353, green: 0.3545278310775757, blue: 0.679405808448795, alpha: 1.0), for: .normal)
        toStepTwo.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        toStepTwo.contentMode = .scaleAspectFit
        toStepTwo.addTarget(self, action: #selector(toStepTwoClicked), for: .touchUpInside)
        view.addSubview(toStepTwo)
        
        beforeDough.image = UIImage(named: "sphereDough")
        beforeDough.contentMode = .scaleAspectFit
        beforeDough.isHidden = true
        view.addSubview(beforeDough)
        
        glow.image = UIImage(named: "glow")
        glow.contentMode = .scaleAspectFit
        glow.isHidden = true
        view.addSubview(glow)
        
        sparkle1.image = UIImage(named: "sparkle1")
        sparkle1.contentMode = .scaleAspectFit
        view.addSubview(sparkle1)
        
        sparkle2.image = UIImage(named: "sparkle2")
        sparkle2.contentMode = .scaleAspectFit
        view.addSubview(sparkle2)

        
        let glowRotation = CAKeyframeAnimation(keyPath: "transform.rotation")
        glowRotation.keyTimes = [0,0.25, 0.5, 0.75, 1.0]
        glowRotation.values = [0, Double.pi * 0.08, 0, -1 * Double.pi * 0.08, 0]
        glowRotation.duration = CFTimeInterval(20)
        glowRotation.repeatCount = Float.infinity
        glow.layer.add(glowRotation, forKey: "transform.rotation")
        
        leftArrow.image = UIImage(named: "leftArrow")
        leftArrow.contentMode = .scaleAspectFit
        leftArrow.isHidden = true
        view.addSubview(leftArrow)
        
        updownArrow.image = UIImage(named: "updownArrow")
        updownArrow.contentMode = .scaleAspectFit
        updownArrow.isHidden = true
        view.addSubview(updownArrow)
        
        beforeMold.setImage(UIImage(named:"moldComplete"), for: .normal)
        beforeMold.contentMode = .scaleAspectFit
        beforeMold.isHidden = true
        view.addSubview(beforeMold)
        let gesture1 = UIPanGestureRecognizer(target: self, action: #selector(moveMold(_:)))
        beforeMold.addGestureRecognizer(gesture1)
        
        afterMold.setImage(UIImage(named:"moldComplete"), for: .normal)
        afterMold.contentMode = .scaleAspectFit
        afterMold.isHidden = true
        view.addSubview(afterMold)
        afterMold.addTarget(self, action: #selector(afterMoldClicked), for: .touchUpInside)

        moldTop.setImage(UIImage(named:"moldTop"), for: .normal)
        moldTop.contentMode = .scaleAspectFit
        moldTop.isHidden = true
        moldTop.addTarget(self, action: #selector(pressMold), for: .touchUpInside)
        view.addSubview(moldTop)
        
        moldBottom.image = UIImage(named: "moldBottom")
        moldBottom.contentMode = .scaleAspectFit
        moldBottom.isHidden = true
        view.addSubview(moldBottom)
        
        moldPlaced.image = UIImage(named: "shape1p")
        moldPlaced.contentMode = .scaleAspectFit
        moldPlaced.isHidden = true
        view.addSubview(moldPlaced)
        
        moldedMooncake.image = UIImage(named: "shape1m")
        moldedMooncake.contentMode = .scaleAspectFit
        moldedMooncake.isHidden = true
        view.addSubview(moldedMooncake)
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shape1.translatesAutoresizingMaskIntoConstraints = false
        shape1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -230).isActive = true
        shape1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shape1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        shape1.topAnchor.constraint(equalTo: view.topAnchor, constant: 480).isActive = true
        
        shape2.translatesAutoresizingMaskIntoConstraints = false
        shape2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shape2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shape2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        shape2.topAnchor.constraint(equalTo: view.topAnchor, constant: 480).isActive = true
        
        shape3.translatesAutoresizingMaskIntoConstraints = false
        shape3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 230).isActive = true
        shape3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shape3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        shape3.topAnchor.constraint(equalTo: view.topAnchor, constant: 480).isActive = true
        
        sparkle1.translatesAutoresizingMaskIntoConstraints = false
        sparkle1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -340).isActive = true
        sparkle1.topAnchor.constraint(equalTo: view.topAnchor, constant: 340).isActive = true
        sparkle1.heightAnchor.constraint(equalToConstant: 17).isActive = true
        sparkle1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        sparkle2.translatesAutoresizingMaskIntoConstraints = false
        sparkle2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 330).isActive = true
        sparkle2.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
        sparkle2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sparkle2.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
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
        
        toStepTwo.translatesAutoresizingMaskIntoConstraints = false
        toStepTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toStepTwo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        toStepTwo.widthAnchor.constraint(equalToConstant: 130).isActive = true
        toStepTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 740).isActive = true
        
        beforeDough.translatesAutoresizingMaskIntoConstraints = false
        beforeDough.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -160).isActive = true
        beforeDough.topAnchor.constraint(equalTo: view.topAnchor, constant: 730).isActive = true
        beforeDough.heightAnchor.constraint(equalToConstant: 240).isActive = true
        beforeDough.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        leftArrow.translatesAutoresizingMaskIntoConstraints = false
        leftArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        leftArrow.topAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
        leftArrow.heightAnchor.constraint(equalToConstant: 85).isActive = true
        leftArrow.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        updownArrow.translatesAutoresizingMaskIntoConstraints = false
        updownArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        updownArrow.topAnchor.constraint(equalTo: view.topAnchor, constant: 540).isActive = true
        updownArrow.heightAnchor.constraint(equalToConstant: 200).isActive = true
        updownArrow.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        beforeMold.translatesAutoresizingMaskIntoConstraints = false
        beforeMold.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 170).isActive = true
        beforeMold.heightAnchor.constraint(equalToConstant: 385).isActive = true
        beforeMold.widthAnchor.constraint(equalToConstant: 266).isActive = true
        beforeMold.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        
        afterMold.translatesAutoresizingMaskIntoConstraints = false
        afterMold.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -125).isActive = true
        afterMold.heightAnchor.constraint(equalToConstant: 405).isActive = true
        afterMold.widthAnchor.constraint(equalToConstant: 276).isActive = true
        afterMold.topAnchor.constraint(equalTo: view.topAnchor, constant: 590).isActive = true
        
        moldTop.translatesAutoresizingMaskIntoConstraints = false
        moldTop.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        moldTop.heightAnchor.constraint(equalToConstant: 261).isActive = true
        moldTop.widthAnchor.constraint(equalToConstant: 230).isActive = true
        moldTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
        
        moldBottom.translatesAutoresizingMaskIntoConstraints = false
        moldBottom.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90).isActive = true
        moldBottom.heightAnchor.constraint(equalToConstant: 266).isActive = true
        moldBottom.widthAnchor.constraint(equalToConstant: 281).isActive = true
        moldBottom.topAnchor.constraint(equalTo: view.topAnchor, constant: 750).isActive = true

        moldPlaced.translatesAutoresizingMaskIntoConstraints = false
        moldPlaced.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150).isActive = true
        moldPlaced.topAnchor.constraint(equalTo: view.topAnchor, constant: 680).isActive = true
        moldPlaced.heightAnchor.constraint(equalToConstant: 226).isActive = true
        moldPlaced.widthAnchor.constraint(equalToConstant: 235).isActive = true
        
        glow.translatesAutoresizingMaskIntoConstraints = false
        glow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -100).isActive = true
        glow.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        glow.heightAnchor.constraint(equalToConstant: 900).isActive = true
        glow.widthAnchor.constraint(equalToConstant: 900).isActive = true
        
        
        moldedMooncake.translatesAutoresizingMaskIntoConstraints = false
        moldedMooncake.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        moldedMooncake.topAnchor.constraint(equalTo: view.topAnchor, constant: 730).isActive = true
        moldedMooncake.heightAnchor.constraint(equalToConstant: 216).isActive = true
        moldedMooncake.widthAnchor.constraint(equalToConstant: 231).isActive = true

    }
    
    @objc func toStepTwoClicked(){
        shape1.isHidden = true
        shape2.isHidden = true
        shape3.isHidden = true
        startStepTwo()
    }
    
    func startStepTwo(){
        toStepTwo.isHidden = true
        instructionLabel.text = "Place your mooncake press over the dough and mold"
        beforeDough.isHidden = false
        beforeMold.isHidden = false
        leftArrow.isHidden = false
        moldPlaced.isHidden = false
    }
    
    
    @objc func moveMold(_ sender: UIPanGestureRecognizer) {
        if removeMold != true{
            let mold = beforeMold.superview?.convert(beforeMold.frame, to: nil)
            let dough = (beforeDough.superview?.convert(beforeDough.frame, to: nil))!
            if mold!.intersects(dough) {
                toStepThree()
            }
            
            let targetView = sender.view!
            let translation = sender.translation(in: view)
            
            switch sender.state {
            case .began,.changed, .ended:
                targetView.center = CGPoint(x: targetView.center.x + translation.x
                                            ,y: targetView.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: view)
                break
            default:
                break
            }
        }
    }
    
    @objc func afterMoldClicked(){
        if removeMold == true{
            afterMold.isHidden = true
            glow.isHidden = false
            instructionLabel.text = "What a beauty!"
            moldedMooncake.isHidden = false
            PlaygroundPage.current.assessmentStatus = .pass(message: "Look how far you've come! Now you're ready for the [**Next Page**](@next)!")
        }
    }
    
    func toStepThree(){
        moldTop.translatesAutoresizingMaskIntoConstraints = true
        moldTop.frame = CGRect(x: self.moldBottom.frame.midX-110, y: 500, width: 230, height: 261)
        beforeDough.isHidden = true
        beforeMold.isHidden = true
        leftArrow.isHidden = true
        updownArrow.isHidden = false
        moldPlaced.isHidden = true
        moldTop.isHidden = false
        moldBottom.isHidden = false
        instructionLabel.text = "Move the hand press up and down to shape the mooncake!"
    }
    
    @objc func pressMold(){
        UIView.animate(withDuration: 0.3) {
            self.numOfPresses += 1
            self.moldTop.frame = CGRect(x: self.moldBottom.frame.midX-110, y: 500, width: 230, height: 261)
        } completion: { (true) in
            UIView.animate(withDuration: 0.3) {
                self.moldTop.frame = CGRect(x: self.moldBottom.frame.midX-110, y: 580, width: 230, height: 261)
            } completion: { (true) in
                if self.numOfPresses >= 4{
                    self.removeMold = true
                    self.toRemoveMold()
                }
            }
        }
    }
    
    func toRemoveMold(){
        view.bringSubviewToFront(afterMold)
        instructionLabel2.text = "Tap the mold to reveal your mooncake!"
        moldedMooncake.image = UIImage(named: "shape\(shapeSelected)m")
        moldTop.isHidden = true
        moldBottom.isHidden = true
        updownArrow.isHidden = true
        afterMold.isHidden = false
        moldedMooncake.isHidden = false
    }
    
    @objc func shape1Clicked(){
        UIView.animate(withDuration: 0.2, animations:{
            self.shape1.frame = CGRect(x: self.shape1.frame.origin.x - 20, y: self.shape1.frame.origin.y - 20, width: self.shape1.frame.size.width + 40, height: self.shape1.frame.size.height + 40)
        })
        PlaygroundKeyValueStore.current["shape"] = .string("1")
        shapeSelected = 1
        moldPlaced.image = UIImage(named: "shape1p")
        shape1.setImage(UIImage(named:"shape1s"), for: .normal)
        shape2.setImage(UIImage(named:"shape2"), for: .normal)
        shape3.setImage(UIImage(named:"shape3"), for: .normal)
    }
    @objc func shape2Clicked(){
        UIView.animate(withDuration: 0.2, animations:{
            self.shape2.frame = CGRect(x: self.shape2.frame.origin.x - 20, y: self.shape2.frame.origin.y - 20, width: self.shape2.frame.size.width + 40, height: self.shape2.frame.size.height + 40)
        })
        PlaygroundKeyValueStore.current["shape"] = .string("2")
        shapeSelected = 2
        moldPlaced.image = UIImage(named: "shape2p")
        shape1.setImage(UIImage(named:"shape1"), for: .normal)
        shape2.setImage(UIImage(named:"shape2s"), for: .normal)
        shape3.setImage(UIImage(named:"shape3"), for: .normal)
    }
    @objc func shape3Clicked(){
        UIView.animate(withDuration: 0.2, animations:{
            self.shape3.frame = CGRect(x: self.shape3.frame.origin.x - 20, y: self.shape3.frame.origin.y - 20, width: self.shape3.frame.size.width + 40, height: self.shape3.frame.size.height + 40)
        })
        PlaygroundKeyValueStore.current["shape"] = .string("3")
        shapeSelected = 3
        moldPlaced.image = UIImage(named: "shape3p")
        shape1.setImage(UIImage(named:"shape1"), for: .normal)
        shape2.setImage(UIImage(named:"shape2"), for: .normal)
        shape3.setImage(UIImage(named:"shape3s"), for: .normal)
        
    }
}

