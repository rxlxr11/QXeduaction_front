import {CityData} from '../../common/constant/CityData'

const Province: string[] = []
const City: string[][] = [[]]
const Area: string[][][] = [[[]]]

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
export default struct CustomDialogCity {

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


  aboutToAppear(){
    console.warn("appear")
    CityData.forEach( (item1,index1) => {
      Province.push(item1.name);
      City[index1] = []
      item1.children.forEach((item2,index2) => {
        City[index1].push(item2.name)
        if (Area[index1]==null)
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
    Column() {
      Text(this.province + this.city + this.area)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)

    }.width('100%').margin({ top: 5 })
  }


}


