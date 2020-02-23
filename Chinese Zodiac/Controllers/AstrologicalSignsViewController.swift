//
//  AstrologicalSignsViewController.swift
//  Chinese Zodiac
//
//  Created by user164578 on 2/22/20.
//  Copyright © 2020 user164578. All rights reserved.
//

import UIKit

class AstrologicalSignsViewController: UIViewController {

    @IBOutlet weak var ratButton: ZodiacButton!
    @IBOutlet weak var oxButton: ZodiacButton!
    @IBOutlet weak var tigerButton: ZodiacButton!
    @IBOutlet weak var rabbitButton: ZodiacButton!
    @IBOutlet weak var dragonButton: ZodiacButton!
    @IBOutlet weak var snakeButton: ZodiacButton!
    @IBOutlet weak var horseButton: ZodiacButton!
    @IBOutlet weak var goatButton: ZodiacButton!
    @IBOutlet weak var monkeyButton: ZodiacButton!
    @IBOutlet weak var roosterButton: ZodiacButton!
    @IBOutlet weak var dogButton: ZodiacButton!
    @IBOutlet weak var pigButton: ZodiacButton!
    
    var selectedZodiac: Zodiac?
    
    @IBAction func buttonPressed(_ sender: ZodiacButton) {
        selectedZodiac = sender.zodiac
        performSegue(withIdentifier: "SignsToDetail", sender: selectedZodiac)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratButton.zodiac = Zodiac(sign: .rat)
        oxButton.zodiac = Zodiac(sign: .ox)
        tigerButton.zodiac = Zodiac(sign: .tiger)
        rabbitButton.zodiac = Zodiac(sign: .rabbit)
        dragonButton.zodiac = Zodiac(sign: .dragon)
        snakeButton.zodiac = Zodiac(sign: .snake)
        horseButton.zodiac = Zodiac(sign: .horse)
        goatButton.zodiac = Zodiac(sign: .goat)
        monkeyButton.zodiac = Zodiac(sign: .monkey)
        roosterButton.zodiac = Zodiac(sign: .rooster)
        dogButton.zodiac = Zodiac(sign: .dog)
        pigButton.zodiac = Zodiac(sign: .pig)
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? SignDetailsViewController else {return}
        
        detailsViewController.zodiac = selectedZodiac
    }

}
