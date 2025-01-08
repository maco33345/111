@Entry
@Component
struct Count1 {
  @State message: string = 'Hello World'
  // @ts-ignore
  //工程款、工程款利率、工程款天数
  gongchengkuan:string='0'
  lilv:string='0'
  tianshu:string='0'
  //质保金、质保金利率、质保金天数
  gongchengkuan1:string='0'
  lilv1:string='0'
  tianshu1:string='0'


  @State resultGongc: string = '0' // 工程款利息
  @State resultZhib: string = '0' // 质保款利息
  @State result: string = '0' // 存储计算结果的变量
  //建设工程合同纠纷
  build() {
    Column() {
      // @ts-ignore
      Column({space:10}) {
        TextInput({placeholder:'请输入工程款'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
              this.gongchengkuan=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })

        TextInput({placeholder:'请输入利率(工程款)'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.lilv=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })

        TextInput({placeholder:'请输入天数(工程款)'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.tianshu=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })

        TextInput({placeholder:'请输入质保金'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.gongchengkuan1=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })

        TextInput({placeholder:'请输入利率(质保金)'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.lilv1=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })

        TextInput({placeholder:'请输入天数(质保金)'})
          .width(200)
          .height(50)
          .type(InputType.Normal)
          .onChange((value)=>{
            this.tianshu1=value
            this.calculateGongC();
            this.calculateZhiB()

            this.calculateResult();
          })




        Text(`逾期工程款利息：${this.resultGongc}`)
          .width(200)
          .height(50);
        Text(`逾期质保款利息：${this.resultZhib}`)
          .width(200)
          .height(50);
        Text(`逾期利息：${this.result}`)
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
  //计算工程款利息
  calculateGongC() {
  const result = parseFloat(this.gongchengkuan) * parseFloat(this.lilv) * parseFloat(this.tianshu);
  this.resultGongc = result.toString(); // 更新结果状态
}
  //计算质保款利息
  calculateZhiB() {
    const result = parseFloat(this.gongchengkuan1) * parseFloat(this.lilv1) * parseFloat(this.tianshu1);
    this.resultZhib = result.toString(); // 更新结果状态
  }
  //计算总金额
  calculateResult() {
    const result = parseFloat(this.gongchengkuan) + parseFloat(this.gongchengkuan1) + parseFloat(this.resultGongc) + parseFloat(this.resultZhib);
    this.result = result.toString(); // 更新结果状态
  }
}

