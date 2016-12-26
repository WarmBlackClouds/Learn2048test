
import UIKit

class SettingViewController: UIViewController ,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControls()
        self.view.backgroundColor = UIColor.whiteColor()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupControls(){
        
        //创建文本框
        let txtNum = ViewFactory.createTextField("", action: Selector("numChanged"), sender: self)
        txtNum.frame = CGRect(x: 80, y: 100, width: 200, height: 30)
        txtNum.returnKeyType = UIReturnKeyType.Done
        self.view.addSubview(txtNum)
        
        //创建标签1
        let labelNum = ViewFactory.createLabel("值：")
        labelNum.frame = CGRect(x: 20, y: 100, width: 60, height: 30)
        self.view.addSubview(labelNum)
        
        //创建分段单选控件
        let segDimension = ViewFactory.createSegment(["3x3","4x4","5x5"], action: "dimensionChanged", sender: self)
        segDimension.frame = CGRect(x: 80, y: 200, width: 200, height: 30)
        self.view.addSubview(segDimension)
        
        segDimension.selectedSegmentIndex = 1
        
        //创建标签2
        let labelDm = ViewFactory.createLabel("维度：")
        labelDm.frame = CGRect(x: 20, y: 200, width: 60, height: 30)
        self.view.addSubview(labelDm)
    }

}
