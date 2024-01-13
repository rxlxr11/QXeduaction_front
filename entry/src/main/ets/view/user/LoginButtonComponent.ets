
import router from '@ohos.router'
@Component
export struct LoginButton {

  build() {
    Button("登录")
      .height(50)
      .width(350)
      .fontSize(25)
      .fontColor('#ffffff')
      .backgroundColor($r('app.color.theme_color'))
      .margin({ top: 20 ,bottom: 40})
      .type(ButtonType.Normal)
      .borderRadius(8)
      .onClick(()=>{
        router.pushUrl({
          url: 'pages/Login'
        })
      })

  }
}