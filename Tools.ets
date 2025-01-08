import router from '@ohos.router';
@Entry
@Component
  // @ts-ignore
export struct Tools {
  @State message: string = 'Hello World'

  build() {
    Column() {
        //第一行两个功能
      Column({space:20}){
        Button('建设工程合同款项计算')
          .fontSize(20)
          .width(250)
          .height(50)
          .backgroundColor('#ff84eec1')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/Count1"

            })
          })

        Button('买卖合同款项计算')
          .fontSize(20)
          .width(250)
          .height(50)
          .backgroundColor('#ff84eec1')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/Count2"
            })
          })

        Button('民间借贷款项计算')
          .fontSize(20)
          .width(250)
          .height(50)
          .backgroundColor('#ff84eec1')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/Count3"
            })
          })
      }



    }
    //.backgroundColor('#00daf6e6')
    .backgroundImage($r("app.media.Picture4"))
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    //.alignItems(HorizontalAlign.Center)
  }


}