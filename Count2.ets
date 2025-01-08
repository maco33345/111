@Entry
@Component
struct Count2 {
  @State message: string = 'Hello World'
  // @ts-ignore
  biaodi:string='0'
  lilv:string='0'
  tianshu:string='0'
  @State lixi: string = '0' // 利息
  @State result: string = '0' // 利息
  //买卖合同纠纷
  build() {
    Column() {
      Column({space:10}) {
        TextInput({placeholder:'请输入标的(欠款)'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.biaodi=value
            this.calculateLixi();
            this.calculateResult();
          })

        TextInput({placeholder:'请输入利率'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.lilv=value
            this.calculateLixi();
            this.calculateResult();
          })

        TextInput({placeholder:'请输入天数'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.tianshu=value
            this.calculateLixi();
            this.calculateResult();
          })

        Text(`利息：${this.lixi}`)
          .width(200)
          .height(50);

        Text(`总计：${this.result}`)
          .width(200)
          .height(50);



      }
      .width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r("app.media.Picture4"))
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  calculateLixi() {
    const lixi = parseFloat(this.biaodi) * parseFloat(this.lilv) * parseFloat(this.tianshu) *1.5;
    this.lixi = lixi.toString(); // 更新结果状态
  }
  calculateResult() {
    const result = parseFloat(this.biaodi) + parseFloat(this.lixi);
    this.result = result.toString(); // 更新结果状态
  }

}
