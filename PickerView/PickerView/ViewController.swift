//
//  ViewController.swift
//  PickerView
//
//  Created by 김현진 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageArray: [UIImage?] = []
    var imageFileNames: [String] = []
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setImageFileNames()
        setImageArray()
        lblImageFileName.text = imageFileNames[0]
        imageView.image = imageArray[0]
    }
    
    func setImageFileNames() {
        for i in 1...10 {
            imageFileNames.append("\(i).jpg")
        }
    }
    func setImageArray() {
        for i in 0..<MAX_ARRAY_NUM {
            imageArray.append(UIImage(named: imageFileNames[i]))
        }
    }
    
    // return the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // return the # of rows in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileNames.count
    }
    
    // 피커 뷰 컴포넌트의 각 열에 들어갈 타이틀을 String값으로 넘겨준다
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileNames[row]
        imageView.image = imageArray[row]
    }


}

