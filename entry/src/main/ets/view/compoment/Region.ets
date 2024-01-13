import {CityData,Province,City,Area,three} from '../../common/constant/CityData'

@CustomDialog
export struct RegionDialog {


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
        TextPicker({ range: three.Province, selected: this.select1})
          .onChange((value: string, index: number) => {
            this.province = value;
            this.select1 = index;
            this.select2 = 0;
            this.select3 = 0;
          }).width("33%")
        TextPicker({ range: three.City[this.select1], selected: this.select2})
          .onChange((value: string, index: number) => {
            this.city = value;
            this.select2 = index;
            this.select3 = 0;
          }).width("33%")
        TextPicker({ range: three.Area[this.select1][this.select2], selected: this.select3})
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