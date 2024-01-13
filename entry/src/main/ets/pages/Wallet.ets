import router from '@ohos.router';
import AppContext from '@ohos.app.ability.common';

@CustomDialog struct CustomBatteryDialog {

  private controller: CustomDialogController; // 定义controller

  build() {
    Stack() {
      Column() {
        Text('请输入充值金额')
          .fontSize(20)
          .margin({top: 15})
        TextInput()
          .width('80%')
          .margin(15)
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


@Entry
@Component
struct Wallet {
  @State money:number = router.getParams()['money'];


  // 创建一个controller
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomBatteryDialog(), // 弹框的构造器
    cancel: () => {
      console.log("cancel")         // 点击蒙层的回调
    },
    autoCancel: true,               // 允许点击蒙层关闭弹窗
    customStyle: true               // 使用自定义样式
  });

  //private value: string = router.getParams()['value'];


  build() {
    Row() {
      Column() {

        Image($rawfile('detail/money.png'))
          .size({width: 50,height: 50})
          .margin(30)
        Text("我的零钱")
          .fontSize(15)
          .margin(10)
        Text(this.money.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("充值")
          .height(50)
          .width(200)
          .fontSize(20)
          .fontColor('#ffffff')
          .backgroundColor('#6B9D68')
          .margin({ top: 60 ,bottom: 20})
          .type(ButtonType.Normal)
          .borderRadius(8)
          .onClick(function() {
            this.controller.open()    // 打开弹窗
          }.bind(this))
      }
      .width('100%')
    }
    .height('100%')
  }
}