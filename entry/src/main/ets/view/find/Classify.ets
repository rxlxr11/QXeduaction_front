import { Form } from '../../common/bean/Form'
import SubjectData from '../../common/constant/SubjectData'

@Styles function  inputStyle(){
  .size({height: 40,width: 100})
  .backgroundColor($r('app.color.background_color_1'))
  .border({
    width: 1
  })
  .borderRadius(5)
}

@Styles function relative(){
  .height(50)
  .width("100%")
}


function numberConfirm(value: any): boolean{
  try {
    let a = Number(value);
    if (isNaN(a)) {
      throw new Error('Invalid number');
    }
    return true
    // 处理数字逻辑
  } catch (error) {
    // 处理错误情况
    console.error('Conversion error:', error.message);
    return false
  } finally {
    // 可选的清理代码
  }
}


function judge1(value: any, value_link: number): boolean{
  let flag: boolean = false
  if (numberConfirm(value)) {
    if ( Number(value) <= value_link ) {
      flag  = true
    }else {
      flag = false
    }
  }else {
    flag = false
  }
  return flag
}

function judge2(value: any, value_link: number): boolean{
  let flag: boolean = false
  if (numberConfirm(value)) {
    if ( Number(value) >= value_link ) {
      flag  = true
    }else {
      flag = false
    }
  }else {
    flag = false
  }
  return flag
}



const color_1 = $r('app.color.theme_color_blue')
const color_2 = $r('app.color.theme_color_red')

@Component
export default struct Classify {

  @Link form: Form

  @State flag1: boolean = true
  @State flag2: boolean = true
  @State flag3: boolean = true
  @State flag4: boolean = true

  private form_1: Form = new Form()


  build(){
    Column(){
      RelativeContainer(){

        Text("科目")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 5
          })
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
          .id("text1")

        Select(SubjectData.Subject_Name)
          .width(100)
          .height(50)
          .selected(0)
          .font({size: 16, weight:400, family: 'serif', style: FontStyle.Normal })
          .selectedOptionFont({size: 20, weight: 500, family: 'serif', style: FontStyle.Normal })
          .optionFont({size: 16, weight: 400, family: 'serif', style: FontStyle.Normal })
          .onSelect((index:number,value: string)=>{
            this.form_1.subject = value
          })
          .alignRules({
            left: {
              anchor: "text1",
              align: HorizontalAlign.End
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("select1")

        Text("年级")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 5
          })
          .alignRules({
            left: {
              anchor: "__container__",
              align: HorizontalAlign.Center
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("text2")

        Select(SubjectData.Grade_Name)
          .width(100)
          .height(50)
          .selected(0)
          .font({size: 16, weight:400, family: 'serif', style: FontStyle.Normal })
          .selectedOptionFont({size: 20, weight: 500, family: 'serif', style: FontStyle.Normal })
          .optionFont({size: 16, weight: 400, family: 'serif', style: FontStyle.Normal })
          .onSelect((index:number,value: string)=>{
            this.form_1.gender = value
          })
          .alignRules({
            left: {
              anchor: "text2",
              align: HorizontalAlign.End
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("select2")
      }
      .relative()

      RelativeContainer(){
        Text("年龄")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })
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
          .id("text1")

        TextInput()
          .inputStyle()
          .fontSize(14)
          .borderColor(this.flag1?color_1: color_2)
          .onChange((value)=>{
            this.flag1 = judge1(value,this.form_1.age_end)
            if(this.flag1){
              this.form_1.age_start = Number(value)
            }
          })
          .alignRules({
            right: {
              anchor: "text2",
              align: HorizontalAlign.Start
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("input1")

        Text("——")
          .margin(10)
          .alignRules({
            left: {
              anchor: "__container__",
              align: HorizontalAlign.Center
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("text2")

        TextInput()
          .inputStyle()
          .fontSize(14)
          .borderColor(this.flag2 ? color_1: color_2)
          .onChange((value)=>{

              this.flag2 = judge2(value, this.form_1.age_start)
              if (this.flag2) {
                this.form_1.age_end = Number(value)
              }

          })
          .alignRules({
            left: {
              anchor: "text2",
              align: HorizontalAlign.End
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("input2")
      }
      .relative()

      RelativeContainer(){
        Text("薪资")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })
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
          .id("text1")
        TextInput()
          .fontSize(14)
          .inputStyle()
          .borderColor(this.flag3?color_1: color_2)
          .onChange((value)=>{

              this.flag3 = judge1(value, this.form_1.salary_end)
              if (this.flag3) {
                this.form_1.salary_start = Number(value)
              }
          })
          .alignRules({
            right: {
              anchor: "text2",
              align: HorizontalAlign.Start
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("input1")
        Text("——")
          .margin(10)
          .alignRules({
            left: {
              anchor: "__container__",
              align: HorizontalAlign.Center
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("text2")

        TextInput()
          .fontSize(14)
          .inputStyle()
          .borderColor(this.flag4?color_1: color_2)
          .onChange((value)=>{


              this.flag4 = judge2(value, this.form_1.salary_start)
              if (this.flag4) {
                this.form_1.salary_end = Number(value)
              }

          })
          .alignRules({
            left: {
              anchor: "text2",
              align: HorizontalAlign.End
            },
            center: {
              anchor: "__container__",
              align: VerticalAlign.Center
            }
          })
          .id("input2")
      }
      .relative()

      Row(){
        Text("性别")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })
        Text("男")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })
        Radio({value: '男',group: 'gender'})
          .checked(true)
          .onChange((isChecked:boolean)=>{
            if (isChecked){
              this.form_1.gender = '男'
            }
          })
        Text("女")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })

        Radio({value: '女',group: 'gender'})
          .checked(false)
          .onChange((isChecked:boolean)=>{
            if (isChecked){
              this.form_1.gender = '女'
            }
          })

        Text("确定")
          .fontSize(20)
          .fontWeight(500)
          .margin({
            left: 5,
            right: 20
          })
          .fontColor($r('app.color.theme_color_blue'))
          .onClick(()=>{
            this.form = this.form_1;
          })
      }
      .width("100%")
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .margin(3)


    }
    .backgroundColor(Color.White)
  }

}
