//
//  NextViewController.swift
//  Struct
//
//  Created by 石川裕太 on 2021/01/23.
//

import UIKit

//プロコトル
protocol SetOKDelegate {
    func setOK(check:Person)
}

class NextViewController: UIViewController {
    //構造体よびだし
    var person = Person()
    
    var setOkDelegate:SetOKDelegate?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var hobbyText: UITextField!
    @IBOutlet weak var movieText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //構造体アクセス
        print(person.hobby)
    }
    
    @IBAction func OK(_ sender: Any) {
        //構造体にアクセスしそれぞれ格納
        person.name = nameText.text!
        person.hobby = hobbyText.text!
        person.movie = movieText.text!
        //プロコトルでPeson渡す
        setOkDelegate?.setOK(check: person)
        //前画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
   

}
