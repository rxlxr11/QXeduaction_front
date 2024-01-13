import AppContext from '@ohos.app.ability.common';
@Component
export struct ImageButton {

  Text: string = 'string'
  Color: string = '#6B9D68'
  Image: Resource | string = $rawfile('detail/physic_white.png')

  build() {

    Column(){

      Button({type: ButtonType.Normal}) {
        Image(this.Image)
          .width(45)
          .height(45)
      }
      .backgroundColor(this.Color)
      .width(60)
      .height(60)
      .margin(5)
      .borderRadius(8)
      .border({
        color: "#6b6b6b",
        width: 1,
      })

      Text(this.Text)

    }
    .margin(5)
    .width(80)
    .height(80)

  }
}