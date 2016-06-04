//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    
    
    
    //前Viewkら受け継ぐ班の指定
    var groupNumber:Int!
    
    //Buttonの宣言
    @IBOutlet var choiceButton1: UIButton!
    
    //ImageVIewの宣言
    @IBOutlet var image1:UIImageView!
    
    //Labelの宣言
    @IBOutlet var label1:UILabel!
    
    //nameの宣言
    var name:String!
    
    
    //png画像をUIImageにしておく
    let mozza = UIImage(named: "mozza.png")
    let joe = UIImage(named: "joe.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景を変更
        self.view.backgroundColor = UIColor.turquoiseColor()
        //textの色を白に変更
        label1.textColor = UIColor.whiteColor()
        //label2.textColor = UIColor.whiteColor()
        
        //全班の配列を作成
        var tmpArray = [[String]]()
        tmpArray.append(["もっつぁ","ジョー"])
        
        
    
        
        // Do any additional setup after loading the view, typically from a nib.
        
        switch groupNumber {
        case 10:
            image1.image = joe
            
            label1.text = String(tmpArray[0][1])
            
        case 11:
            label1.text = String(tmpArray[0][0])
            
            image1.image = mozza
            
        default:
            break
        }
        
    }
    
    @IBAction func choiceAnswer(sender: UIButton){

        name = label1.text!
        
        performSegueToView3()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func performSegueToView3(){
        performSegueWithIdentifier("toView3", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toView3"{
            let View3 = segue.destinationViewController as! ViewController3
            
            //プレイヤー数を受け渡す
            View3.groupNumber = self.groupNumber
            
            //名前を受け渡す
            View3.name = self.name
        }
    }
}

