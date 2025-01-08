
import { CirclePage } from './CirclePage'
import {Tools} from './Tools'
import {MinePage} from './MinePage'
@Entry
@Component
struct Index {
  //当前访问的标签页的索引
  @State currentIndex:number = 0

  build() {

    Tabs(){
      //1、 答题模块
      TabContent(){

        Tools()

      }
      .tabBar(this.tabBarBuilder(0,'工具',$r('app.media.ic_practice'),$r('app.media.ic_practice_selected')))


      //2、圈子
      TabContent(){
        CirclePage()
      }
      .tabBar(this.tabBarBuilder(1,'圈子',$r('app.media.ic_circle'),$r('app.media.ic_circle_selected')))



      //3、个人中心
      TabContent(){
        MinePage()

      }
      .tabBar(this.tabBarBuilder(2,'我的',$r('app.media.ic_mine'),$r('app.media.ic_mine_selected')))

    }
    .width('100%')
    .height('100%')
    .vertical(false)
    .barPosition(BarPosition.End)
    .onChange((index)=>{
      this.currentIndex = index
    })
  }


  //自定义导航标签的UI片段
  @Builder
  tabBarBuilder(tab_index:number,tab_title:string,icon:Resource,icon_selected:Resource){
    Column({space:5}){
      Image(this.currentIndex === tab_index?icon_selected:icon)
        .width(25)
        .height(25)

      Text(tab_title)
        .fontSize(16)
        .fontColor(this.currentIndex === tab_index?'#ff89a082':'#ff535252')
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .backgroundColor(Color.White)
  }
}

