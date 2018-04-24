# NTHeaderStretchingTableViewController
#### 这是一个封装好的具有主流头部拉伸效果的UITableViewController
* 使用方法：

##### 1、导入"NTHeaderStretchingTableViewController.h"和"NTHeaderStretchingTableViewController.m"文件

##### 2、继承与NTHeaderStretchingTableViewController这个类，然后设置下列属性即可
	
	```objc
	// 将父控制器中的属性设置放在super的viewDidLoad之前
    self.headerImageHeight = 200;
    self.headerImageName = @"husky";
    self.navigationBackgroundImageName = @"navigationBackground";
    
    [super viewDidLoad];
    
	```

* 效果展示：

   ![示意图](示意图.gif) 
