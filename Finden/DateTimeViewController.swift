//
//  DateTimeViewController.swift
//  Finden
//
//  Created by Alan Cao on 4/19/20.
//  Copyright © 2020 Finden. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {

    @IBOutlet var eventDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTime(_ sender: Any) {
        // Save the time
        
        dismiss(animated: true, completion: nil)
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
