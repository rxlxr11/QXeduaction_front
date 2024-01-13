
import ServiceComponent from '../view/user/ServiceComponent';
import { Service } from '../common/constant/ServiceData';
import UserViewModel from '../ViewModel/UserViewModel';
import AppContext from '@ohos.app.ability.common';
import { User } from '../common/bean/User';
import { LoginButton } from '../view/user/LoginButtonComponent';
import { ExitButton } from '../view/user/ExitButtonComponent';
import { MenuComponent } from '../view/user/MenuComponent';
import router from '@ohos.router';
import { Order } from '../common/bean/Order';

@Builder function IfLogin($$: {is: boolean}){
  if ($$.is){
    ExitButton()
  }else {
    LoginButton()
  }
}

@Builder function content($: {text: string, content: string}){
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
  }
  .height(30)
  .width(200)
  .margin({
    top: 5,
    bottom: 5
  })
}

let viewModel: UserViewModel = new UserViewModel();

@Component
export struct UserContent {


  @Link login: boolean

  @Link user: User

  @State serviceList: Service[] = [];
  @State MenuList: Service[]= [];
  // @State OrderList: Order[]=[];


  // requestOrder() {
  //   console.log("http test1"+typeof this.user.id.toString())
  //   UserViewModel.getOrder(this.user.id.toString()).then((data: Order[]) => {
  //     this.OrderList = [...data];
  //     console.log("http test1_1"+data[0].user_id.toString())
  //
  //   }).catch((err: string | Resource) => {
  //
  //   })
  // }

  aboutToAppear(){
    this.serviceList = viewModel.getService();
    this.MenuList = viewModel.getMenu();
    // this.requestOrder();
  }

  build() {
    Column() {
      Column() {

        Row() {
          Image(this.user.image)
            .objectFit(ImageFit.Fill)
            .width("33%")

          Column() {
            content({ text: "姓名", content: this.user.username })
            content({ text: "邮箱", content: this.user.email })
          }
        }
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)

        Row(){
          Button({type: ButtonType.Normal}) {
            Row(){
              Image($rawfile('user/wallet.png'))
                .width(45)
                .height(45)
              Text('钱包')
                .fontColor(Color.White)
            }
          }
          .onClick(()=>{
            router.pushUrl({
              url: "pages/Wallet",
              params: {
                money: this.user.price
              }
            })
          })
          .backgroundColor('#67C23A')
          .width(175)
          .height(80)
          .margin(10)
          .borderRadius(8)

          Button({type: ButtonType.Normal}) {
            Row(){
              Image($rawfile('user/order.png'))
                .width(45)
                .height(45)
              Text('订单')
                .fontColor(Color.White)
            }
          }
          .onClick(()=>{
            router.pushUrl({
              url:"pages/OrderPage",
              params:{
                user_id: this.user.id
              }
            })

          })
          .backgroundColor('#409eff')
          .width(175)
          .height(80)
          .margin(10)
          .borderRadius(8)
        }
        .margin(10)


        MenuComponent({
          menuList: this.MenuList,
          startPage: (text) => {
              router.pushUrl({
                url: 'pages/NewPage',
                params:{
                  message: text
                }
              })
          }
        })

      }
      .height('87%')


      //Text(this.login.toString())

      IfLogin({ is: this.login })


    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }

}