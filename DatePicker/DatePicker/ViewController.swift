//
//  ViewController.swift
//  DatePicker
//
//  Created by 김현진 on 2021/05/07.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // target: 동작될 뷰, selector: 타이머가 구동될 때 실행할 함수
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        changePickerTimeLabel(date: datePickerView.date)
        setAlarmTime(date: datePickerView.date)
    }
    
    // #selector()의 인자로 사용할 메서드는 Objective-C와의 호환성을 위하여 함수 앞에 @objc키워드를 붙여야한다.
    @objc func updateTime() {
        let currentTime: Date = NSDate() as Date
        changeCurrentTimeLabel(date: currentTime)
        alarm(date: currentTime)
    }
    
    func changePickerTimeLabel(date: Date) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + dateFormatter.string(from: date)
    }
    
    func changeCurrentTimeLabel(date: Date) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + dateFormatter.string(from: date)
    }
    
    func setAlarmTime(date: Date) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm aaa"
        alarmTime = dateFormatter.string(from: date)
    }
    
    func alarm(date: Date) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm aaa"
        if dateFormatter.string(from: date) == alarmTime {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

