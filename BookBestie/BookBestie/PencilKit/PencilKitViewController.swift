//
//  PencilKitViewController.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/4/22.
//

//import UIKit
//import PencilKit
//
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var canvasView: PKCanvasView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setUpCanvasView()
//    }
//    
//    private func setUpCanvasView(){
//        if let window = view.window  , let toolPicker = PKToolPicker.shared(for: window){
//            toolPicker.setVisible(true, forFirstResponder: canvasView)
//            toolPicker.frameObscured(in: canvasView)
//            
//            toolPicker.addObserver(canvasView)
//            canvasView.becomeFirstResponder()
//            
//        }
//    }
//    
//    @IBAction func imageBtn(_ sender: UIBarButtonItem) {
//    }
//    let imageVC = self.storyboard?.instantiateViewController(identifier: "image") as! ImageView_ViewController
//    
//    let img = UIGraphicsImageRenderer(bounds: canvasView.bounds).image { (_) in
//        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//    }
//    imageVC.img = img
//    
//    
//    self.navigationController?.pushViewController(imageVC, animated: true)
//}
//
//    @IBAction func clearBtn(_ sender: UIBarButtonItem) {
//    canvasView.drawing = PKDrawing()
//    
//    
//}
//
//}
