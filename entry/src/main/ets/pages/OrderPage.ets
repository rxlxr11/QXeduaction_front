import {Order}  from '../common/bean/Order';
import UserViewModel from '../ViewModel/UserViewModel';
import router from '@ohos.router';
import { OrderCard } from '../view/user/OrderCard';

@Builder function Orders($: {order: Order[]}){
  if ($.order.length == 0){
    Text('空')
  }else {
    List() { // List默认竖直方向排列子组件
      ForEach($.order, (item: Order, index?: number) => {
        ListItem() {
          OrderCard({
            Content: item,
            Color: '#ffffff',
            Width: 375,
            Height: 250
          })
        }
        .width('100%')
      })
    }
    .margin(5)
    .height('100%')
    .width('100%')
    .divider({
      strokeWidth: 6,   // 设置分割线宽度
      color: '#f1f2f4'
    })
  }
}
@Entry
@Component
struct OrderPage {

  private User_id: number = router.getParams()['user_id']
  //@State OrderList: Order[] = router.getParams['orders'];
  @State OrderList: Order[]=[];


  requestOrder() {
    console.log("http test1"+typeof this.User_id.toString())
    UserViewModel.getOrder(this.User_id.toString()).then((data: Order[]) => {
      this.OrderList = [...data];
      console.log("http test1_1"+data.length)

    }).catch((err: string | Resource) => {

    })
  }

  // requestOrder() {
  //   console.log("http test1"+typeof this.user_id.toString())
  //   UserViewModel.getOrder(this.user_id.toString()).then((data: Order[]) => {
  //     this.OrderList = [...data];
  //
  //   }).catch((err: string | Resource) => {
  //
  //   })
  // }

  aboutToAppear(){
    this.requestOrder()
  }

  build() {

      Column() {
        Row(){
          Button(){
            Image($rawfile('index/back.png'))
              .size({
                height: 40,
                width: 40
              })
          }
          .margin({
            top: 5,
            bottom: 5,
            left: 15
          })
          .backgroundColor(Color.White)
          .onClick(()=>{
            router.back()
          })
        }
        .justifyContent(FlexAlign.Start)
        .backgroundColor(Color.White)
        .width('100%')

        Orders({order: this.OrderList})
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .backgroundColor($r('app.color.background_color_1'))
      .height('100%')
    }


}