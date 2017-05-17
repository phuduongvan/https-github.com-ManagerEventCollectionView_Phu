
import UIKit

class EventCollectionViewController: UICollectionViewController {
    //Mang cac ngay trong tuan.
    // Moi phan tu gom ten ngay va mang cac su kien trong ngay
    var daysInWeek: [EventList] = {
        return EventList.eventList()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Load lại dữ liệu khi show View
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    
    //Số. section
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return daysInWeek.count
    }
    
    //Số item trong môt section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInWeek[section].events.count
    }
    
    //Set nội dung cho Collection ReuableView (tiêu đề mỗi section)
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EventReuseCell", for: indexPath) as! EventCollectionReusableView
        
        let dayInWeek = daysInWeek[indexPath.section]
        reuseCell.configureReuseCell(dayName: dayInWeek.day)
        
        return reuseCell
    }
    
    //Set nội jdung cho mỗi cell item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionViewCell
        
        let eventList = daysInWeek[indexPath.section].events
        cell.configureCell(event: eventList[indexPath.row])
        
        return cell
    }
    
    // Kiểm tra các segue và đẩy dữ liệu tương ứng
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Kiểm tra view Edit Detail được show lên
        if segue.identifier == "ShowDetailEdit" {
            let editVC = segue.destination as! EventDetailController
            //Lấy dữ liệu từ cell đươc chon
            let cell = sender as! EventCollectionViewCell
            let indexPath = collectionView?.indexPath(for: cell)
            //Set dữ liệu cho view Edit Detail
            editVC.daysInWeek = daysInWeek
            editVC.indexPath = indexPath!
        }
        
        //Kiểm tra view Add new được show lên
        if segue.identifier == "ShowAddNew" {
            let addNewVC = segue.destination as! EventAddNewController
            
            addNewVC.daysInWeek = daysInWeek
        }
    }
    
    //Bắt sự kiện click chọn 1 item
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Ban muon action nao?", message: nil, preferredStyle: .alert)
        //Set action khi click Delete
        let alertActionDelete = UIAlertAction(title: "Delete", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let eventList = self.daysInWeek[indexPath.section]
            eventList.events.remove(at: indexPath.row)
            self.collectionView?.deleteItems(at: [indexPath])
        })
        //Set action khi click Edit
        let alertActionEdit = UIAlertAction(title: "Edit", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let editVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventDetailController") as! EventDetailController
            
            editVC.daysInWeek = self.daysInWeek
            editVC.indexPath = indexPath
            
            self.navigationController?.pushViewController(editVC, animated: true)
        })
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Thêm các alertAction vào alert
        alert.addAction(alertActionDelete)
        alert.addAction(alertActionEdit)
        alert.addAction(alertActionCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}
