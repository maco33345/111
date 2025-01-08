import router from '@ohos.router';
import promptAction from '@ohos.promptAction'
@Entry
@Component
export struct AddQuestionPage {
  @State message: string = 'Hello World'
  @StorageProp('token') token: string = ''
  getUsername:string=''
  getQuestion:string=''
  build() {
    // 用户输入区域
    Column() {
      Column({ space: 5 }){
        TextInput({ placeholder: '请输入用户名' })
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value) => {
            this.getUsername = value
          })
        TextInput({ placeholder: '请输入您的问题' })
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value) => {
            this.getQuestion = value
          })

        // 发布按钮
        Button('发布')
          .width(200)
          .margin({ top: 50 })
          .onClick(async () => {
            promptAction.showToast({
              message:'发布成功',
              duration:2000,
              bottom:100
            })

            //返回上一个页面
            router.back()
          })
      }
      .width('100%')

    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r("app.media.Picture4"))
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
