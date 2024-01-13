import Teacher from '../../common/bean/Teacher'
import router from '@ohos.router'

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
@Component
export struct Card {

  private userID: number
  private Width: Length
  private Height: Length
  private Content: Teacher
  private Color: string

  build() {
    Row(){
      Image(this.Content.image)
      .objectFit(ImageFit.Fill)
      .width("33%")
      .height("100vw")


      Column(){

        content({text: "姓名", content: this.Content.name})
        content({text: "薪资", content: this.Content.salary.toString()})
        content({text: "科目", content: this.Content.subject})

      }
      .width("67%")
      .height("100%")
      .alignItems(HorizontalAlign.End)
    }
    .onClick(()=>{
      router.pushUrl({
        url: "pages/DetailsPage",
        params: {
          teacher: this.Content,
          user_id: this.userID
        }
      })
    })
    .padding(10)
    .width(this.Width)
    .height(this.Height)
    .backgroundColor(this.Color)
    .border({
      color: "#6b6b6b",
      width: 0,
      radius: 10
    })

  }
}