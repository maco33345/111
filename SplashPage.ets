import router from '@ohos.router';
// 变量持久化
PersistentStorage.PersistProp('token', '')

//在AppStorage中创建一个currentTabIndex数据
AppStorage.SetOrCreate('currentTabIndex', 0)

@Entry
@Component

struct SplashPage {
  //状态变量，决定动画组件是否展示
  @State flag:boolean = false;
  //在页面展示时自动执行由系统调用
  onPageShow(){

    animateTo({
      //执行时间1.5s
      duration:1500,
      onFinish: ()=>{
        setTimeout(()=>{
          router.replaceUrl({
            url:'pages/Index'
          })
        },2000)

      }
    },()=>{
      this.flag = true
    })

  }
  build() {
    Column(){
      if(this.flag) {
        Image($r('app.media.Picture5'))
          .width(90)
          .height(90)
          .margin({ top: 100 })
            //-：从左往右，+从右往左
          .transition({ type: TransitionType.Insert, opacity: 0, translate: { x: -150 } })

        Text('忒弥斯法律援助神器')
          .fontSize(21)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 15 })
          .transition({ type: TransitionType.Insert, opacity: 0, translate: { x: 150 } })
      }
      Blank()

      Text('Welcome')
        .fontSize(12)
        .fontColor('#ffe5e3e3')
        .fontWeight(FontWeight.Bold)
        .margin({bottom:30})

    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.img_splash_bg'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }
}