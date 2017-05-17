
import UIKit

class EventAddNewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let dayList = ["Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInWeek: [EventList]?
    
    @IBOutlet weak var eventContentTextView: UITextView!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var dayPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dayPickerView.delegate = self
        self.dayPickerView.dataSource = self
        
        //Set thứ hiên tại lên pickerView
        setDayEvent()
    }
    
    //Số components của PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Số hàng trong 1 component của PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    //Tiêu đề (Nội dung) cho mỗi row trong componenet
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dayList[row]
    }
    
    //Độ lớn height mỗi component
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    //Bắt sư kiện click nút Add
    @IBAction func btn_Add_Click(_ sender: UIButton) {
        let dayInWeek = daysInWeek?[dayPickerView.selectedRow(inComponent: 0)]
        
        dayInWeek?.events.append(Event(name: self.eventNameTextField.text!, content: self.eventContentTextView.text!))
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    //Hàm kiểm tra thứ của ngày hiện tại
    func getCurrenntDay() -> Int {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: currentDate)
        var month = calendar.component(.month, from: currentDate)
        var year = calendar.component(.year, from: currentDate)
        
        if month < 3 {
            month += 12
            year -= 1
        }
        
        return (abs(day + 2 * month + 3 * (month + 1) / 5 + year + year / 4) % 7)
    }
    
    func setDayEvent() {
        let numberOfDay = getCurrenntDay()
        
        switch numberOfDay {
        case 1:
            dayPickerView.selectRow(0, inComponent: 0, animated: true)
        case 2:
            dayPickerView.selectRow(1, inComponent: 0, animated: true)
        case 3:
            dayPickerView.selectRow(2, inComponent: 0, animated: true)
        case 4:
            dayPickerView.selectRow(3, inComponent: 0, animated: true)
        case 5:
            dayPickerView.selectRow(4, inComponent: 0, animated: true)
        case 6:
            dayPickerView.selectRow(5, inComponent: 0, animated: true)
        default:
            dayPickerView.selectRow(6, inComponent: 0, animated: true)
        }
    }
}
