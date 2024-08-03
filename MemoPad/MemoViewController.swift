//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 柘植紳太郎 on 2024/07/19.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles": [], "contents": [] ])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        print(titles)
        print(contents)
        
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo() {
        
        let title = titleTextField.text!
        let content = contentTextView.text!
        
        titles.append(title)
        contents.append(content)
        
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert )
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { action in
                              self.navigationController?.popViewController(animated: true)
                              
                              print("OKが押されました。")
                          })
        )
        present(alert,animated: true,completion: nil)
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
