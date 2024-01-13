
import { Subject } from '../../common/constant/SubjectData';
import { ImageButton } from '../compoment/ImageButton';
@Component
export default struct SubjectComponent {



  private subjectList: Subject[] = [];
  private startPage: (index: number) => void = (index: number) => {};

  build() {
    Grid() {
      ForEach(this.subjectList, (item: Subject, index?: number) => {
        GridItem() {
          ImageButton({
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
      }, (item: Subject) => JSON.stringify(item))
    }
    .columnsTemplate("1fr 1fr 1fr 1fr")     // 设置Grid为4列，并且均分
    .columnsGap(5)                     // 设置列间距为5vp
    .rowsGap(5)                        // 设置行间距为5vp
    .width('100%')
    .height(200)
    .backgroundColor(Color.White)
    .borderRadius(5)
  }
}