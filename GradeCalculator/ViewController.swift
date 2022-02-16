//
//  ViewController.swift
//  GradeCalculator
//
//  Created by Mutlu Calkan on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var midterm: UILabel!
    @IBOutlet weak var final: UILabel!
    @IBOutlet weak var midtermGrade: UITextField!
    @IBOutlet weak var midtermPercent: UITextField!
    @IBOutlet weak var finalGrade: UITextField!
    @IBOutlet weak var finalPercent: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.text = ""
    }
    
    func calculator (){
        let mP = midtermPercent.text ?? "0"
        let mG = midtermGrade.text ?? "0"
        let fP = finalPercent.text ?? "0"
        let fG = finalGrade.text ?? "0"
        
        if mG.isEmpty || mP.isEmpty || fP.isEmpty || fG.isEmpty {
            result.text = "Please fill all required fields!"
            return
        }
        
        let midPerc:Float = Float(mP)! / 100
        let midResult:Float = Float(mG)! * midPerc
        
        let finalPerc:Float = Float(fP)! / 100
        let finalResult:Float = Float(fG)! * finalPerc
        
        let totalResult = finalResult + midResult
        
        
        result.text = "Your overall grade is " + String(format: "%.1f", totalResult)
        
        
    }
    @IBAction func calculate(_ sender: Any) {
        calculator()
    }
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let key = presses.first?.key else { return }
        switch key.keyCode{
        case .keyboardReturnOrEnter:
            calculator()
        default:
            super.pressesEnded(presses, with: event)
        }
}
}
