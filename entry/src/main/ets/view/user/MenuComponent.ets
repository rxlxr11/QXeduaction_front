
import { Service } from '../../common/constant/ServiceData';
import router from '@ohos.router';

@Builder function Menus($$: {Image: string | Resource ,Text: string}){

  Button({type: ButtonType.Normal}) {

    Row(){
      Image($$.Image)
        .width(25)
        .height(25)
        .margin(10)

      Text($$.Text)
        .fontColor(Color.Black)
        .margin({
          right: 250
        })

      Image($rawfile('user/arrow-right.png'))
        .width(25)
        .height(25)
        .margin(10)
    }
    .padding(5)
    .justifyContent(FlexAlign.Start)

  }
  .backgroundColor(Color.White)
  .border({
    width: {
      bottom: 0.5
    },
    color: $r('app.color.theme_color_gray')
  })
  .width('100%')
  .height(40)

}

@Component
export struct MenuComponent {

  private menuList: Service[] = [];
  private startPage: (text: string) => void = (text: string) => {};

  build() {
    List() {// List默认竖直方向排列子组件
      ForEach(this.menuList, (item: Service, index?: number) => {
        ListItem() {
          Menus({
            Image: item.Image,
            Text: item.Text
          })
        }.onClick(() => {
          this.startPage(item.Text);
        })
      })
    }
    .height(120)
    .width('100%')

  }
}