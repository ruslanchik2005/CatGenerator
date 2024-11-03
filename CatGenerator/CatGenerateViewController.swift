//
//  CatGenerateViewController.swift
//  CatGenerator
//
//  Created by Руслан on 29.10.2024.
//

import UIKit

final class CatGenerateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var catImageView: UIImageView!
    
    private func downloadCat() {
        guard let url = URL(string: "https://cataas.com/cat") else {
            return
        }
        print(Thread.current)
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response,
            error in
            print(Thread.current)
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                print(Thread.current)
                self?.catImageView.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }
    @IBAction func didTapButton(_ sender: Any) {
            downloadCat()
        }
}
//
//import UIKit
//
//class WelcomeViewController: UIViewController {
//
//    @IBOutlet weak var catImageView: UIImageView!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var statusLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        statusLabel.text = "Готов к загрузке!"
//        activityIndicator.hidesWhenStopped = true
//    }
//    
//    private func downloadCat() {
//        guard let url = URL(string: "https://cataas.com/cat") else {
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                return
//            }
//            
//            DispatchQueue.main.async { [weak self] in
//                self?.catImageView.image = UIImage(data: data)
//                self?.statusLabel.text = "Загрузка кота закончена"
//                self?.activityIndicator.stopAnimating()
//            }
//        }
//        
//        task.resume()
//    }
//
//    
//    @IBAction func catButton(_ sender: Any) {
//        activityIndicator.startAnimating()
//        statusLabel.text = "Начинаю загрузку кота!"
//        downloadCat()
//    }
//}
