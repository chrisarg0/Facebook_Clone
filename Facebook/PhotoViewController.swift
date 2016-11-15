//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Chris Argonish on 11/13/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var actionBar: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: imageView.frame.size.width, height: imageView.frame.size.height)
        imageView.image = image
        scrollView.delegate = self

        
    }
    
    @IBAction func didPressDone(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 100 {
            let backgroundViewAlpha = convertValue(inputValue: scrollView.contentOffset.y, r1Min: 0, r1Max: 100, r2Min: 1, r2Max: 0)
            
            backgroundView.alpha = backgroundViewAlpha
            doneBtn.alpha = backgroundViewAlpha
            actionBar.alpha = backgroundViewAlpha
            
            print("you are scrolling up")

        
        } else if scrollView.contentOffset.y > -100 && scrollView.contentOffset.y < 0 {
            let backgroundViewAlpha = convertValue(inputValue: scrollView.contentOffset.y, r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0)
            
            backgroundView.alpha = backgroundViewAlpha
            doneBtn.alpha = backgroundViewAlpha
            actionBar.alpha = backgroundViewAlpha
        
            print("you are scrolling down")
        }
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        if scrollView.contentOffset.y < -50 {
            backgroundView.isHidden = true
            doneBtn.isHidden = true
            actionBar.isHidden = true
            UIView.animate(withDuration: 0.5, animations: {
                
                self.dismiss(animated: true, completion: nil)
                
            })
            
        } else if scrollView.contentOffset.y > 50 {
            backgroundView.isHidden = true
            doneBtn.isHidden = true
            actionBar.isHidden = true
            UIView.animate(withDuration: 0.5, animations: {
                
                self.dismiss(animated: true, completion: nil)
                
            })
        }

        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }


    

}
