import router from '@ohos.router';
@Entry
@Component

export struct CirclePage {
  @StorageProp('token') token: string = ''
  getUsername:string=''
  getQuestion:string=''



  @State isLoading: boolean = false
  scroller: Scroller = new Scroller()
  page: number = 1
  total: number = 0

  // 帮助请求数组
  helpRequests: HelpRequest[] = []

  build() {
    // 定义求助问题的数据结构

    Column() {

      if (this.token) {
        //todo:打卡列表
        this.LoginBuilder()
      } else {
        //todo:未登录
        this.unLoginBuilder()
      }
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r("app.media.Picture4"))
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  //未登录页面UI
  @Builder
  unLoginBuilder() {
    Column({ space: 30 }) {
      Image($r("app.media.ic_unLogin_bg"))
        .width(177)
        .height(177)

      Text('未登录暂无数据')
        .fontSize(14)
        .fontColor('#999999')

      Button('去登录')
        .fontColor(Color.White)
        .fontSize(14)
        .width(100)
        .height(34)
        .backgroundColor('#43C6A0')
        .onClick(() => router.pushUrl({ url: 'pages/LoginPage' }))
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }

  //已登录
  // 修改后的未登录页面UI，允许用户发布求助问题
  @Builder
  LoginBuilder() {


    Column({ space: 30 }) {
        // 张三的内容
        Column({ space: 10 }) {
          Text('张三')
            .fontWeight(FontWeight.Bold)
          Text('财产纠纷问题')
            .fontSize(14)
            .fontColor('#333333')
          Text('详细描述：...')
            .fontSize(12)
            .fontColor('#666666')
        }
        .width(250)
        .height(120)
        .border({ color: '#CCCCCC', width: 1 })
        .padding(10)

        // 李四的内容
        Column({ space: 10 }) {
          Text('李四')
            .fontWeight(FontWeight.Bold)
          Text('劳动合同纠纷问题')
            .fontSize(14)
            .fontColor('#333333')
          Text('详细描述：...')
            .fontSize(12)
            .fontColor('#666666')
        }
        .width(250)
        .height(120)
        .border({ color: '#CCCCCC', width: 1 })
        .padding(10)

        // 王五的内容
        Column({ space: 10 }) {
          Text('王五')
            .fontWeight(FontWeight.Bold)
          Text('民间欠款纠纷问题')
            .fontSize(14)
            .fontColor('#333333')
          Text('详细描述：...')
            .fontSize(12)
            .fontColor('#666666')
        }
        .width(250)
        .height(120)
        .border({ color: '#CCCCCC', width: 1 })
        .padding(10)




      // 用户输入区域
      Column({space:10}) {
        // 发布按钮
        Button('添加问题')
          .width(200)
          .margin({ top: 50 })
          .onClick(()=>{
            router.pushUrl({
              url:"pages/AddQuestionPage"
            })
          })


      }

    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
  }



}
interface HelpRequest {
  username: string;
  question: string;
}
