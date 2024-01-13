import {Card} from '../view/compoment/Card'
import Teacher from '../common/bean/Teacher'
import HomeViewModel from '../ViewModel/HomeViewModel'
import AppContext from '@ohos.app.ability.common';
import SubjectComponent from '../view/home/SubjectComponent';
import SubjectData,{ Subject } from '../common/constant/SubjectData';
import { Form } from '../common/bean/Form';

let viewModel: HomeViewModel = new HomeViewModel();


@Component
export struct HomeContent {


  @Link form: Form ;



  @State subjectList: Subject[] = [];
  @Link currentIndex: number
  @Link Teachers: Teacher[];

  requestTeacher() {
    HomeViewModel.getTeachers(this.form).then((data: Teacher[]) => {
      this.Teachers = [...data];
    }).catch((err: string | Resource) => {

    })
  }

  aboutToAppear() {

    SubjectData.Subject_Map = new Map;
    SubjectData.Subject_Map.set(0,"语文");
    SubjectData.Subject_Map.set(1,"数学");
    SubjectData.Subject_Map.set(2,"英语");
    SubjectData.Subject_Map.set(3,"物理");
    SubjectData.Subject_Map.set(4,"化学");
    SubjectData.Subject_Map.set(5,"音乐");
    SubjectData.Subject_Map.set(6,"计算机");
    SubjectData.Subject_Map.set(7,"其他");


    this.subjectList = viewModel.getSubject();
  }

  private tabsController: TabsController = new TabsController();
  private swiperController: SwiperController = new SwiperController();

  build() {
    Column(){

      Swiper(this.swiperController) {
        // 绑定翻页控制器
        Image('http://www.rxlxr.com/images/ok/login-bgimg.jpg')
          .objectFit(ImageFit.Fill)
          .width('100%')
          .borderRadius(5)
        Image('http://www.rxlxr.com/images/ok/mianbao.jpg')
          .objectFit(ImageFit.Fill)
          .width('100%')
          .borderRadius(5)
        Image('http://www.rxlxr.com/images/ok/hk1.jpg')
          .objectFit(ImageFit.Fill)
          .width('100%')
          .borderRadius(5)
      }
      .width('90%')
      .height(220)
      .margin(10)
      .padding(0)
      .index(0)                      // 默认显示第1页
      .indicator(true)               // 显示导航指示器
      .autoPlay(true)
      .loop(true)

      Tabs({// Tabs不设置vertical属性时，默认上下排版
        barPosition: BarPosition.Start,
        controller: this.tabsController
      }) {
        TabContent() {
          SubjectComponent({ subjectList: this.subjectList, startPage: (index) => {

            this.form.subject = SubjectData.Subject_Map.get(index);
            this.requestTeacher()
            this.currentIndex  = 1

          } })
        }
        .size({width: "100%", height: "100%"})
        .tabBar("科目")

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor("#bbccaa")
        }
        .size({width: "100%", height: "100%"})
        .tabBar("年级")

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor("#ccaabb")
        }
        .size({width: "100%", height: "100%"})
        .tabBar("其他")
      }
      .size({width: "90%", height: 250})



      Text('推荐教师')
        .fontColor($r('app.color.theme_color_gray'))
        .fontSize(15)
        .margin({
          top: 15,
          bottom: 10,
          left: -175
        })

      Card({
        Content: new Teacher(),
        Color: '#ffffff',
        Width: 375,
        Height: 150
      })

      Text('免责声明')
        .margin({
          top: 20
        })
        .fontColor('#409eff')


    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .padding(0)

  }


}