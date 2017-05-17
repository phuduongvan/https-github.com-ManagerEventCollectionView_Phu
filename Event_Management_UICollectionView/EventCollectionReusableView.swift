
import UIKit

class EventCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var dayName: UILabel!
    
    public func configureReuseCell(dayName: String) {
        self.dayName.text = dayName
    }
        
}
