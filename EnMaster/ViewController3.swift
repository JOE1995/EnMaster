//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit
import Parse

class ViewController3: UIViewController, UITextViewDelegate {
  
    var groupNumber:Int!
    var name:String!
    var number:Int! = 0
    
    //Labelの宣言
    @IBOutlet var nameLabel:UILabel!
    
    //textViewの宣言
    @IBOutlet var textView: UITextView!
    
    //submitButtonの宣言
    @IBOutlet var submitButton: UIButton!

    //投稿回数を保存する変数
    let numberUd = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.alizarinColor()
        nameLabel.textColor = UIColor.whiteColor()
        
        nameLabel.text = String(name)
        submitButton.hidden = true
        textView.layer.cornerRadius = 20
        
        
        //投稿回数を呼び出す
        number = numberUd.integerForKey("goukaku")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    func textViewDidBeginEditing(textView: UITextView){
        print("textFieldDidBeginEditing:" + textView.text!)
    }
    
    /*
     UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
     */
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        print("textFieldShouldEndEditing:" + textView.text!)
        
        return true
    }
    
    /*
     改行ボタンが押された際に呼ばれるデリゲートメソッド.
     */
    func textViewShouldReturn(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    
    @IBAction func done(){
        textView.resignFirstResponder()
        submitButton.hidden = false
    }
    
    @IBAction func submit(){
        SweetAlert().showAlert("Are you sure?", subTitle: "投稿しますか？", style: AlertStyle.Warning, buttonTitle:"いいえ", buttonColor:UIColor.redColor() , otherButtonTitle:  "はい", otherButtonColor: UIColor.redColor()) { (isOtherButton) -> Void in
            if isOtherButton == true {
                
                //「いいえ」を選択した時の処理
                SweetAlert().showAlert("Cancelled!", subTitle: "投稿をキャンセルしました", style: AlertStyle.Error)
            }
            else {
                
                //「はい」を選択した時の処理
                self.saveUsername()
                SweetAlert().showAlert("Submitted!", subTitle: "投稿が完了しました!", style: AlertStyle.Success)
                self.number = self.number + 1
                //投稿回数を保存
                self.numberUd.setInteger(self.number, forKey: "goukaku")
            }
        }
        
    }
    
    func saveUsername(){
        //クラスをhogeに指定
        let hoge = PFObject(className:"hoge")
        //UserName.textをhogeクラスの中のusernameに入れる
        print(group)
        print(textView.text!)
        hoge["name"] = name
        hoge["story"] = textView.text
        hoge.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Save to name")
            print("Save to enma")
            
        //SweetAlert().showAlert("Good job!", subTitle: "エンマは保存されました!", style: AlertStyle.Success)
/*
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
            appDelegate.objectId01 = hoge.objectId//appDelegateの変数を操作
        }
 */
        }
    }
    
    func performSegueToHome(){
        performSegueWithIdentifier("toHome", sender: nil)
    }
    
 
    
}

