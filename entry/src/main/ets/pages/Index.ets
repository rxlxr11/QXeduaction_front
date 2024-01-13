import {ExInput, rxInput, rxLabel} from '../view/compoment/ExInput'
import emitter from '@ohos.events.emitter'
import router from '@ohos.router';

@Entry
@Component
struct Index {


  build() {
    Row() {
      Column() {
        Button("test")
          .onClick(() => {
            router.pushUrl({
              url: "pages/test"
            })
          })

        
        Button("login")
          .onClick(() => {
            router.pushUrl({
              url: "pages/Login"
            })
          })

        Button("detail")
          .onClick(() => {
            router.pushUrl({
              url: "pages/DetailPage",
              params: {value: 20}
            })
          })


      }
      .width('100%')
    }
    .height('100%')
  }
}


