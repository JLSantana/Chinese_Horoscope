//
//  SignDetailsViewController.swift
//  Chinese Zodiac
//
//  Created by user164578 on 2/22/20.
//  Copyright © 2020 user164578. All rights reserved.
//

import UIKit

class SignDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var textDetail: UITextView!
    @IBOutlet weak var elementLabel: UILabel!
    @IBOutlet weak var afinityLabel: UILabel!
    @IBOutlet weak var titleDetail: UINavigationItem!
    
    var zodiac: Zodiac?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        if let zodiac = zodiac {
            imageDetail.image = UIImage(named: zodiac.sign.rawValue)
            textDetail.text = zodiac.description
            afinityLabel.text! += " " + zodiac.afinity
            titleDetail.title = zodiac.sign.rawValue
            
            if let element = zodiac.element {
                elementLabel.text! += " " + element.rawValue
            } else {
                elementLabel.isHidden = true
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
