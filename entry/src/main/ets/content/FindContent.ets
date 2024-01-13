import {Card} from '../view/compoment/Card'
import Teacher from '../common/bean/Teacher'
import FindViewModel from '../ViewModel/FindViewModel'
import router from '@ohos.router';
import { Form } from '../common/bean/Form';
import SubjectData from '../common/constant/SubjectData'
import Classify from '../view/find/Classify';
import HomeViewModel from '../ViewModel/HomeViewModel';



@Component
export struct FindContent {

  @Link items: Teacher[];
  private userID: number
  @State form : Form = new Form()
  @State fold: boolean = false

  aboutToAppear(){
    // if(router.getParams()['form']){
    //   this.form = router.getParams()['form']
    // }
  }

  requestTeacher() {
    HomeViewModel.getTeachers(this.form).then((data: Teacher[]) => {
      this.items = [...data];
    }).catch((err: string | Resource) => {

    })
  }


  build() {
    Column(){

      Row(){
        Text("分类")
          .fontSize(20)
          .fontWeight(400)
          .margin({
            right: 250
          })

        Button("提交")
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor($r('app.color.theme_color'))
          .fontColor(Color.White)
          .onClick(()=>{
            this.requestTeacher()
          })
          .margin({
            right: 10
          })


        Button({type: ButtonType.Circle}){
          Image(this.fold? $rawfile('index/double-arrow-down.png'): $rawfile('index/double-arrow-up.png'))
            .size({height: 40, width: 40})
        }
        .backgroundColor(Color.White)
        .onClick(()=>{
          if (this.fold){
            this.fold = false
          }else{
            this.fold = true
          }
        })
      }
      .width('100%')
      .backgroundColor(Color.White)

      if (this.fold){
        Classify({form: $form})
      }



      List() { // List默认竖直方向排列子组件
        ForEach(this.items, (item: any, index?: number) => {
          ListItem() {
            Card({
              userID: this.userID,
              Content: item,
              Color: '#ffffff',
              Width: 375,
              Height: 150
            })
          }
          .width('100%')
        })
      }
      .margin(5)
      .height('100%')
      .width('100%')
      .divider({
        strokeWidth: 6,   // 设置分割线宽度
        color: '#f1f2f4'
      })
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Center)
  }
}