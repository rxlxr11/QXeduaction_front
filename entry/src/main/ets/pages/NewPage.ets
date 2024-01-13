import router from '@ohos.router'
import { MenuComponent } from '../view/user/MenuComponent'
@Entry
@Component
struct NewPage {
  @State message: string = router.getParams()['message']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)


      }
      .width('100%')
    }
    .height('100%')
  }
}