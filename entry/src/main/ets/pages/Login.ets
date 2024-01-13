import {ExInput, rxInput, rxLabel} from '../view/compoment/ExInput'
import {LoadingDialog} from '../view/compoment/Loading'
import { AppFontSize, PERCENTAGE_100 } from '../common/constant/Constants';
import router from '@ohos.router';
import AppContext from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { User } from '../common/bean/User';
import hilog from '@ohos.hilog';
import http from '@ohos.net.http';
import RequestMethod from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';
import LoginViewModel from '../ViewModel/LoginViewModel';
@CustomDialog struct CustomBatteryDialog {
  @Link errorMessage: string

  private controller: CustomDialogController; // 定义controller

  build() {
    Stack() {
      Column() {
        Text('登录失败')
          .fontSize(20)
          .margin({top: 15})
        Text(this.errorMessage)
          .fontSize(20)
          .fontColor($r('app.color.theme_color_red'))
          .margin({top: 15})
        Text()
          .size({width: "100%", height: "2px"})
          .backgroundColor("#bebbc1")
          .margin({top: 15})
        Text("确认")
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .fontColor("#317ef5")
          .height(50)
          .onClick(() => {
            this.controller.close(); // 关闭弹窗
          })
      }
      .backgroundColor("#e6ffffff")
      .borderRadius(20)
    }
    .padding({left: 40, right: 40})
    .width("100%")
  }
}



let viewModel: LoginViewModel = new LoginViewModel();


@Entry
@Component
struct Login {



  @State user: User = new User();
  @State errorMessage: string = ''

  // 创建一个controller
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomBatteryDialog({errorMessage: $errorMessage}), // 弹框的构造器
    cancel: () => {
      console.log("cancel")         // 点击蒙层的回调
    },
    autoCancel: true,               // 允许点击蒙层关闭弹窗
    customStyle: true               // 使用自定义样式
  });

  // 创建一个controller
  LoadController: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog(), // 弹框的构造器
    cancel: () => {
      console.log("cancel")         // 点击蒙层的回调
    },
    autoCancel: true,               // 允许点击蒙层关闭弹窗
    customStyle: true               // 使用自定义样式
  });

  requestLogin(){
    this.LoadController.open();
    viewModel.login(this.user.username,this.user.password).then((data: User) => {
      this.LoadController.close();
      console.log("http test2"+JSON.stringify(data))
      this.user = data;
      globalThis.user = this.user;
      globalThis.loginIF = true;
      router.pushUrl({
        url: "pages/test"
      })
    }).catch((err: string) => {
        this.LoadController.close();
        this.errorMessage = err;
        this.controller.open()  // 打开弹窗
    })
  }

  context = getContext(this) as AppContext.UIAbilityContext

  username_label = new rxLabel('Username',AppFontSize.LARGER,AppFontSize.LARGE,35,30,35,5)
  username_input = new rxInput(InputType.Normal,AppFontSize.LARGER,'#6b6b6b','#6b9d68',this.username_label)

  pwd_label = new rxLabel('Password',AppFontSize.LARGER,AppFontSize.LARGE,35,30,35,5)
  pwd_input = new rxInput(InputType.Password,AppFontSize.LARGER,'#6b6b6b','#6b9d68',this.pwd_label)

  build() {
    Row() {
      Column() {
        Text("Login")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        ExInput({rx_input:this.username_input}).margin(10)
        ExInput({rx_input:this.pwd_input}).margin(10)

        Button("Login")
          .height(50)
          .width(350)
          .fontSize(25)
          .fontColor('#ffffff')
          .backgroundColor('#6B9D68')
          .margin({ top: 20 ,bottom: 20})
          .type(ButtonType.Normal)
          .borderRadius(8)
          .onClick(()=>{
            this.user.username = this.username_input.Value;
            this.user.password = this.pwd_input.Value;
            this.requestLogin();


          })

        Text("forget password")
          .fontSize(18)
          .fontColor('#B45223')
          .margin({bottom: 30})
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({
              url: "pages/ForgetPwd"
            })
          })

        Divider()
          .height(2)


        Text("没有帐户")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20,bottom: 10 })

        Button("创建账户")
          .height(50)
          .width(350)
          .fontSize(20)
          .fontColor('#000000')
          .backgroundColor('#ffffff')
          .type(ButtonType.Normal)
          .borderRadius(8)
          .border({width: 1})
          .onClick(() => {
            router.pushUrl({
              url: "pages/Register"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

