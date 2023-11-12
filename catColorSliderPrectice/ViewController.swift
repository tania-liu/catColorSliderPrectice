//
//  ViewController.swift
//  catColorSliderPrectice
//
//  Created by 劉俐廷 on 2023/11/7.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bigPatternView: UIView!
    @IBOutlet weak var smallPatternView: UIView!
    
    @IBOutlet weak var patternSegment: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    //設定起始畫面
    override func viewDidLoad() {
        super.viewDidLoad()
        //叫出大斑圖檔傳入bigPatternImageView
        let bigPatternImageView = UIImageView(image: UIImage(named: "bigPattern"))
        //設定圖片外框跟view一樣大
        bigPatternImageView.frame = bigPatternView.bounds
        //設定圖片contentMode
        bigPatternImageView.contentMode = .scaleAspectFit
        //設定view的mask為圖片樣式
        bigPatternView.mask = bigPatternImageView
        //藉由更改背景顏色達到該區塊換顏色效果
        bigPatternView.backgroundColor = UIColor(red: 250/255 , green: 169/255, blue: 27/255, alpha: 1)
        
        //同上面步驟製作小斑區塊
        let smallPatternImageView = UIImageView(image: UIImage(named: "smallPattern"))
        smallPatternImageView.frame = smallPatternView.bounds
        smallPatternImageView.contentMode = .scaleAspectFit
        smallPatternView.mask = smallPatternImageView
        smallPatternView.backgroundColor = UIColor(red: 220/255, green: 98/255, blue: 2/255, alpha: 1)
        //設定初始segment為左邊第一個
        patternSegment.selectedSegmentIndex = 0
        //設定初始顏色對應到的slider值
        redSlider.value = 250
        greenSlider.value = 169
        blueSlider.value = 27
        //設定顏色標籤對應的數值
        updateLabel()
        //設定名稱、TextField為空白字串
        nameLabel.text = "阿花"
        nameTextField.text = ""
    }
    //更新RGB數值標籤function
    func updateLabel(){
        redLabel.text = "\(Int(redSlider.value))"
        greenLabel.text = "\(Int(greenSlider.value))"
        blueLabel.text = "\(Int(blueSlider.value))"
    }
    //更新圖片顏色function
    func updateColor(){
        if patternSegment.selectedSegmentIndex == 0{
            bigPatternView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        }else{
            smallPatternView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        }
    }
    
    //將TextField文字傳入Label
    @IBAction func enterPetName(_ sender: UITextField) {
        nameLabel.text = sender.text
    }
    
    //調整R參數
    @IBAction func adjustRedValue(_ sender: UISlider) {
        updateColor()
        updateLabel()
    }
    
    //調整G參數
    @IBAction func adjustGreenValue(_ sender: UISlider) {
        updateColor()
        updateLabel()
    }
    
    //調整B參數
    @IBAction func adjustBlueValue(_ sender: UISlider) {
        updateColor()
        updateLabel()
    }
    
    //設定亂數決定參數的按鈕
    @IBAction func pressGetRandom(_ sender: UIButton) {
        redSlider.value = Float.random(in: 0...225)
        greenSlider.value = Float.random(in: 0...225)
        blueSlider.value = Float.random(in: 0...225)
        updateColor()
        updateLabel()
        }
    
    //回到原始畫面
    @IBAction func pressToRedo(_ sender: UIButton) {
        viewDidLoad()
    }
}

    
    


