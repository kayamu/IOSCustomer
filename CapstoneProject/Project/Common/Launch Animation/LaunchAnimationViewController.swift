//
//  LaunchAnimationViewController.swift
//  CapstoneProject
//
//  Zawad Hossain
// this class is the corresponding view controller to map the launch Swiftui class to a storyboard

import UIKit
import SwiftUI

class LaunchAnimationViewController: UIViewController {

//container view to hold the swift ui
//hosting controller to set the root to the swift ui
    @IBOutlet weak var theContainer : UIView!
    let childview = UIHostingController(rootView:LaunchSwiftUIView())

//sets the view when the page is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        //let childview = UIHostingController(rootView:page3swiftuiview())
        //add to screen
        addChild(childview)
        childview.view.frame = theContainer.bounds
        theContainer.addSubview(childview.view)
        // Do any additional setup after loading thebbbnm.,mview.

        setupConstraints()
        
        //_ = Timer(timeInterval: 0.5, repeats: false) { _ in self.performSegue(withIdentifier: "AnimationToMenu", sender: nil) }
        
        

        
    }
//setting up the necessary view constraints
    fileprivate func setupConstraints(){
        childview.view.translatesAutoresizingMaskIntoConstraints = false
        childview.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        childview.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
      
        childview.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        childview.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

