# PopMoreOperation

![这里写图片描述](http://img.blog.csdn.net/20160323005104798)

弹出框上的按钮分两个数组：
一个是在弹出框上部的滑动视图上的按钮，存放在shareBtnArray的数组中；
一个是在中间屏幕宽的按钮，存放在operationArray数组中。

点击弹出的按钮会触发代理方法：
```objc
#pragma mark Delegate 点击弹出框上按钮的代理方法
-(void)getClickButtonTag:(NSInteger)tag andTitle:(NSString *)title
{
    NSLog(@"你点击的button的tag是%i,%@",tag,title);
    [self.popView hiddenPopView];
}
```
然后就可以根据返回的tag处理对应的事件。

___

做的比较简单，总感觉还有更好的方式来处理这个弹出框以及后续相应的事件，我想要做到的是：
1. 尽量在ViewController中只需要极少的代码就可以弹出视图；
2. 点击后对应触发的事件，不要在ViewController中处理，避免造成controller的负重

如果你有更好的建议，请反馈给我，帮我提高一下，谢谢^_^。。。

___
