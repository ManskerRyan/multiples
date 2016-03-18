//
//  ViewController.swift
//  multiples
//
//  Created by Ryan Alexander Mansker on 3/18/16.
//  Copyright © 2016 Ryan Alexander Mansker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var numberBoxTxt: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var initTextLbl: UILabel!
    
    @IBOutlet weak var addTextLbl: UILabel!
    
    var inputNum = 0
    var incrementNum = 0
    var equalsNum = 0
    var maxIncNum = 0
    
    //MARK: Functions
    func updateAddText() {
        addTextLbl.text = "\(incrementNum) + \(inputNum) = \(equalsNum)"
    }
    
    func maxIncrement() {
        maxIncNum = inputNum * 20
    }
    
    @IBAction func playBtnPressed(sender: UIButton) {
        if numberBoxTxt.text != nil && numberBoxTxt.text != "" {
            inputNum = Int(numberBoxTxt.text!)!
            equalsNum = inputNum
            maxIncrement()
            
            logoImg.hidden = true
            playBtn.hidden = true
            numberBoxTxt.hidden = true
            
            addBtn.hidden = false
            
            initTextLbl.hidden = false
            
            updateAddText()
        }
    }
    
    @IBAction func addBtnPressed(sender: UIButton) {
        if initTextLbl.hidden == true {
            if equalsNum < maxIncNum {
                incrementNum = equalsNum
                equalsNum = equalsNum + inputNum
                updateAddText()
            } else {
                logoImg.hidden = false
                playBtn.hidden = false
                numberBoxTxt.hidden = false
                
                addBtn.hidden = true
                
                initTextLbl.hidden = true
                
                addTextLbl.hidden = true
                
                numberBoxTxt.text = ""
                equalsNum = 0
                incrementNum = 0
            }
        } else {
            initTextLbl.hidden = true
            addTextLbl.hidden = false
        }
    }
}

