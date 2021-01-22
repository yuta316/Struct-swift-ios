//
//  ViewController.swift
//  Struct
//
//  Created by 石川裕太 on 2021/01/23.
//

import UIKit
//Delegate宣言
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SetOKDelegate {
        
    @IBOutlet weak var tableView: UITableView!
    //構造体受け取り
    var person = Person()
    var personAraay = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate設定
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personAraay.count
    }
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    //セルの構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //Nameのラベル UILabelとダグで管理
        let userNameLabel = cell.contentView.viewWithTag(1) as! UILabel
        //テキストに構造体から取り出した要素を格納
        userNameLabel.text = personAraay[indexPath.row].name
        
        let hobbyLabel = cell.contentView.viewWithTag(2) as! UILabel
        hobbyLabel.text = personAraay[indexPath.row].hobby
        
        let movieNameLabel =
            cell.contentView.viewWithTag(3) as! UILabel
        movieNameLabel.text = personAraay[indexPath.row].movie
        return cell
    }

    
    
    @IBAction func register(_ sender: Any) {
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    func setOK(check: Person) {
        //person受け取り checkという名前で受け取る
        personAraay.append(check)
        tableView.reloadData()
    }
    
    //delegate委任
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //遷移先が”next”なら
        if segue.identifier == "next"{
            //nextVCというインスタンスはNextViewController
            let nextVC = segue.destination as! NextViewController
            //自分で処理しますよ
            nextVC.setOkDelegate = self
        }
    }

}

