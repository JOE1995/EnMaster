//
//  ViewController.swift
//  EnMaster
//
//  Created by 矢吹祐真 on 2016/05/31.
//  Copyright © 2016年 矢吹祐真. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    

    //前Viewkら受け継ぐ班の指定
    var groupNumber:Int!
    
    //Buttonの宣言
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    
    //ImageVIewの宣言
    @IBOutlet var image1:UIImageView!
    @IBOutlet var image2:UIImageView!
    
    //Labelの宣言
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    
    //nameの宣言
    var name:String!
    
    
    //png画像をUIImageにしておく
    let miya = UIImage(named: "miya.png")
    let kuwa = UIImage(named: "kuwa.png")
    let itaya = UIImage(named: "itaya.png")
    let toshi = UIImage(named: "toshi.png")
    let reirei = UIImage(named: "reirei.png")
    let teximo = UIImage(named: "tximo.png")
    let moki = UIImage(named: "moki.png")
    let piyo = UIImage(named: "piyo.png")
    let hibiki = UIImage(named: "hibiki.png")
    let yuka = UIImage(named: "yuka.png")
    let kito = UIImage(named: "kito.png")
    let hachi = UIImage(named: "hachi.png")
    let kenken = UIImage(named: "kenken.png")
    let cherry = UIImage(named: "cherry.png")
    let kaho = UIImage(named: "kaho.png")
    let yamamon = UIImage(named: "yamamon.png")
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景を変更
        self.view.backgroundColor = UIColor.turquoiseColor()
        //textの色を白に変更
        label1.textColor = UIColor.whiteColor()
        label2.textColor = UIColor.whiteColor()
        
        //全班の配列を作成
        var tmpArray = [[String]]()
        tmpArray.append(["みや","くわっち",
                        "いたやん","トシ",
                        "れいれい","ティモ",
                        "MOKI","ピヨ",
                        "ひびき","ゆか",
                        "はち","きとぅ",
                        "けんけん","ちぇりー",
                        "かほ","やまもん"])
        
        
/*
        tmpArray.append(["いたやん","トシ"])
        tmpArray.append(["れいれい","ティモ"])
        tmpArray.append(["MOKI","ピヨ"])
        tmpArray.append(["ひびき","ゆか"])
        tmpArray.append(["はち","きとぅ"])
        tmpArray.append(["けんけん","ちぇりー"])
        tmpArray.append(["かほ","やまもん"])
*/
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        switch groupNumber {
        case 1:
            image1.image = miya
            image2.image = kuwa
            
            label1.text = String(tmpArray[0][0])
            label2.text = String(tmpArray[0][1])

        case 2:
            label1.text = String(tmpArray[0][2])
            label2.text = String(tmpArray[0][3])

            image1.image = itaya
            image2.image = toshi
        
        case 3:
            label1.text = String(tmpArray[0][4])
            label2.text = String(tmpArray[0][5])
            
            image1.image = reirei
            image2.image = teximo
            
            
        case 4:
            label1.text = String(tmpArray[0][6])
            label2.text = String(tmpArray[0][7])
            
            image1.image = moki
            image2.image = piyo
            
        case 5:
            label1.text = String(tmpArray[0][8])
            label2.text = String(tmpArray[0][9])
            
            image1.image = hibiki
            image2.image = yuka
            
        case 6:
            label1.text = String(tmpArray[0][10])
            label2.text = String(tmpArray[0][11])
            
            image1.image = hachi
            image2.image = kito
        
        case 7:
            label1.text = String(tmpArray[0][12])
            label2.text = String(tmpArray[0][13])
            
            image1.image = kenken
            image2.image = cherry
            
        case 8:
            label1.text = String(tmpArray[0][14])
            label2.text = String(tmpArray[0][15])
            
            image1.image = kaho
            image2.image = yamamon
            
            
        default:
            break
        }
       
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
    
        if sender.tag == 1{
            name = label1.text!

        } else{
            name = label2.text
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

