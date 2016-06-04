//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //選択肢ボタンの宣言
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    @IBOutlet var choiceButton5: UIButton!
    @IBOutlet var choiceButton6: UIButton!
    @IBOutlet var choiceButton7: UIButton!
    @IBOutlet var choiceButton8: UIButton!
    @IBOutlet var choiceButton9: UIButton!
    @IBOutlet var choiceButton10: UIButton!
    @IBOutlet var choiceButton11: UIButton!
    
    //レベルを記すラベルの宣言
    @IBOutlet var label: UILabel!
    
    //投稿回数のnumberを宣言
    var number:Int! = 0
    
    //班数の宣言(Int型で扱う)
    var groupNumber:Int = 0

    //投稿回数を保存する変数
    let numberUd = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //背景は黒に
        self.view.backgroundColor = UIColor.peterRiverColor()

        //投稿回数を呼び出す(0回より多いことを確認)
        if numberUd.integerForKey("goukaku") > 0{
            //numberに今までの投稿回数を代入
            number = numberUd.integerForKey("goukaku")
        }
        
        /*
        //今までの投稿回数によってラベルに表示するレベルを変える
        if number >= 10{
            self.label.text = "師範"
        } else if number >= 8{
            self.label.text = "2段"
        } else if number >= 6{
            self.label.text = "初段"
        } else if number >= 4{
            self.label.text = "1級"
        } else if number >= 2{
            self.label.text = "2級"
        } else if number >= 1{
            self.label.text = "3級"
        } else {
            self.label.text = "初級"
        }
        */


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //ボタンを押した時(全ボタンとstoryboardでつないでおく)
    @IBAction func choiceAnswer(sender: UIButton){
        
        groupNumber = sender.tag
        performSegueToView2()
        
    }

    //ボタンを押した時(全ボタンとstoryboardでつないでおく)
    @IBAction func choiceAnswer2(sender: UIButton){
        
        groupNumber = sender.tag
        performSegueToView4()
        
    }
    
    //ボタンを押した時(全ボタンとstoryboardでつないでおく)
    @IBAction func choiceAnswer3(sender: UIButton){
        
        groupNumber = sender.tag
        performSegueToView5()
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView2"{
            let View2 = segue.destinationViewController as! ViewController2
            
            //プレイヤー数を受け渡す
            View2.groupNumber = self.groupNumber

        }
        
        if segue.identifier == "toView4"{
            let View4 = segue.destinationViewController as! ViewController4
            
            //プレイヤー数を受け渡す
            View4.groupNumber = self.groupNumber
            
        }
        
        if segue.identifier == "toView5"{
            let View5 = segue.destinationViewController as! ViewController5
            
            //プレイヤー数を受け渡す
            View5.groupNumber = self.groupNumber
            
        }
    }
    func performSegueToView2(){
        performSegueWithIdentifier("toView2", sender: nil)
    }
    
    func performSegueToView4(){
        performSegueWithIdentifier("toView4", sender: nil)
    }

    func performSegueToView5(){
        performSegueWithIdentifier("toView5", sender: nil)
    }
    
    
}

