
import { User } from '../common/bean/User'
import { FindContent } from '../content/FindContent'
import { HomeContent } from '../content/HomeContent'
import { UserContent } from '../content/UserContent'
import router from '@ohos.router'
import Teacher from '../common/bean/Teacher'
import { HomeModel } from '../model/DataModel'
import HomeViewModel from '../ViewModel/HomeViewModel'
import { IState } from '../model/istate'
import { Form } from '../common/bean/Form'


@Entry
@Component
struct Index {


  @State login: boolean = false;
  @State user: User = new User();
  @State list: HomeModel = new HomeModel();
  @State Teachers: Teacher[] = []
  @State currentIndex: number = 0
  @State form: Form = new Form()


  requestTeacher() {
    HomeViewModel.getTeachers(new Form()).then((data: Teacher[]) => {
      this.list.TeacherData = [...data];
      this.Teachers = [...data]
      // if (this.Teachers.length >= 0) {
      //   this.Hot = this.Teachers[0];
      // }

      this.list.status = IState.Success;
    }).catch((err: string | Resource) => {
      this.list.status = IState.Fail
    })
  }


  aboutToAppear(){
    this.requestTeacher();
    this.login= globalThis.loginIF;
    if (this.login)
    {
      this.user = globalThis.user;
      console.error("http test2"+JSON.stringify(this.user));

    }else {
      this.user = new User()
    }
    console.error("http result:"+JSON.stringify(this.Teachers));


  }





  @Builder title() {// 通过Builder自定义标题栏，可以灵活的设置标题样式
      Row() {
        Text('倾心家教')
          .fontSize(20)


        Search()
          .width('50%')
          .onSubmit((value)=>{
            this.currentIndex = 1;
          })


      }
      .width("120%")
      .height(55)
      .margin({
        left: -30
      })
      .padding({
        left:20
      })
      .backgroundColor('#6b9d68')

  }

  @Builder tabBuilder(index: number, title: string, selectedImage: Resource, normalImage: Resource) {
    Column() {
      Image(this.currentIndex == index ? selectedImage : normalImage)
        .size({width: 25, height:25})
      Text(title)
        .fontColor(this.currentIndex == index ? $r('app.color.theme_color') : $r('app.color.theme_color_gray'))
    }
    .padding(10)
    .margin(
      {
        top: -15
      }
    )
    .width(70)
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Navigation() {
      Tabs({
        index: this.currentIndex,
        barPosition: BarPosition.End
      }){
        //index
        TabContent() {
          HomeContent({Teachers: $Teachers,form: $form,currentIndex: $currentIndex})
        }
        .tabBar(this.tabBuilder(0, '主页', $rawfile('index/home_select.png'), $rawfile('index/home.png')))

        //发现
        TabContent() {
          FindContent({items: $Teachers,userID: this.user.id,form: this.form})
        }
        .tabBar(this.tabBuilder(1, '找老师', $rawfile('index/search_select.png'), $rawfile('index/search.png')))

        //我
        TabContent() {
          UserContent({login: $login,user: $user})
        }
        .tabBar(this.tabBuilder(2, '我', $rawfile('index/user_select.png'), $rawfile('index/user.png')))

      }
      .margin(0)
      .barMode(BarMode.Fixed)
      .onChange((index) => {
        this.currentIndex = index
      })

    }
    .backgroundColor($r('app.color.background_color_1'))
    .padding(0)
    .margin(0)
    .size({width: '100%', height: '100%'})
    .titleMode(NavigationTitleMode.Mini)
    .title(this.title())
    .hideToolBar(true)
    .hideBackButton(true)
  }



}