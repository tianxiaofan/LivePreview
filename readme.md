

在学习qml过程中,可能大家都希望能有实时预览效果,,在网上找了找,找到个解决方案,原理就是使用 `QFileSystemWatcher` 实时监控本地文件,一旦文件有变化,利用Qml 中的 Loader 加载qml文件

**注意main.cpp中必须要设置本地绝对路径**

  `engine.hotLoad("E:/QTCloud/QmlLearn/LivePreview/qml/main.qml");`

左侧文件列表使用的是`QFileSystemModel` 这个qt官方有案例,本地文件增删时,列表也随之增删

效果:

![20210922144342](E:\QTCloud\QmlLearn\LivePreview\20210922144342.png)



其中qml 源码案例来自 qmlbook [http://qmlbook.github.io/index.html](http://qmlbook.github.io/index.html)

