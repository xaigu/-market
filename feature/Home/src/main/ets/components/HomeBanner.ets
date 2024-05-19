import { getBannerListAPI, BannerItem } from '../apis/banner'
import { router } from '@kit.ArkUI'

@Component
export struct HomeBanner {
  private  swiperController:SwiperController=new SwiperController()
  @State bannerList:BannerItem[]=[]
  aboutToAppear(): void {
    this.getbannerList()
  }
  getbannerList=async ()=>{
    try {
      const res = await getBannerListAPI()
      this.bannerList = res.data.result
    } catch (e) {
      console.log('bannerlist:',e)
    }
  }
  build() {
    Stack({alignContent: Alignment.Top}){

        Swiper(this.swiperController){
          ForEach(this.bannerList,(item:BannerItem)=>{
            Image(item.imgUrl)
              .width('100%')
              .aspectRatio(360/240)
          })
        }
        .loop(true)
        .indicator(
          Indicator.dot()
            .itemWidth(8)
            .selectedItemWidth(24)
            .selectedColor('#191919')
        )
      this.SearchBuilder()
    }
  }
  @Builder
  SearchBuilder(){
    Row(){
      Row(){
        Image($r('app.media.home_input_search'))
          .width(16)
        Text('搜索')
          .fontColor('#ffffff')
          .margin({left:8})
          .fontSize(14)
      }
      .width('100%')
      .height(40)
      .backgroundColor('#66191919')
      .borderRadius(20)
      .padding({left:12})
    }
    .height(56)
    .padding({left:16,right:16})
    .width('100%')
    .onClick(()=>{
      router.pushUrl({
        url:'pages/SearchPage'
      })
    })
  }
}