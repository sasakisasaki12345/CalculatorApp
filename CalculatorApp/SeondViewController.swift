//
//  SeondViewController.swift
//  CalculatorApp
//
//  Created by 佐々木峻介 on 2021/01/24.
//

import UIKit

class SeondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var result:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fraction = result.truncatingRemainder(dividingBy: 1)
        var displayText = ""
        if(fraction == 0.0){
            displayText = String(Int(result))
        }else{
            displayText = String(result)
        }
        resultLabel.text = displayText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTap(_ sender: Any) {
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
