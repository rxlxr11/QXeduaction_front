import { AppFontSize, PERCENTAGE_100 } from '../../common/constant/Constants';
import { BottomBar } from '../../common/constant/DetailsConstants';
import prompt from '@ohos.prompt';

@CustomDialog struct CustomBatteryDialog {

  private controller: CustomDialogController; // 定义controller

  build() {
    Stack() {
      Column() {
        Text('请输入开始时间')
          .fontSize(20)
          .margin({top: 15})
        DatePicker({
          start: new Date('2024-1-1'), // 设置开始日期
          end: new Date('2030-1-1')    // 设置结束日期
        })
          .width(200)
          .height(120)
          .backgroundColor(Color.White)
          .onChange((date) => {          // 设置事件回调
            console.log(`selected time：${date.year}年${date.year}月${date.day}日`)
          })

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


@Component
export default struct BottomBarComponent {

  // 创建一个controller
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomBatteryDialog(), // 弹框的构造器
    cancel: () => {
      console.log("cancel")         // 点击蒙层的回调
    },
    autoCancel: true,               // 允许点击蒙层关闭弹窗
    customStyle: true               // 使用自定义样式
  });

  private user_id: number = 0
  private barHeight : Length = 0
  build() {
    Column() {
      Divider()
        .height(2)
        .backgroundColor('#bac0c6')
      Row() {

        Column(){
          Button(){
            Image($rawfile('detail/like_select.png'))
              .size({
                width: 35,
                height: 35
              })
          }
          .backgroundColor('#f1f3f5')
          .margin({
            right: 30,
            top: 10,
            bottom: 10
          })

          Text("收藏")
            .fontSize(14)
            .margin({
              right: 30
            })
        }

        Button('预约')
          .type(ButtonType.Normal)
          .height('100%')
          .width('35%')
          .backgroundColor($r('app.color.theme_color'))
          .fontColor(Color.White)
          .fontSize(20)
          .fontWeight(40)
          .onClick(function() {
            if (this.user_id === 0) {
              prompt.showToast({
                message: "请先登录"
              })
            }else {
              this.controller.open()    // 打开弹窗
            }

          }.bind(this))

      }

      .width('100%')
      .height(this.barHeight)
      .backgroundColor('#f1f3f5')
      .justifyContent(FlexAlign.End)
    }
  }
}