//
//  ViewController.swift
//  Calculator
//
//  Created by Влад Бокин on 18.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
//buttons outlets
    @IBOutlet weak var divisionOutlet: UIButton!
    @IBOutlet weak var multipyOutlet: UIButton!
    @IBOutlet weak var minusOutlet: UIButton!
    @IBOutlet weak var plusOutlet: UIButton!
    @IBOutlet weak var equallyOutlet: UIButton!
    
    var numberString: String = ""
    var numberDouble: Double = 0
    var numberInt: Int = 0
    var negativeValue: Bool = false
    
    @IBOutlet weak var sumOutlet: UILabel!
    
    var zeroIsUsed: Bool = false //проверка, первое число ноль?
    @IBAction func zeroAction(_ sender: Any) {
       
        numberString += "0"
        zeroIsUsed = true
        updateOutlet()
    }
    
    var counter = 0 //счетчик вводимых чисел
    func updateOutlet(){
        counter += 1
      
        if zeroIsUsed == true && counter == 2{
            if numberString != "0."{
                 numberString = "0"
                sumOutlet.text = numberString
                counter -= 1
            } else {
                sumOutlet.text = numberString
            }
        } else {
            sumOutlet.text = numberString
        }
        
        if counter == 1 && numberString == "."{
            numberString = ""
            sumOutlet.text = numberString
            counter -= 1
        }
        
        if secondOperand == 0 {
            numberString = ""
            sumOutlet.text = "Error!"
            divisionOutlet.backgroundColor = .systemOrange
        }
        deleteAllPressedButtons()
    }
    
    var commaIsUsed = false
    @IBAction func commaAction(_ sender: Any) {
        if commaIsUsed == false {
        numberString +=  "."
        updateOutlet()
        }
        commaIsUsed = true
    }
    
    var secondOperand: Double = -1
    var result: Double = 0.0
    @IBAction func equallyButton(_ sender: Any) {
        if numberString != "" && Int(numberString) != nil{
            secondOperand = Double(numberString)!
        }
        switch secondOperand != 0{
        case operation == "plus":
            result = firstOperand + secondOperand
            plusOutlet.backgroundColor = .systemOrange
            
        case operation == "minus":
            result = firstOperand - secondOperand
            minusOutlet.backgroundColor = .systemOrange
            
        case operation == "multiply":
            result = firstOperand * secondOperand
            multipyOutlet.backgroundColor = .systemOrange
            
        case operation == "division":
            result = firstOperand / secondOperand
            divisionOutlet.backgroundColor = .systemOrange
        default:
           break
        }
        let test = modf(result)
        if test.1 != 0{
            numberString = "\(result)"
        } else {
            numberString = "\(Int(result))"
        }
        updateOutlet()
    }
    
    func deleteAllPressedButtons(){
        plusOutlet.backgroundColor = .systemOrange
        minusOutlet.backgroundColor = .systemOrange
        multipyOutlet.backgroundColor = .systemOrange
        divisionOutlet.backgroundColor = .systemOrange
    }
    
    var operation: String = ""
    var firstOperand: Double = 0
    @IBAction func plusButton(_ sender: Any) {
        if numberString != ""{
            firstOperand = Double(numberString) ?? 0
        }
        operation = "plus"
        deleteNumber()
        plusOutlet.backgroundColor = .darkGray
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if numberString != ""{
            firstOperand = Double(numberString) ?? 0
        }
        operation = "minus"
        deleteNumber()
        minusOutlet.backgroundColor = .darkGray
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        if numberString != ""{
            firstOperand = Double(numberString) ?? 0
        }
        operation = "multiply"
        deleteNumber()
        multipyOutlet.backgroundColor = .darkGray
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        if numberString != ""{
            firstOperand = Double(numberString) ?? 0
        }
        operation = "division"
        deleteNumber()
        divisionOutlet.backgroundColor = .darkGray
    }
    
    @IBAction func percentButton(_ sender: Any) {
        var percent: Float = 0
        if Float(numberString) != nil{
            percent = Float(numberString)! * 0.01
            numberString = "\(percent)" + "%"
            updateOutlet()
        }
    }
    
    @IBAction func negativesButton(_ sender: Any) {
        if Int(numberString) == nil {
            let value1 = Float(numberString)
            if value1 != nil{
            numberString = String(value1! * -1)
            updateOutlet()
            } else{
                numberString = ""
                updateOutlet()
            }
        } else {
            let value2 = Int(numberString)
            numberString = String(value2! * -1)
            updateOutlet()
        }
        
    }
    
    func deleteNumber(){
    counter = 0
    zeroIsUsed = false
    numberString = ""
    commaIsUsed = false
    secondOperand = -1
    updateOutlet()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        deleteNumber()
    }
    
    @IBAction func oneButton(_ sender: Any) {
        numberString +=  "1"
        updateOutlet()
    }
    
    @IBAction func twoButton(_ sender: Any) {
        numberString +=  "2"
        updateOutlet()
    }
    
    @IBAction func threeButton(_ sender: Any) {
        numberString +=  "3"
        updateOutlet()
    }
    
    @IBAction func fourButton(_ sender: Any) {
        numberString +=  "4"
        updateOutlet()
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        numberString +=  "5"
        updateOutlet()
    }
    
    @IBAction func sixButton(_ sender: Any) {
        numberString +=  "6"
        updateOutlet()
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        numberString +=  "7"
        updateOutlet()
    }
    
    @IBAction func eightButton(_ sender: Any) {
        numberString +=  "8"
        updateOutlet()
    }
    
    @IBAction func nineButton(_ sender: Any) {
        numberString +=  "9"
        updateOutlet()
    }
    
}
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
