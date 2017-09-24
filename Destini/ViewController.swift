//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedStory = 1

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        
        updateUI()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(sender.tag == 1) {
            setNextStory(storyOption: "\(selectedStory)a")
        } else {
            setNextStory(storyOption: "\(selectedStory)b")
        }
        
        updateUI()
    
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        selectedStory = 1
        updateUI()
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
    
    func updateUI() {
        var story : String = ""
        var button1: String = ""
        var button2: String = ""
        
        switch selectedStory {
        case 1:
            story = story1
            button1 = answer1a
            button2 = answer1b
            break
        case 2:
            story = story2
            button1 = answer2a
            button2 = answer2b
            break
        case 3:
            story = story3
            button1 = answer3a
            button2 = answer3b
            break
        case 4:
            story = story4
            break
        case 5:
            story = story5
            break
        case 6:
            story = story6
            break
        default:
            return
        }
        
        setStory(story: story, button1: button1, button2: button2)
        
        if(selectedStory == 6 || selectedStory == 5 || selectedStory == 4) {
            restartButton.isHidden = false
        }
    }
    
    func setNextStory(storyOption: String) {
        switch storyOption {
        case "1a":
            selectedStory = 3
            break
        case "1b":
            selectedStory = 2
            break
        case "3a":
            selectedStory = 6
            break
        case "3b":
            selectedStory = 5
            break
        case "2a":
            selectedStory = 3
            break
        case "2b":
            selectedStory = 4
            break
        default:
            return
        }
    }
    
    func setStory(story: String, button1: String, button2: String) {
        if(button1 == "") {
            topButton.isHidden = true
        }
        if(button2 == "") {
            bottomButton.isHidden = true
        }
        
        storyTextView.text = story
        topButton.setTitle(button1, for: .normal)
        bottomButton.setTitle(button2, for: .normal)
        
    }
    



}

