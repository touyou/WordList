//
//  AddViewController.swift
//  WordList
//
//  Created by 藤井陽介 on 2016/02/02.
//  Copyright © 2016年 touyou. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 追加された単語を保存する、両方うめないとセーブできないようにする
    @IBAction func saveWord() {
        if englishTextField.text! == "" || japaneseTextField.text! == "" {
            let alert = UIAlertController(title: "入力エラー", message: "全ての欄を記入してください", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            wordArray.append(wordDictionary)
            saveData.setObject(wordArray, forKey: "WORD")
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました。",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
