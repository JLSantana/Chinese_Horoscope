//
//  DatePickerViewController.swift
//  Chinese Zodiac
//
//  Created by user164578 on 2/22/20.
//  Copyright © 2020 user164578. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    var zodiac: Zodiac?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        zodiac = Zodiac.init(date: datePicker.date)
        performSegue(withIdentifier: "DateToDetails", sender: zodiac)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? SignDetailsViewController else {return}
        
        detailsViewController.zodiac = zodiac
    }

}
