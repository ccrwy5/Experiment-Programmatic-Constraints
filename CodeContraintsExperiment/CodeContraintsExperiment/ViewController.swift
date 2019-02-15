//
//  ViewController.swift
//  CodeContraintsExperiment
//
//  Created by Chris Rehagen on 2/14/19.
//  Copyright © 2019 Chris Rehagen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var imageView = UIImageView()
    let myButton = UIButton()
    
    var buttonConstraints:[NSLayoutConstraint] = []
    
    var imageLeadingConstraint: NSLayoutConstraint?
    var imageTrailingConstraint: NSLayoutConstraint?
    var imageTopConstraint: NSLayoutConstraint?
    var imageBottomConstraint: NSLayoutConstraint?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Image setup
        imageView.image = UIImage(named: "columns.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
       
        //Image Contraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageLeadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20.0)
        imageTrailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20.0)
        imageTopConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        //imageBottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        imageLeadingConstraint?.isActive = true
        imageTrailingConstraint?.isActive = true
        imageTopConstraint?.isActive = true
        //imageBottomConstraint?.isActive = true
        
        
        
        //Button setup
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.backgroundColor = UIColor.yellow
        myButton.setTitle("Push to reveal an image!", for: .normal)
        myButton.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(myButton)
        
        //Button Contraints
        let buttonTopConstraint = myButton.topAnchor.constraint(equalTo: self.view.topAnchor)
        let buttonBottomConstraint = myButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let buttonLeftConstraint = myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let buttonRightConstraint = myButton.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        buttonConstraints = [buttonTopConstraint, buttonBottomConstraint, buttonLeftConstraint, buttonRightConstraint]
        NSLayoutConstraint.activate(buttonConstraints)
        myButton.addTarget(self, action: #selector(handlButtonPress), for: .touchUpInside)


    }
    
    
    
    @objc func handlButtonPress()
    {
        NSLayoutConstraint.deactivate(buttonConstraints)
        
        //Define new constraints
        let buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 200)
        let xPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let yPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        let newButtonCons:[NSLayoutConstraint] = [buttonHeight, buttonWidth, xPlacement, yPlacement]
        
        NSLayoutConstraint.activate(newButtonCons)
    }


}

