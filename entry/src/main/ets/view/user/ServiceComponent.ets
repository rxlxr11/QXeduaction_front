
import { Service } from '../../common/constant/ServiceData';
import { ImageButton } from '../compoment/ImageButton';

@Builder function RectButton($$: {Image: string | Resource ,Text: string,Color: string}){

  Button({type: ButtonType.Normal}) {

    Row(){
      Image($$.Image)
        .width(45)
        .height(45)

      Text($$.Text)
        .fontColor(Color.White)
    }

  }
  .backgroundColor($$.Color)
  .width(175)
  .height(80)
  .margin(5)
  .borderRadius(8)

}



@Component
export default struct ServiceComponent {

  private serviceList: Service[] = [];
  private startPage: (index: number) => void = (index: number) => {};

  build() {
    Grid() {
      ForEach(this.serviceList, (item: Service, index?: number) => {
        GridItem() {
          RectButton({
            Image: item.Image,
            Text: item.Text,
            Color: item.Color
          })
        }.onClick(() => {
          if (!index) {
            index = 0;
          }
          this.startPage(index);
        })
      }, (item: Service) => JSON.stringify(item))
    }
    .columnsTemplate("1fr 1fr ")     // 设置Grid为2列，并且均分
    .columnsGap(5)                     // 设置列间距为5vp
    .rowsGap(5)                        // 设置行间距为5vp
    .width('100%')
    .height(100)

  }
}