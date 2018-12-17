//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let imageView = UIImageView(image: UIImage(named:"1"))
//        scrollView.addSubview(imageView)
        scrollView.delegate = self
//        scrollView.minimumZoomScale = 0.5
//        scrollView.maximumZoomScale = 4
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y:0 , width:scrollView.bounds.width , height: scrollView.bounds.height)

        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 7, height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        pageControll.numberOfPages = 7
        pageControll.currentPage = 0

    }
//缩放
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollView.subviews.first
//    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControll.currentPage = Int(currentPage)
    }
    @IBAction func pageControllClicked(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)

    }
    
}
