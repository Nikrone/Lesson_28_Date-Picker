//
//  ViewController.swift
//  Lesson_28_Date-Picker
//
//  Created by Evgeniy Nosko on 27.10.21.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet private weak var datePickerView: UIDatePicker!
    @IBOutlet private weak var textField: UITextField!
    
    private let stringArray: [String] = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "0"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.preferredDatePickerStyle = .inline
        datePickerView.addAction(
            UIAction(
                
                handler:  {_ in
                    
//                    изменение формата даты
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "EEEE, MMM d yyyy"
                    dateFormatter.string(from: self.datePickerView.date)
                    print(self.datePickerView.date)
                    self.textField.text =  dateFormatter.string(from: self.datePickerView.date)
                }
            ),
            for: .valueChanged)

    }

    
}

extension ViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        let baraban = Baraban(rawValue: component)
        switch baraban {
        case .firstBaraban:
            return 60
        case .secondBaraban:
            return 30
        default:
            return 0
        }
        
    }
    
}

enum Baraban: Int {
    case firstBaraban
    case secondBaraban
}


//ДОБАВИТЬ EXTENSION



