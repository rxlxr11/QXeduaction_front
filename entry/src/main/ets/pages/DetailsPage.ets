import Teacher from '../common/bean/Teacher';
import BottomBarComponent from '../view/details/BottomBarComponent'
import router from '@ohos.router';
import { BasicInformationComponent, TeacherInformationComponent } from '../view/details/InformationFormComponent';

@Entry
@Component
struct DetailsPage {

  private user_id = router.getParams()['user_id']
  @State teacher: Teacher = router.getParams()['teacher'];



  build() {
    Column() {
      Scroll() {
        Column(){
          BasicInformationComponent({basic: $teacher})
          TeacherInformationComponent({teacher:$teacher})
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .backgroundColor($r('app.color.background_color_1'))
      .height('90%')


      BottomBarComponent({
        barHeight: 74,
        user_id: this.user_id
      })

    }
    .alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')

  }
}