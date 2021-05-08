//
//  ViewController.swift
//  PageControl
//
//  Created by 김현진 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {
    var images: [UIImage?] = []
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initImages()
        initPageControl()
        imgView.image = images[0]
    }
    
    func initImages() {
        for i in 1...6 {
            images.append(UIImage(named: "0\(i).png"))
        }
    }
    
    func initPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = images[pageControl.currentPage]
    }
    
}

