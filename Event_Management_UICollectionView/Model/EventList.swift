
import Foundation

class EventList {
    // Biến lưu ngày và mảng sự kiện trong ngày
    var day: String
    var events: [Event]
    
    //Hàm khởi tạo
    init(day: String, events: [Event]) {
        self.day = day
        self.events = events
    }
    
    // Hàm trả về các sự kiện trong tuần.
    public class func eventList() -> [EventList] {
        return [self.monday(), self.tuesday(), self.wednessday(), self.thursday(), self.friday(), self.saturday(), self.sunday()]
    }
    
    //Dữ liệu các sự kiện ngày thứ 2
    private class func monday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfMonday = [Event]()
        
        eventsOfMonday.append(Event(name: "Sang", content: "Di lam"))
        eventsOfMonday.append(Event(name: "Trua", content: "Di lam"))
        eventsOfMonday.append(Event(name: "Chieu", content: "Di lam"))
        eventsOfMonday.append(Event(name: "Toi", content: "O nha"))
        
        return EventList(day: "Monday", events: eventsOfMonday)
    }
    
    //Dữ liệu các sự kiện ngày thứ 3
    private class func tuesday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfTuesday = [Event]()
        
        eventsOfTuesday.append(Event(name: "Sang", content: "Di lam"))
        eventsOfTuesday.append(Event(name: "Trua", content: "Di lam"))
        eventsOfTuesday.append(Event(name: "Chieu", content: "Di lam"))
        eventsOfTuesday.append(Event(name: "Toi", content: "Da banh"))
        
        return EventList(day: "Tuesday", events: eventsOfTuesday)
    }
    
    //Dữ liệu các sự kiện ngày thứ 4
    private class func wednessday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfWednessday = [Event]()
        
        eventsOfWednessday.append(Event(name: "Sang", content: "Di lam"))
        eventsOfWednessday.append(Event(name: "Trua", content: "Di hoc"))
        eventsOfWednessday.append(Event(name: "Chieu", content: "Di hoc"))
        eventsOfWednessday.append(Event(name: "Toi", content: "O nha"))
        
        return EventList(day: "Wednessday", events: eventsOfWednessday)
    }
    
    //Dữ liệu các sự kiện ngày thứ 5
    private class func thursday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfThursday = [Event]()
        
        eventsOfThursday.append(Event(name: "Sang", content: "Di lam"))
        eventsOfThursday.append(Event(name: "Trua", content: "Di lam"))
        eventsOfThursday.append(Event(name: "Chieu", content: "Di lam"))
        eventsOfThursday.append(Event(name: "Toi", content: "O nha"))
        
        return EventList(day: "Thursday", events: eventsOfThursday)
    }
    
    //Dữ liệu các sự kiện ngày thứ 6
    private class func friday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfFriday = [Event]()
        
        eventsOfFriday.append(Event(name: "Sang", content: "Di lam"))
        eventsOfFriday.append(Event(name: "Trua", content: "Di lam"))
        eventsOfFriday.append(Event(name: "Chieu", content: "Di lam"))
        eventsOfFriday.append(Event(name: "Toi", content: "Da banh"))
        
        return EventList(day: "Friday", events: eventsOfFriday)
    }
    
    //Dữ liệu các sự kiện ngày thứ 7
    private class func saturday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfSaturday = [Event]()
        
        eventsOfSaturday.append(Event(name: "Sang", content: "Di hoc"))
        eventsOfSaturday.append(Event(name: "Trua", content: "Di hoc"))
        eventsOfSaturday.append(Event(name: "Chieu", content: "Di hoc"))
        eventsOfSaturday.append(Event(name: "Toi", content: "Di choi"))
        
        return EventList(day: "Saturday", events: eventsOfSaturday)
    }
    
    //Dữ liệu các sự kiện ngày CN
    private class func sunday() -> EventList {
        //Mảng lưu các sự kiện ngày thứ 2
        var eventsOfSunday = [Event]()
        
        eventsOfSunday.append(Event(name: "Sang", content: "coffee"))
        eventsOfSunday.append(Event(name: "Trua", content: "Di choi"))
        eventsOfSunday.append(Event(name: "Chieu", content: "Di choi"))
        eventsOfSunday.append(Event(name: "Toi", content: "Di choi"))
        
        return EventList(day: "Sunday", events: eventsOfSunday)
    }
}
