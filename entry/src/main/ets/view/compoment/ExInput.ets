
export class rxLabel {
  Text: string;

  FontSize: number;

  FontSize_Focus: number;
  FontSize_Blur: number;

  Position_x: number;
  Position_y: number;

  Position_Blur_x: number;
  Position_Blur_y: number;

  Position_Focus_x: number;
  Position_Focus_y: number;

  constructor(text: string,
              fontSize: number, fontSize_focus: number,
              position_x: number, position_y: number,
              position_focus_x: number, position_focus_y: number) {
    this.Text = text

    this.FontSize = fontSize
    this.FontSize_Blur = fontSize
    this.FontSize_Focus = fontSize_focus

    this.Position_Blur_x = position_x
    this.Position_Blur_y = position_y

    this.Position_x = position_x
    this.Position_y = position_y

    this.Position_Focus_x = position_focus_x
    this.Position_Focus_y = position_focus_y
  }


}

export class rxInput {
  Label?: rxLabel;

  FontSize: number;

  BottomColor: string;

  BottomColor_Blur: string
  BottomColor_Focus: string;

  Type: number;
  Value: string = '';

  constructor(type: number = InputType.Normal,fontSize: number, bottomColor: string,
              bottomColor_focus: string, label?: rxLabel)
  {
    this.Type = type
    this.FontSize = fontSize
    this.BottomColor = bottomColor
    this.BottomColor_Blur = bottomColor
    this.BottomColor_Focus = bottomColor_focus
    if (label){
      this.Label = label
    }
  }

  focus(fontSize: number, x?: number, y?: number) {

    if (this.Label != null && x != null && y != null){
      this.Label.FontSize = fontSize
      this.Label.Position_x = x
      this.Label.Position_y = y
    }

    this.BottomColor = this.BottomColor_Focus
  }

  blur(fontSize: number, x?: number, y?: number)
  {
    if (this.Label != null && x != null && y != null && this.Value == ''){
      this.Label.FontSize = fontSize
      this.Label.Position_x = x
      this.Label.Position_y = y
    }

    this.BottomColor = this.BottomColor_Blur
  }

}


@Component
export struct ExInput {

  @State private rx_input : rxInput = null;

  build() {
    Column({space: 10}) {
      RelativeContainer() {

        TextInput()
          .id("input")
          .type(this.rx_input.Type)
          .width(350)
          .fontSize(this.rx_input.FontSize)
          .aspectRatio(6)
          .backgroundColor('#ffffff')
          .caretColor(Color.Black)
          .border({
            color: this.rx_input.BottomColor,
            width: {
              bottom: 2
            },
            radius: 0,
            style: BorderStyle.Solid
          })
          .alignRules({
            middle: {
              anchor: "__container__",
              align:HorizontalAlign.Center
            },
            bottom: {
              anchor: "__container__",
              align:VerticalAlign.Bottom
            }
          })
          .onChange((value) => {
            this.rx_input.Value = value;
          })
          .onFocus(() => {
            this.rx_input.focus(
              this.rx_input.Label.FontSize_Focus,
              this.rx_input.Label.Position_Focus_x,
              this.rx_input.Label.Position_Focus_y)
          })
          .onBlur(() => {
            this.rx_input.blur(
              this.rx_input.Label.FontSize_Blur,
              this.rx_input.Label.Position_Blur_x,
              this.rx_input.Label.Position_Blur_y)
          })

        Text(this.rx_input.Label.Text)
          .id("label")
          .fontColor('#6b6b6b')
          .fontSize(this.rx_input.Label.FontSize)
          .position({
            x: this.rx_input.Label.Position_x,
            y: this.rx_input.Label.Position_y
          })
          .animation({
            duration: 300,
            curve: Curve.Friction,
            playMode: PlayMode.Normal
          })
      }
      .width("100%")
      .height(80)
      .backgroundColor(Color.White)

    }
  }
}