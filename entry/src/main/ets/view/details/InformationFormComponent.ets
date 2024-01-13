import Teacher from '../../common/bean/Teacher'

@Builder export function InformationBuilder($$: {text1: string,text2: string}) {

    Row(){
      Text($$.text1)
        .margin({
          right: 50
        })
        .fontColor($r('app.color.theme_color_gray'))
      Text($$.text2)
        .width('75%')
        .margin({
          right: 20
        })
    }
    .margin(0)
    .padding(10)
    .backgroundColor(Color.White)
    .width("100%")
    .border({
      width: {
        bottom: 1
      },
      color: $r('app.color.theme_color_gray')
    })

}

@Component
export struct BasicInformationComponent {

  @Link basic : Teacher


  build() {
    Column() {
      Text('基础信息')
        .margin(10)
      InformationBuilder({text1: '姓名',text2: this.basic.name})
      InformationBuilder({text1: '性别',text2: this.basic.gender})
      InformationBuilder({text1: '年龄',text2: this.basic.age.toString()})
      InformationBuilder({text1: '学历',text2: this.basic.qualification})

      Row(){
        Text('照片')
          .margin({
            right: 50
          })
          .fontColor($r('app.color.theme_color_gray'))
        Image(this.basic.image)
          .size({
            width: 70,
            height: 70
          })
      }
      .backgroundColor(Color.White)
      .width("100%")
      .padding(10)
      .border({
        width: {
          bottom: 1
        },
        color: $r('app.color.theme_color_gray')
      })

    }
    .margin({
      top: 5,
      bottom: 5
    })
  }
}

@Component
export struct TeacherInformationComponent {

  @Link teacher : Teacher
  build() {
    Column() {
      Text('家教信息')
        .margin(10)
      InformationBuilder({text1: '姓名',text2: this.teacher.name})
      InformationBuilder({text1: '科目',text2: this.teacher.subject})
      InformationBuilder({text1: '薪资',text2: this.teacher.salary.toString()})
      InformationBuilder({text1: '能力',text2: this.teacher.ability})
      InformationBuilder({text1: '教龄',text2: this.teacher.year.toString()})

    }
    .margin({
      top: 5,
      bottom: 5
    })
  }
}