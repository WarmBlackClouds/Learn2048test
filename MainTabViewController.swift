
import UIKit

class MainTabViewController: UITabBarController ,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // 一共包含了两个视图
        let viewMain = MainViewController()
        viewMain.title = "2048"
        
        let viewSetting = SettingViewController()
        viewSetting.title = "设置"
        
        //分别声明两个视图控制器
        let main = UINavigationController(rootViewController: viewMain)
        let setting = UINavigationController(rootViewController: viewSetting)
        
        self.viewControllers = [
            main,setting
        ]
        
        //默认选中的是游戏的主界面视图
        self.selectedIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSwipeGuestures(){
        //监控向上的方向，相应的处理方法swipeUp
        let upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeUp"))
        
        upSwipe.numberOfTouchesRequired = 1
        upSwipe.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(upSwipe)
        //监控向下的方向
        let downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("downSwipe"))
        
        downSwipe.numberOfTouchesRequired = 1
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(downSwipe)
        //向左
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("leftSwipe"))
        
        leftSwipe.numberOfTouchesRequired = 1
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipe)
        //向右
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("rightSwipe"))
        
        rightSwipe.numberOfTouchesRequired = 1
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipe)
    }

}
