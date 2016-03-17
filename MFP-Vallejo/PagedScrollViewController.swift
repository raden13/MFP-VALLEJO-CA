//
//  PagedScrollViewController.swift
//  MFP-Vallejo
//
//  Created by Arend Pryor on 3/16/16.
//  Copyright © 2016 RadenDesigns. All rights reserved.
//

import UIKit

class PagedScrollViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageImages = [UIImage(named: "photo1.jpg")!,
            UIImage(named: "photo2.jpg")!,
            UIImage(named: "photo3.jpg")!,
            UIImage(named: "photo4.jpg")!,
            UIImage(named: "photo5.jpg")!,
            UIImage(named: "photo6.jpg")!,
            UIImage(named: "photo7.jpg")!,
            UIImage(named: "photo8.jpg")!,
            UIImage(named: "photo9.jpg")!,
            UIImage(named: "photo10.jpg")!,
            UIImage(named: "photo11.jpg")!,
            UIImage(named: "photo12.jpg")!,
            UIImage(named: "photo13.jpg")!,
            UIImage(named: "photo14.jpg")!]
        
        
        let pageCount = pageImages.count
        
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count),
            height: pagesScrollViewSize.height)
        
        
        loadVisiblePages()
    }
    
    
    @IBAction func photoBackBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            
            return
        }
        
        
        if let _ = pageViews[page] {
            
        } else {
            
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            
            return
        }
        
        
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        
        pageControl.currentPage = page
        
        
        let firstPage = page - 1
        let lastPage = page + 1
        
        
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        loadVisiblePages()
    }
    
}
