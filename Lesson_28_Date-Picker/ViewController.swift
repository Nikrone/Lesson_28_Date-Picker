//
//  ViewController.swift
//  Lesson_28_Date-Picker
//
//  Created by Evgeniy Nosko on 27.10.21.
//

import UIKit



class ViewController: UIViewController {
    
    private let pickerView = UIDatePicker()
    
    @IBOutlet private weak var datePickerView: UIDatePicker!
    @IBOutlet private weak var textField: UITextField!
    
    private var firstBarabanDigit = "1"
    private var secondBarabanDigit = "0"
    
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

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        datePickerView.preferredDatePickerStyle = .inline
//        datePickerView.addAction(
//            UIAction(
//
//                handler:  {_ in
//
//                    изменение формата даты
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "EEEE, MMM d yyyy"
//                    dateFormatter.string(from: self.datePickerView.date)
//                    print(self.datePickerView.date)
//                    self.textField.text =  dateFormatter.string(from: self.datePickerView.date)
//                }
//            ),
//            for: .valueChanged)
//
//    }
//
//
//}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.preferredDatePickerStyle = .wheels
        pickerView.maximumDate = Date()
        pickerView.addAction(
            UIAction(
                handler: { _ in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                    self.textField.text = dateFormatter.string(from: self.pickerView.date)
                }
            ),
            for: .valueChanged
        )
        
        textField.inputView = pickerView
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let baraban = Baraban(rawValue: component)
        switch baraban {
        case .firstBaraban:
            firstBarabanDigit = stringArray[row]
        case .secondBaraban:
            secondBarabanDigit = stringArray.reversed()[row]
        default:
            break
        }
        
        textField.text = firstBarabanDigit + secondBarabanDigit
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = .red
        label.backgroundColor = .blue
        
        let baraban = Baraban(rawValue: component)
        switch baraban {
        case .firstBaraban:
            label.text = stringArray[row]
        case .secondBaraban:
            label.text = stringArray.reversed()[row]
        default:
            break
        }
        
        return label
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

