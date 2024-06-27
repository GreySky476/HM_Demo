
// Index.ets
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
// 引入 mock
import { MockKit, when, MockSetup } from '@ohos/hamock';
/*
@Preview({
  title: 'Component1',  //预览组件的名称
  deviceType: 'phone',  //指定当前组件预览渲染的设备类型，默认为Phone
  width: 1080,  //预览设备的宽度，单位：px
  height: 2340,  //预览设备的长度，单位：px
  colorMode: 'light',  //显示的亮暗模式，当前支持取值为light
  dpi: 480,  //预览设备的屏幕DPI值
  locale: 'zh_CN',  //预览设备的语言，如zh_CN、en_US等
  orientation: 'portrait',  //预览设备的横竖屏状态，取值为portrait或landscape
  roundScreen: false  //设备的屏幕形状是否为圆形
})
 */

@Preview({
  title: 'buttonPreview'
})
@Component
struct ButtonPre {
  @Prop randomResult: string;
  // 定义 method1 函数
  method1(str: string) {
    return '';
  }
  @MockSetup
  randomName() {
    let mocker: MockKit = new MockKit();
    let mockFunc: object = mocker.mockFunc(this, this.method1);
    this.randomResult = 'hello world';
    // 当 method1 的传值为 test 时，返回设置好的 this.randomResult
    when (mockFunc)('test').afterReturn(this.randomResult);
  }
  build() {
    Button() {
      Text('Next')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .type(ButtonType.Capsule)
    .margin({
      top: 20
    })
    .backgroundColor('#0D9FFB')
    .width('40%')
    .height('5%')
    // 添加跳转事件
    .onClick(() => {
      // 调用 method1
      console.log(this.method1('test'))
      console.log(`Succeeded in clicking the 'Next' button.`);
      // 跳转第二页
      router.pushUrl({ url: 'pages/Second' }).then(() => {
        console.log('Succeeded in jumping to the second page.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
      })
    })
  }
}



@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        ButtonPre()
      }
      .width('100%')
    }
    .height('100%')
  }
}
class Foo {
  static bar() {

  }
}
// 对使用进行规则限制
Foo.bar();

// 对类命名限制
class foo {
  bar(){}
}
