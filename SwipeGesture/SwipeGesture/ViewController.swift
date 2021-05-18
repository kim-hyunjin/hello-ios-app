//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 김현진 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initArrowImages()
        setSwipeGesture()
    }
    
    private func initArrowImages() {
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        
        setAllArrowToBlack()
    }
    
    private func setAllArrowToBlack() {
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
    }
    
    private func setSwipeGesture() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        guard let swipeGesture = gesture as? UISwipeGestureRecognizer else {
            return
        }
        
        setAllArrowToBlack()
        setArrowToRed(direction: swipeGesture.direction)
    }
    
    private func setArrowToRed(direction: UISwipeGestureRecognizer.Direction) {
        switch direction {
        case .up:
            imgViewUp.image = imgUp[1]
        case .down:
            imgViewDown.image = imgDown[1]
        case .left:
            imgViewLeft.image = imgLeft[1]
        case .right:
            imgViewRight.image = imgRight[1]
        default:
            break
        }
    }
    


}

