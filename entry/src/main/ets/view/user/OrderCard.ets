import Teacher from '../../common/bean/Teacher'
import router from '@ohos.router'
import { Order } from '../../common/bean/Order'

@Builder function color_state ($: {state: string}){
  if ($.state === '已完成') {
    Text($.state)
      .fontColor($r('app.color.theme_color_blue'))
      .margin({
        top: 10,
        left: 50
      })
  }
  else if ($.state === '进行中'){
    Text($.state)
      .fontColor($r('app.color.theme_color'))
      .margin({
        top: 10,
        left: 50
      })
  }else {
    Text($.state)
      .fontColor($r('app.color.theme_color_red'))
      .margin({
        top: 10,
        left: 250
      })
  }
}

@Builder function content($: {text: string, content: string,unit?: string}){
  RelativeContainer(){
    Text($.text)
      .margin({
        right: 20,
        left: 15
      })
      .fontSize(16)
      .fontWeight(600)
      .alignRules({
        left: {
          anchor: "__container__",
          align: HorizontalAlign.Start
        },
        center: {
          anchor: "__container__",
          align: VerticalAlign.Center
        }
      })
      .id('text')

    Text($.content)
      .alignRules({
        left: {
          anchor: "text",
          align: HorizontalAlign.End
        },
        center: {
          anchor: "__container__",
          align: VerticalAlign.Center
        }
      })
      .id('content')

    Text($.unit)
      .margin({
        left: 10
      })
      .alignRules({
        left: {
          anchor: "content",
          align: HorizontalAlign.End
        },
        center: {
          anchor: "__container__",
          align: VerticalAlign.Center
        }
      })
      .id('unit')
  }
  .height(30)
  .width("90%")
  .margin({
    top: 5,
    bottom: 5
  })
}
@Component
export struct OrderCard {

  private Width: Length
  private Height: Length
  private Content: Order
  private Color: string

  build() {

      Column(){

        content({text: "订单编号", content: this.Content.id.toString()})
        content({text: "教师编号", content: this.Content.teacherId.toString()})
        content({text: "起始时间", content: this.Content.time.toString()})
        content({text: "持续时间", content: this.Content.during.toString(),unit: "HOUR"})
        content({text: "总计价格", content: this.Content.price.toString(),unit: "RMB"})

        Divider()
          .color('#454545')
          .strokeWidth(1)
          .width('90%')

        color_state({state: this.Content.state})



      }
      .alignItems(HorizontalAlign.Center)
      .width(this.Width)
      .height(this.Height)
      .backgroundColor(this.Color)
      .border({
        color: "#6b6b6b",
        width: 0,
        radius: 10
      })

  }
}