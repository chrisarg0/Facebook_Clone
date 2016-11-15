//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet var imageView: [UIImage]!
    
    
    var selectedImage: UIImageView!
    var fadeTransition: FadeTransition!
    var toDetailViewTransition: ToDetailViewTransition!
    var selectedPhotoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: feedImageView.frame.size.width, height: feedImageView.frame.size.height)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        
        selectedPhotoImageView = sender.view as! UIImageView
        selectedPhotoImageView.frame = sender.view!.frame
        performSegue(withIdentifier: "photoDetailSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        fadeTransition = FadeTransition()
        //toDetailViewTransition = ToDetailViewTransition()

        
        let photoViewController = segue.destination as! PhotoViewController
        photoViewController.modalPresentationStyle = .custom
        photoViewController.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.5
        //toDetailViewTransition.duration = 0.5
        photoViewController.image = selectedPhotoImageView.image
        
    }
    
}

