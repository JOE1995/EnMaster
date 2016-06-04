
//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit
import LTMorphingLabel
import TextFieldEffects

class ViewController0: UIViewController, UITextFieldDelegate, LTMorphingLabelDelegate {
    
    private var myTextField: UITextField!
    
    
    let _myLabel = LTMorphingLabel()
    let password:String = "minions"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        // UITextFieldを作成する.
        myTextField = JiroTextField(frame: CGRectMake(0,0,200,50))
        myTextField.backgroundColor = UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.7)
        // 表示する文字を代入する.
        myTextField.text = ""
        
        // Delegateを設定する.
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.Line
        myTextField.layer.cornerRadius = 10
        
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:250);
        
        myTextField.placeholder = "Password"
        
        // Viewに追加する.
        self.view.addSubview(myTextField)
        
        // 入力された文字を非表示モードにする.
        myTextField.secureTextEntry = true
        
        //myTextField.hidden = true
        
        /////////////////////////////////////////////////
        // delegateを指定
        self._myLabel.delegate = self
        // ラベルの位置
        _myLabel.frame = CGRectMake(20,45,320,200)
        // ラベルをセンターに
        _myLabel.textAlignment = NSTextAlignment.Center
        // ラベル内の文字数が多すぎて表示しきれない時に文字サイズを小さくするかどうか
        _myLabel.adjustsFontSizeToFitWidth = true
        // 文字サイズ
        _myLabel.font = UIFont(name: "Futura", size: 34)
        // テキストに文字
        self._myLabel.text = ""
        // 最下層のviewを黒に
        self.view.backgroundColor = UIColor.blackColor()
        // テキストカラーを白に
        _myLabel.textColor = UIColor.whiteColor()
        // viewにラベルを
        self.view.addSubview(_myLabel)
        
        // 初回
        updateLabel1()
        updateLabel1()
        updateLabel1()
        
        // 一定間隔で実行
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "updateLabel2", userInfo: nil, repeats: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
     */
    func textFieldDidBeginEditing(textField: UITextField){
        //print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    /*
     UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
     */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    /*
     改行ボタンが押された際に呼ばれるデリゲートメソッド.
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text!)
        if textField.text! == password{
            performSegueToView()
            
        } else {
            SweetAlert().showAlert("パスワードが違います")
        }
        
        return true
    }
    func performSegueToView(){
        performSegueWithIdentifier("toView", sender: nil)
    }
    
    
    // LTEMorphingLabelのソースを参考にコードを書いていく
    var i = 0
    var textArray = ["","","Hello,World!", "Welcome to LSR'16","Light the 62 students","who come from","all over the world",
                     "one for ages","I wish you"," good luck!",""]
    
    // 配列に入れた文字を一つず抜き出す
    var text:String {
        get {
            // countElements = 文字数を取得
            if i >= textArray.count {
                i = 0
            }
            return textArray[i++]
        }
    }
    // ライブラリのテキストエフェクト開始
    func updateLabel1() {
        // エフェクト
        _myLabel.morphingEffect = .Anvil
        // textArrayから順番に抜き出した文字をエフェクトをかけて表示
        _myLabel.text = text
        print("yeah")
        
    }
    
    func updateLabel2() {
        // エフェクト
        _myLabel.morphingEffect = .Scale
        // textArrayから順番に抜き出した文字をエフェクトをかけて表示
        _myLabel.text = text
        
    }
    
}


