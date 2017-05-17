
import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventContentLabel: UILabel!
    
    public func configureCell(event: Event) {
        self.eventNameLabel.text = event.name
        self.eventContentLabel.text = event.content
    }
}
