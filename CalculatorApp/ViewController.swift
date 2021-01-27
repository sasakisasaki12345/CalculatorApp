//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 佐々木峻介 on 2021/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var dividButton: UIButton!
    @IBOutlet weak var multipliedButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var zeroLeftDistance: NSLayoutConstraint!
    @IBOutlet weak var oneLeftDistance: NSLayoutConstraint!
    @IBOutlet weak var fourLeftDistance: NSLayoutConstraint!
    @IBOutlet weak var sevenLeftDistance: NSLayoutConstraint!
    @IBOutlet weak var clearLeftDistance: NSLayoutConstraint!
    @IBOutlet weak var labelLeftDistance: NSLayoutConstraint!
    
    var phase:Int = 0
    var numberFirst:Int = 0
    var numberFirstText:String = ""
    var numberSecond:Int = 0
    var numberSecondText:String = ""
    var selectSysmbol:Int?
    var selectSysmbolText:String = ""
    var result:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //リセット
        initialize()
    }
    
    
    func setView(){
        setNumButton(mButton: zeroButton)
        setNumButton(mButton: oneButton)
        setNumButton(mButton: twoButton)
        setNumButton(mButton: threeButton)
        setNumButton(mButton: fourButton)
        setNumButton(mButton: fiveButton)
        setNumButton(mButton: sixButton)
        setNumButton(mButton: sevenButton)
        setNumButton(mButton: eightButton)
        setNumButton(mButton: nineButton)
        

        symbolButtonSet()
        
        let screenSize = UIScreen.main.bounds
        let leftDistance = (screenSize.width - 325)/2
        zeroLeftDistance.constant = leftDistance
        oneLeftDistance.constant = leftDistance
        fourLeftDistance.constant = leftDistance
        sevenLeftDistance.constant = leftDistance
        clearLeftDistance.constant = leftDistance
        labelLeftDistance.constant = leftDistance
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let button = sender as? UIButton {
            
            if(phase == 0){
                if(numberFirstText == "0"){
                    numberFirstText = String(button.tag)
                }else{
                    numberFirstText = numberFirstText + String(button.tag)
                }
                inputLabel.text = numberFirstText
            }else if(phase == 1){
                if(numberSecondText == "0"){
                    numberSecondText = String(button.tag)
                }else{
                    numberSecondText = numberSecondText + String(button.tag)
                }
                inputLabel.text = numberFirstText + selectSysmbolText + numberSecondText
            }else{
                //アラート等が必要であれば表示
                
            }
        }
    }
    
    func initialize(){
        inputLabel.text = "0"
        numberFirst = 0
        numberSecond = 0
        phase = 0
        numberFirstText = ""
        numberSecondText = ""
        phase = 0
        selectSysmbol = nil
        result = 0.0
        symbolButtonSet()
    }
    
    @IBAction func SymbolAction(_ sender:Any){
        if let button = sender as? UIButton {
            switch button.tag{
            case 0:
                initialize()
            case 1:
                tapEqual()
                break
            default:
                if(phase == 0){
                    symbolButtonSet()
                    didSelectButton(mButton: button)
                    break
                }
            }
        }
    }
    
    
    func tapEqual(){
        if(phase != 1){
            //数字の入力が不十分な場合のエラー表示
        }else if(selectSysmbol == nil){
            //計算様式を未選択時のエラー表示
            
        }else{
            //画面遷移
            let num1 = Float(numberFirstText) ?? 0
            let num2 = Float(numberSecondText) ?? 0
            switch selectSysmbol!{
            case 2:
                result = num1 / num2
                break
            case 3:
                result = num1 * num2
                break
            case 4:
                result = num1 - num2
                break
            case 5:
                result = num1 + num2
                break
            default:
                break
            }
            
            performSegue(withIdentifier: "toSecondVC", sender: nil)
            
        }
        
    }
    
    func didSelectButton(mButton: UIButton){
        mButton.backgroundColor = UIColor.white
        mButton.tintColor = UIColor.orange
        mButton.layer.borderWidth = 2
        mButton.layer.borderColor = UIColor.orange.cgColor
        selectSysmbol = mButton.tag
        selectSysmbolText = (mButton.titleLabel?.text)!
        inputLabel.text = numberFirstText + selectSysmbolText
        phase += 1
    }
    func symbolButtonSet(){
        setSymbolButton(mButton: clearButton)
        setSymbolButton(mButton: dividButton)
        setSymbolButton(mButton: multipliedButton)
        setSymbolButton(mButton: minusButton)
        setSymbolButton(mButton: plusButton)
        setSymbolButton(mButton: equalButton)
    }
    
    func setNumButton(mButton: UIButton){
        mButton.layer.cornerRadius = 35.0
        mButton.backgroundColor = UIColor.gray
        mButton.tintColor = UIColor.black
    }
    
    func setSymbolButton(mButton: UIButton){
        mButton.layer.cornerRadius = 35.0
        mButton.backgroundColor = UIColor.orange
        mButton.tintColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toSecondVC" {
                let secontVC = segue.destination as! SeondViewController
                secontVC.result = self.result
            }
        }

}

