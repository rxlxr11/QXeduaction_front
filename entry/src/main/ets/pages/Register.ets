import router from '@ohos.router';
import prompt from '@ohos.prompt';
import {CityData,Province,City,Area} from '../common/constant/CityData'
import {ExInput, rxInput, rxLabel} from '../view/compoment/ExInput'
import AppContext from '@ohos.app.ability.common';
import {ImageButton} from '../view/compoment/ImageButton'
import { User } from '../common/bean/User';
// import { RegionDialog } from '../view/compoment/Region';
import LoginViewModel from '../ViewModel/LoginViewModel'

@CustomDialog
struct CustomDialogExample {


  @Link province: string
  @Link city: string
  @Link area: string

  @Link select1: number
  @Link select2: number
  @Link select3: number
  controller: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在最后
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text('选择地区').fontSize(20).margin({ top: 10, bottom: 10 })
      Row(){
        TextPicker({ range: Province, selected: this.select1})
          .onChange((value: string, index: number) => {
            this.province = value;
            this.select1 = index;
            this.select2 = 0;
            this.select3 = 0;
          }).width("33%")
        TextPicker({ range: City[this.select1], selected: this.select2})
          .onChange((value: string, index: number) => {
            this.city = value;
            this.select2 = index;
            this.select3 = 0;
          }).width("33%")
        TextPicker({ range: Area[this.select1][this.select2], selected: this.select3})
          .onChange((value: string, index: number) => {
            this.area = value;
            this.select3 = index;
          }).width("33%")
      }
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            // this.inputValue = this.textValue
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
    // dialog默认的borderRadius为24vp，如果需要使用border属性，请和borderRadius属性一起使用。
  }
}




@Entry
@Component
struct Register {

  name_label = new rxLabel('name',20,15,35,30,35,5)
  name_input = new rxInput(InputType.Normal,20,'#6b6b6b','#6b9d68',this.name_label)

  email_label = new rxLabel('Email',20,15,35,30,35,5)
  email_input = new rxInput(InputType.Email,20,'#6b6b6b','#6b9d68',this.email_label)

  username_label = new rxLabel('Username',20,15,35,30,35,5)
  username_input = new rxInput(InputType.Normal,20,'#6b6b6b','#6b9d68',this.username_label)

  pwd_label = new rxLabel('Password',20,15,35,30,35,5)
  pwd_input = new rxInput(InputType.Password,20,'#6b6b6b','#6b9d68',this.pwd_label)

  pwd_confirm_label = new rxLabel('Confirm Password',20,15,35,30,35,5)
  pwd_confirm_input = new rxInput(InputType.Password,20,'#6b6b6b','#6b9d68',this.pwd_confirm_label)

  @State province: string = '北京市'
  @State city: string = '市辖区'
  @State area: string = '东城区'
  @State select1: number = 0
  @State select2: number = 0
  @State select3: number = 0

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
      province: $province,
      city: $city,
      area: $area,
      select1: $select1,
      select2: $select2,
      select3: $select3
    }),
    cancel: this.existApp,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false
  })

  aboutToAppear() {
    console.warn("appear")
    CityData.forEach((item1, index1) => {
      Province.push(item1.name);
      City[index1] = []
      item1.children.forEach((item2, index2) => {
        City[index1].push(item2.name)
        if (Area[index1] == null)
          Area[index1] = []
        Area[index1][index2] = []
        item2.children.forEach(item3 => {
          Area[index1][index2].push(item3.name);
        })
      })
    })
  }

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = undefined // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  existApp() {
    console.info('Click the callback in the blank area')
  }

  build() {
    Row() {
      Scroll(){
        Column() {
          Text("创建账户")
            .fontSize(25)
            .fontWeight(FontWeight.Bold)

          Text('已有账户? 登录')
            .fontSize(15)
            .fontColor('#B45223')
            .margin(10)
            .onClick(() => {
              router.pushUrl({
                url: "pages/Login"
              })
            })

          RelativeContainer() {

            Text('地区 ')
              .margin(5)
              .alignRules({
                left: {
                  anchor: "__container__",
                  align: HorizontalAlign.Start
                },
                top: {
                  anchor: "__container__",
                  align: VerticalAlign.Top
                }
              })
              .id("region")


            Button({ type: ButtonType.Normal }) {
              RelativeContainer() {
                Text(this.province + ' ' + this.city + ' ' + this.area)
                  .maxLines(1)
                  .textOverflow({overflow: TextOverflow.Ellipsis})
                  .id("text")
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

                Image($rawfile('index/arrow_down.png'))
                  .size({ width: 25, height: 25 })
                  .id('arrow')
                  .alignRules({
                    right: {
                      anchor: "__container__",
                      align: HorizontalAlign.End
                    },
                    center: {
                      anchor: "__container__",
                      align: VerticalAlign.Center
                    }
                  })
              }
              .size({ width: "100%", height: "100%" })

            }
            .backgroundColor('#f1f2f4')
            .size({
              width: 350,
              height: 40
            })
            .padding({
              left: 20,
              right: 20,
              top: 5,
              bottom: 5
            })
            .borderRadius(5)
            .border({
              width: 1,
              color: Color.Black
            })
            .fontColor(Color.Black)
            .alignRules({
              left: {
                anchor: "__container__",
                align: HorizontalAlign.Start
              },
              bottom: {
                anchor: "__container__",
                align: VerticalAlign.Bottom
              }
            })
            .onClick(() => {
              if (this.dialogController != undefined) {
                this.dialogController.open()
              }
            })
            .id("picker")

          }
          .width("80%")
          .height(80)
          .margin(5)


          ExInput({rx_input:this.name_input}).margin(10)
          ExInput({rx_input:this.email_input}).margin(10)
          ExInput({rx_input:this.username_input}).margin(10)
          ExInput({rx_input:this.pwd_input}).margin(10)
          ExInput({rx_input:this.pwd_confirm_input}).margin(10)

          Button("创建账户")
            .height(50)
            .width(350)
            .fontSize(25)
            .fontColor('#ffffff')
            .backgroundColor('#312d2a')
            .margin({ top: 20 ,bottom: 20})
            .type(ButtonType.Normal)
            .borderRadius(8)
            .onClick(() => {
              let user = new User();
              let reg = new LoginViewModel()
              user.username = this.username_input.Value;
              user.password = this.pwd_input.Value;
              user.email = this.email_input.Value;
              user.region = this.area;
              reg.register(user).then(()=>{
                prompt.showToast({ message: "register success" })
              }).catch((err: string)=>{
                prompt.showToast({ message: err })
              })

            })


        }
        .width('100%')

      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}
