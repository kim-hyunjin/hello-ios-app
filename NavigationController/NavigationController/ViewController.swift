//
//  ViewController.swift
//  NavigationController
//
//  Created by 김현진 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수. 데이터 전달을 위해 사용된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: use bar button"
        }
    }


}

