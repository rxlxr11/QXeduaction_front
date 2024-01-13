import { User } from '../../common/bean/User';
import router from '@ohos.router';
@Component
export struct ExitButton {


  build() {
    Button("退出登录")
      .height(50)
      .width(350)
      .fontSize(25)
      .fontColor('#ffffff')
      .backgroundColor('#F56C6C')
      .margin({ top: 20 ,bottom: 40})
      .type(ButtonType.Normal)
      .borderRadius(8)
      .onClick(()=>{
        globalThis.loginIF = false;
        globalThis.user = new User();
        router.pushUrl({
          url: "pages/test"
        })
      })

  }
}