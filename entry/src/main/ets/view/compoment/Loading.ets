@CustomDialog
export struct LoadingDialog {

  private controller: CustomDialogController; // 定义controller

  build() {
    Column() {
      LoadingProgress()
        .color(Color.Blue)
        .layoutWeight(1)
        .size({height: 200,width: 200})
    }
  }

}