//
//  detailViewController.swift
//  proj2
//
//  Created by STARKS on 10/25/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedtap))
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    @objc func sharedtap()
    {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)else
        {
            print("Image Not Found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc,animated: true)
            
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
