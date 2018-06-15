//
//  AddTodoViewController.swift
//  TodoApp
//
//  Created by Lester  Padul on 14/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(with:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        
        if status == "add" {
            textView.becomeFirstResponder()
        }
        else{
            textView.text = todoList![myIndex]
        }
    }
    
    //MARK: Actions
    @objc func keyboardWillShow(with notification: Notification) {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height + 16
        
        bottomConstraint.constant = keyboardHeight
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        textView.resignFirstResponder()
    }
    
    @IBAction func done(_ sender: UIButton) {
        if status == "add" {
            if textView.text != nil && textView.text != "" {
                todoList?.append(textView.text!)
            }
        }
        else{
            if textView.text != nil && textView.text != "" {
                todoList![myIndex] = textView.text
            }
        }
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddTodoViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneButton.isHidden {
            if status == "add" {
                textView.text.removeAll()
            }
            textView.textColor = .white
            
            doneButton.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
