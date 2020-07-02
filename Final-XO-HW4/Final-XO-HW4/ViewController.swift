//
//  ViewController.swift
//  ios-cw-5-p2
//
//  Created by Jenaan Alshayji on 6/28/20.
//  Copyright © 2020 Jenaan Alshayji. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    @IBOutlet weak var turnLable: UILabel!
   
    var buttons: [UIButton] = []
    var counter = 0
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        
        super.viewDidLoad()
        
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "backgroundsound", ofType: "MOV")
           
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
         
        }
        
        player.play()
    }
    
    @IBAction func press(_ sender: UIButton) {
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.black, for: .normal)
            turnLable.text = "O TURN"
        }
          
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            turnLable.text = "X TURN"
        }
        
        counter += 1
        sender.isEnabled = false
       
        checkWinner(p: "X")
        checkWinner(p: "O")
    
    }
    
    func checkWinner(p: String){
        
        let r1 = b1.titleLabel?.text == p && b2.titleLabel?.text == p && b3.titleLabel?.text == p
        let r2 = b4.titleLabel?.text == p && b5.titleLabel?.text == p && b6.titleLabel?.text == p
        let r3 = b7.titleLabel?.text == p && b8.titleLabel?.text == p && b9.titleLabel?.text == p
        let c1 = b1.titleLabel?.text == p && b4.titleLabel?.text == p && b7.titleLabel?.text == p
        let c2 = b2.titleLabel?.text == p && b5.titleLabel?.text == p && b8.titleLabel?.text == p
        let c3 = b3.titleLabel?.text == p && b6.titleLabel?.text == p && b9.titleLabel?.text == p
        let d1 = b1.titleLabel?.text == p && b5.titleLabel?.text == p && b9.titleLabel?.text == p
        let d2 = b3.titleLabel?.text == p && b5.titleLabel?.text == p && b7.titleLabel?.text == p
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
        {
            print("\(p) is the winner")
            
            let alertController = UIAlertController(title: "\(p) WINS", message: "press the button to restart the game", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            {(alert) in self.restartGame()}
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
            counter = 0
        }
        
        else if counter == 9
          {
          print("its a tie")
            
            
            let alertController = UIAlertController(title: "ITS A TIE", message: "press the button to restart the game", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            {(alert) in self.restartGame()}
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
          }
        
        
    }
    
   
   
    
    
    @IBAction func resetAction() {
        restartGame()
    }
    
    func restartGame()
    {
        
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }

        
        turnLable.text = "X TURN"
        
        
    }
    
    
  
}












