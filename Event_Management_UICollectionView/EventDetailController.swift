
import UIKit

class EventDetailController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let dayList = ["Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInWeek: [EventList]?
    var indexPath: IndexPath?
    
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventContentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dayPickerView.delegate = self
        self.dayPickerView.dataSource = self
        
        setDataStartUp()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    @IBAction func btn_Save_Click(_ sender: UIButton) {
        let dayNumber = dayPickerView.selectedRow(inComponent: 0)
        
        if dayNumber == indexPath?.section {
            let dayInWeek = daysInWeek?[(indexPath?.section)!]
            let event = dayInWeek?.events[(indexPath?.row)!]
            
            event?.name = self.eventNameTextField.text
            event?.content = self.eventContentTextView.text
        } else {
            let oldDayInWeek = daysInWeek?[(indexPath?.section)!]
            
            oldDayInWeek?.events.remove(at: (indexPath?.row)!)
            
            let newDayInWeek = daysInWeek?[dayNumber]
            newDayInWeek?.events.append(Event(name: self.eventNameTextField.text!, content: self.eventContentTextView.text!))
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setDataStartUp() {
        let dayInWeek = daysInWeek?[(indexPath?.section)!]
        let event = dayInWeek?.events[(indexPath?.row)!]
        
        var numberOfDay: Int?
        
        switch dayInWeek?.day {
            case "Monday"?:
                numberOfDay = 0
            case "Tuesday"?:
                numberOfDay = 1
            case "Wednessday"?:
                numberOfDay = 2
            case "Thursday"?:
                numberOfDay = 3
            case "Friday"?:
                numberOfDay = 4
            case "Saturday"?:
                numberOfDay = 5
            default:
                numberOfDay = 6
        }
        
        dayPickerView.selectRow(numberOfDay!, inComponent: 0, animated: true)
        eventNameTextField.text = event?.name
        eventContentTextView.text = event?.content
    }
}
