//
//  Main3Scene.swift
//  UserModule
//
//  Created by Fara Yan on 4/17/21.
//

import UIKit
import PlaygroundSupport

public class Main3Scene: UIViewController {
    var titleLabel = UILabel()
    var stepLabel = UILabel()
    var instructionLabel = UILabel()
    var backgroundView = UIImageView(frame: .zero)
    var fairyLights = UIImageView()
    
    var fillingView = ViewWithImage(imageName: "lotusPaste")
    var additionView = ViewWithImage(imageName: "lotusPaste")
    var fillingNames = ["Red Bean Paste", "Lotus Seed Paste", "Jujube Paste", "Five Kernel Spread"]
    var additionNames = ["Egg Yolk", "Custard", "None"]
    
    var fillingImage = ["redBean", "lotusPaste", "Jujube", "fiveKernel"]
    var additionImage = ["eggYolk1", "custard1", "none1"]
    
    
    var fillingLabel = UILabel()
    var additionLabel = UILabel()
    var fillingButton = UIButton()
    var additionButton = UIButton()
    var progressBarView = UIImageView()
    var doughCover = UIButton()
    var addedIngredients = [false, false]
    var numOfRolls = 0
    var chosenFillingImage = "redBean"
    var chosenAdditionImage = "eggYolk1"
    var fillingIndex = 0
    var additionIndex = 0
    
    public var doughButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        var chosenFilling: String? = nil
        if let keyValue = PlaygroundKeyValueStore.current["filling"],
            case .string(let fillingType) = keyValue {
            chosenFilling = fillingType
        }

        var chosenAddition: String? = nil
        if let keyValue = PlaygroundKeyValueStore.current["addition"],
            case .string(let additionType) = keyValue {
            chosenAddition = additionType
        }

        if chosenAddition == nil{
            chosenAddition = "0"
        }
        if chosenFilling == nil{
            chosenFilling = "0"
        }
        
        chosenFillingImage = fillingImage[Int(chosenFilling!) ?? 0]
        chosenAdditionImage = additionImage[Int(chosenAddition!) ?? 0]
        fillingIndex = Int(chosenFilling!) ?? 0
        additionIndex = Int(chosenAddition!) ?? 0
        
        fillingView = ViewWithImage(imageName: chosenFillingImage)
        additionView = ViewWithImage(imageName: chosenAdditionImage)
        
        doughButton.setImage(UIImage(named:"dough1"), for: .normal)
        doughButton.adjustsImageWhenHighlighted = false
        view.addSubview(doughButton)
        view.sendSubviewToBack(doughButton)
        doughButton.addTarget(self, action: #selector(self.mooncakeClicked), for: .touchUpInside)
 
        fillingView.contentMode = .scaleAspectFit
        view.addSubview(fillingView)
        let gesture1 = UIPanGestureRecognizer(target: self, action: #selector(moveFilling(_:)))
        fillingView.addGestureRecognizer(gesture1)
        
        additionView.contentMode = .scaleAspectFit
        view.addSubview(additionView)
        let gesture2 = UIPanGestureRecognizer(target: self, action: #selector(moveAddition(_:)))
        additionView.addGestureRecognizer(gesture2)
        
        if additionIndex == 2{
            additionButton.isHidden = true
            additionView.isHidden = true
            addedIngredients[1] = true
        }
        
        fillingButton.setImage(UIImage(named: chosenFillingImage), for: .normal)
        fillingButton.contentMode = .scaleAspectFit
        fillingButton.isHidden = true
        fillingButton.adjustsImageWhenHighlighted = false
        view.addSubview(fillingButton)
        fillingButton.addTarget(self, action: #selector(self.mooncakeClicked), for: .touchUpInside)


        //dimensions for egg yolk
        additionButton.setImage(UIImage(named: chosenAdditionImage), for: .normal)
        additionButton.contentMode = .scaleAspectFit
        additionButton.isHidden = true
        additionButton.adjustsImageWhenHighlighted = false
        view.addSubview(additionButton)
        additionButton.addTarget(self, action: #selector(self.mooncakeClicked), for: .touchUpInside)

        backgroundView.image = UIImage(named: "main3bkg")
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
        
        titleLabel.text = "Wrap it Together"
        titleLabel.font = UIFont(name:"MikadoBlack", size:62)
        titleLabel.textColor = #colorLiteral(red: 0.9882352941, green: 0.662745098, blue: 0.8352941176, alpha: 1)
        titleLabel.contentMode = .scaleAspectFit
        view.addSubview(titleLabel)
        
        stepLabel.text = "STEP 3:"
        stepLabel.font = UIFont(name:"MikadoBold", size:30)
        stepLabel.textColor = #colorLiteral(red: 0.3686274886, green: 0.3921568394, blue: 0.6823530197, alpha: 1)
        stepLabel.contentMode = .scaleAspectFit
        view.addSubview(stepLabel)
        
        instructionLabel.text = "Drag your fillings onto the dough!"
        instructionLabel.font = UIFont(name:"MikadoMedium-Italic", size:28)
        instructionLabel.textColor = #colorLiteral(red: 0.4470588235, green: 0.4823529412, blue: 0.6941176471, alpha: 1)
        instructionLabel.contentMode = .scaleAspectFit
        view.addSubview(instructionLabel)
        
        fairyLights.image = UIImage(named: "fairyLights")
        view.addSubview(fairyLights)
        
        //progress bar
        progressBarView.image = UIImage(named: "bar11")
        progressBarView.contentMode = .scaleAspectFit
        progressBarView.isHidden = true
        view.addSubview(progressBarView)
        
        //progress bar
        doughCover.setImage(UIImage(named: "doughCover1"), for: .normal)
        doughCover.contentMode = .scaleAspectFit
        doughCover.isHidden = true
        doughCover.adjustsImageWhenHighlighted = false
        view.addSubview(doughCover)
        doughCover.addTarget(self, action: #selector(self.mooncakeClicked), for: .touchUpInside)
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
                
        doughButton.translatesAutoresizingMaskIntoConstraints = false
        doughButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doughButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 740).isActive = true
        doughButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
        doughButton.widthAnchor.constraint(equalToConstant: 570).isActive = true
        
        additionButton.translatesAutoresizingMaskIntoConstraints = false
        additionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        additionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 800).isActive = true
        additionButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        additionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        fillingButton.translatesAutoresizingMaskIntoConstraints = false
        fillingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fillingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 800).isActive = true
        fillingButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        fillingButton.widthAnchor.constraint(equalToConstant: 260).isActive = true

        fillingView.translatesAutoresizingMaskIntoConstraints = false
        fillingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        fillingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 470).isActive = true
        fillingView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        fillingView.widthAnchor.constraint(equalToConstant: 260).isActive = true

        additionView.translatesAutoresizingMaskIntoConstraints = false
        additionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 530).isActive = true
        additionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 470).isActive = true
        additionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        additionView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        progressBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
        progressBarView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        progressBarView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        doughCover.translatesAutoresizingMaskIntoConstraints = false
        doughCover.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        doughCover.topAnchor.constraint(equalTo: view.topAnchor, constant: 740).isActive = true
        doughCover.heightAnchor.constraint(equalToConstant: 200).isActive = true
        doughCover.widthAnchor.constraint(equalToConstant: 500).isActive = true
    }

    
    @objc func moveFilling(_ sender: UIPanGestureRecognizer) {
        let filling = fillingView.superview?.convert(fillingView.frame, to: nil)
        let dough = (doughButton.superview?.convert(doughButton.frame, to: nil))!
        if filling!.intersects(dough) {
            fillingView.isHidden = true
            fillingButton.isHidden = false
            addedIngredients[0] = true
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
        
        if addedIngredients[0] == true && addedIngredients[1] == true{
            rollMooncake()
        }
    }
    
    @objc func moveAddition(_ sender: UIPanGestureRecognizer) {
        let addition = additionView.superview?.convert(additionView.frame, to: nil)
        let dough = (doughButton.superview?.convert(doughButton.frame, to: nil))!
        if addition!.intersects(dough) {
            additionView.isHidden = true
            additionButton.isHidden = false
            addedIngredients[1] = true
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
        
        if addedIngredients[0] == true && addedIngredients[1] == true{
            rollMooncake()
        }
    }

    func rollMooncake(){
        fillingLabel.isHidden = true
        additionLabel.isHidden = true
        progressBarView.isHidden = false
        instructionLabel.frame = CGRect(x: 200, y: 262, width: UIScreen.main.bounds.width, height: 150)
        instructionLabel.text = "Tap your mooncake to roll it!"
    }

    @objc func mooncakeClicked() {
        if addedIngredients[0] == true && addedIngredients[1] == true{
            if(numOfRolls<=7){
                numOfRolls += 1
                UIView.transition(with: doughButton, duration: 0.25, options: .transitionCrossDissolve, animations: {
                    self.doughButton.setImage(UIImage(named:"dough\(self.numOfRolls+1)"), for: .normal)}, completion: nil)
                if (numOfRolls>4){
                    doughCover.isHidden = false
                    UIView.transition(with: doughButton, duration: 0.25, options: .transitionCrossDissolve, animations: {
                        self.doughCover.setImage(UIImage(named:"doughCover\(self.numOfRolls-4)"), for: .normal)}, completion: nil)
                }
                progressBarView.image = UIImage(named: "bar1\(numOfRolls+1)")
            }else if(numOfRolls<11){
                numOfRolls += 1
                if numOfRolls == 10{
                    doughButton.frame = CGRect(x: 100, y: 680, width: 540, height: 360)
                    doughCover.heightAnchor.constraint(equalToConstant: 360).isActive = true
                    doughCover.widthAnchor.constraint(equalToConstant: 540).isActive = true
                }
                if numOfRolls == 11{
                    doughButton.frame = CGRect(x: 100, y: 600, width: 500, height: 440)
                    doughCover.heightAnchor.constraint(equalToConstant: 440).isActive = true
                    doughCover.widthAnchor.constraint(equalToConstant: 500).isActive = true
                }
                doughCover.isHidden = true
                fillingButton.isHidden = true
                additionButton.isHidden = true
                UIView.transition(with: doughButton, duration: 0.25, options: .transitionCrossDissolve, animations: {
                    self.doughButton.setImage(UIImage(named:"dough\(self.numOfRolls)"), for: .normal)
                                            }, completion: nil)
                progressBarView.image = UIImage(named: "bar1\(numOfRolls+1)")

            }
            if(numOfRolls == 11){
                finishRollMooncake()
            }
            if numOfRolls == 3{
                instructionLabel.frame = CGRect(x: 270, y: 262, width: UIScreen.main.bounds.width, height: 150)
                instructionLabel.text = "You're on a roll!"
            }
            if numOfRolls == 6{
                instructionLabel.frame = CGRect(x: 300, y: 262, width: UIScreen.main.bounds.width, height: 150)
                instructionLabel.text = "Tappity Tap!"
            }
            if numOfRolls == 9{
                instructionLabel.frame = CGRect(x: 300, y: 262, width: UIScreen.main.bounds.width, height: 150)
                instructionLabel.text = "Almost there!"
            }
        }
    }

    func finishRollMooncake(){
        instructionLabel.frame = CGRect(x: 80, y: 262, width: UIScreen.main.bounds.width, height: 150)
        instructionLabel.text = "You're a star! You wrapped your mooncake."
        PlaygroundPage.current.assessmentStatus = .pass(message: "Nice going! Now you're ready for the [**Next Page**](@next)!")
    }

}
