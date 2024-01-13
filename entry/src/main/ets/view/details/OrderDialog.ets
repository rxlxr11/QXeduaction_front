import { Order } from '../../common/bean/Order';
@CustomDialog struct OrderDialog {

  private controller: CustomDialogController; // 定义controller
  private  order: Order = new Order()

  build() {
    Stack() {
      Column()
      {
        Text('请输入日期')
          .fontSize(20)
          .margin({top: 15})
        DatePicker({
          start: new Date('2000-1-1'), // 设置开始日期
          end: new Date('2030-1-1')    // 设置结束日期
        })
          .width(200)
          .height(120)
          .backgroundColor('#aabbcc')
        Text("请输入时长")
        TextInput()
        Text()
          .size({width: "100%", height: "2px"})
          .backgroundColor("#bebbc1")
          .margin({top: 15})
        Row() {
          Text("关闭")
            .height("100%")
            .fontColor(Color.Red)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .fontSize(18)
            .onClick(() => {
              this.controller.close(); // 关闭弹窗
            })
          Text()
            .size({width: "2px", height: "100%"})
            .backgroundColor("#bebbc1")
          Text("确认")
            .textAlign(TextAlign.Center)
            .fontSize(18)
            .fontColor("#317ef5")
            .height("100%")
            .layoutWeight(1)
            .onClick(() => {
              this.controller.close(); // 关闭弹窗
            })
        }
        .height(45)
        .width('100%')
      }
      .backgroundColor("#e6ffffff")
      .borderRadius(20)
    }
    .padding({left: 40, right: 40})
    .width("100%")
  }
}