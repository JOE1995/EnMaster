//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {
    
    
    
    
    //前Viewkら受け継ぐ班の指定
    var groupNumber:Int!
    
    //Buttonの宣言
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    @IBOutlet var choiceButton5: UIButton!
    
    //ImageVIewの宣言
    @IBOutlet var image1:UIImageView!
    @IBOutlet var image2:UIImageView!
    @IBOutlet var image3:UIImageView!
    @IBOutlet var image4:UIImageView!
    @IBOutlet var image5:UIImageView!
    
    //Labelの宣言
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var label5:UILabel!
    
    //nameの宣言
    var name:String!
    
    
    //png画像をUIImageにしておく
    let anna = UIImage(named: "anna.png")
    let bushi = UIImage(named: "bushi.png")
    let ohana = UIImage(named: "ohana.png")
    let raira = UIImage(named: "raira.png")
    let tamosan = UIImage(named: "tamosan.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景を変更
        self.view.backgroundColor = UIColor.turquoiseColor()
        //textの色を白に変更
        label1.textColor = UIColor.whiteColor()
        label2.textColor = UIColor.whiteColor()
        label3.textColor = UIColor.whiteColor()
        label4.textColor = UIColor.whiteColor()
        label5.textColor = UIColor.whiteColor()

        
        //全班の配列を作成
        var tmpArray = [[String]]()
        tmpArray.append(["あんな","武士","おはな","らいら","タモさん"])
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        
            image1.image = anna
            image2.image = bushi
            image3.image = ohana
            image4.image = raira
            image5.image = tamosan
        
            label1.text = String(tmpArray[0][0])
            label2.text = String(tmpArray[0][1])
            label3.text = String(tmpArray[0][2])
            label4.text = String(tmpArray[0][3])
            label5.text = String(tmpArray[0][4])

        
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        
        if sender.tag == 1{
            name = label1.text!
            
        } else if sender.tag == 2{
            name = label2.text
            
        } else if sender.tag == 3{
            name = label3.text
            
        } else if sender.tag == 4{
            name = label4.text
            
        } else if sender.tag == 5{
            name = label5.text
        }
        
        
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

